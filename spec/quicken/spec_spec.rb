require "spec_helper"

describe Quicken::Spec  do

  it "should be conform with account section of Qif specification" do
    [ :number, :type  ].each do |i|
      Quicken::Spec::ACCOUNT.keys.should include(i)
    end
  end

  it "should be conform with transaction section of Qif specification" do
    [ 
      :number, :amount, :date, :memo, :cleared, :payee, 
      :address, :category, :flag, :split_category, :split_memo, 
      :split_or_investment_amount, :split_percentage, :investment, 
      :investment_security, :investment_price, 
      :investment_shares_quantity, :investment_commission 
    ].each do |i|
      Quicken::Spec::TRANSACTION.keys.should include(i)
    end
  end

end