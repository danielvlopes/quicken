require 'bigdecimal'

module Quicken

  class Transaction < Foundation
    accessors_for_spec Quicken::Spec::TRANSACTION

    def initialize(attrs)
      @date_format = attrs.delete(:date_format) || [:month,:day,:year]
      super(attrs)
    end

    def date=(value)
      parts = extract_date_parts(value)
      @date = Date.parse("#{parts[:year]}-#{parts[:month]}-#{parts[:day]}", true)
    end

    %w(amount investment_price investment_shares_quantity
       investment_commission split_or_investment_amount).each do |method|
      define_method "#{method}=" do |value|
        instance_variable_set("@#{method}", BigDecimal.new(value.delete(",")))
      end
    end

  private
    def extract_date_parts(date)
      parts  = date.match(/(\d+)[\/|\-](\d+)[\/|\-|'](\d+)/)[1..3]
      result = {}
      @date_format.each_with_index { |v, i| result.merge!({ v => parts[i] }) }
      result
    end
  end

end