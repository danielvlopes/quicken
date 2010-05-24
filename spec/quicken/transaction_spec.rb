require "spec_helper"

describe Quicken::Transaction do
  should_be_child_of_foundation

  context "date" do
    it "should parse dates in Date instances" do
      transaction.date.should == Date.civil(2010,4,19)
    end

    it "should use date_order as setting for conversion" do
      Quicken::Transaction.date_order = [:day,:month,:year]
      t = transaction({:date=>"19/06/10"})
      t.date.should == Date.civil(2010,6,19)
    end

    it "should accept the '9 format for year" do
      t = transaction({:date=>"4/1'09"})
      t.date.should == Date.civil(2009,4,1)
    end

    it "should accept - as separator" do
      t = transaction({:date=>"12-25-09"})
      t.date.should == Date.civil(2009,12,25)
    end

    after :each do
      Quicken::Transaction.date_order = [:month,:day,:year] # reset to default if any spec change it
    end
  end

  context "money fields" do
    subject { transaction(
      :investment_price           => "234.30",
      :investment_shares_quantity => "3,000.23",
      :investment_commission      => "2120.18",
      :split_or_investment_amount => "340.12"
    )}

    specify { subject.amount.should be_money }
    specify { subject.investment_price.should be_money }
    specify { subject.investment_shares_quantity .should be_money }
    specify { subject.investment_commission.should be_money }
    specify { subject.split_or_investment_amount.should be_money }
  end

  def transaction(attrs={})
   Quicken::Transaction.new({
     :date=>"04/19/10",
     :amount=>"6960.00",
     :number=>"0002593",
     :memo=>"TED 790.234.526-15"
    }.merge(attrs))
  end

end