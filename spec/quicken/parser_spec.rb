require "spec_helper"

describe Quicken::Parser do
  let (:file) do
    Quicken::Parser.new('spec/fixtures/default.qif')
  end

  describe "when parse" do

    context "account section" do
      it "should return the account" do
        file.account.should == Quicken::Account.new({:number=>"0833_5710633", :type=>"Bank"})
      end

      it "should return nil when the file don't have an account" do
        qif = Quicken::Parser.new('spec/fixtures/money.qif')
        qif.account.should be_nil
      end
    end

    context "transactions section" do
      it "should return the transactions" do
        file.transactions.should_not be_empty
      end
      
      it "should map each transaction to Transaction objects" do
        file.transactions.first.should be_instance_of(Quicken::Transaction)
        file.transactions.size.should be(9)
      end
      
    end
  end

end