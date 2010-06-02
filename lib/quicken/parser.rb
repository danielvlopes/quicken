module Quicken

  class Parser
    attr_accessor :file, :date_format, :transactions, :account

    def initialize(file, date_format=nil)
      @date_format = date_format
      @file = file
      @transactions_attrs = []
      @account_attrs = {}
    end

    def parse!
      section = nil

      File.foreach(@file) do |line|
        if line =~ /^\!(\S+)/
          section = extract_section($1)
          next
        end

        (section == :account) ? parse_account(line) : parse_transactions(line)
      end

      build_objects
      self
    end

  private

    def build_objects
      @account = Quicken::Account.new(@account_attrs) unless @account_attrs.empty?
      @transactions = @transactions_attrs.collect do |t|  
        t.merge!({:date_format=>@date_format}) unless @date_format.nil?
        Quicken::Transaction.new(t)
      end
    end

    def parse_transactions(line)
      Quicken::Spec::TRANSACTION.each do |spec, rule|
        if line =~ /^\^/
          @transactions_attrs << @transaction unless @transaction.nil?
          @transaction = nil
        elsif line =~ rule
          @transaction ||= {}
          @transaction.merge!({ spec => $1.chomp })
        end
      end
    end

    def parse_account(line)
      Quicken::Spec::ACCOUNT.each do |spec, rule|
        next unless line =~ rule
        @account_attrs.merge!({ spec => $1 })
        break
      end
    end

    def extract_section(section)
      section.gsub("Type:","").downcase.to_sym
    end

  end

end