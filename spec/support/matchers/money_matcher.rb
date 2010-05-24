require 'bigdecimal'

module MoneyMatcher
  Spec::Matchers.define :be_money do

    match do |amount|
      amount.should be_instance_of(BigDecimal)
    end

    failure_message_for_should do |amount|
      "expected #{amount} to be money (an instance of BigDecimal)"
    end

    description do |amount|
      "expect #{amount} to be money"
    end

  end
end
