require 'bigdecimal'

module Quicken
  class Transaction < Foundation
    accessors_for_spec Quicken::Spec::TRANSACTION

    @date_order = [:month,:day,:year]
    
    class << self
      attr_accessor :date_order
    end

    def date=(value)
      items = value.match(/(\d+)[\/|\-](\d+)[\/|\-|'](\d+)/)[1..3]

      result = {}
      date_order = self.class.date_order
      date_order.each_with_index do |v, i|
        result.merge!({ v => items[i] })
      end

      @date = Date.parse("#{result[:year]}-#{result[:month]}-#{result[:day]}", true)
    end
    
    %w(amount investment_price investment_shares_quantity 
       investment_commission split_or_investment_amount).each do |method|
      define_method "#{method}=" do |value|
        instance_variable_set("@#{method}", BigDecimal.new(value.delete(",")))
      end
    end
    
  end
end