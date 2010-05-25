require "spec_helper"

describe Quicken::Parser do
  let (:file) do
    qif = Quicken::Parser.new('spec/fixtures/default.qif').parse!
  end

  context "account section" do
    it "should return the account" do
      file.account.should == Quicken::Account.new({:number=>"0833_5710633", :type=>"Bank"})
    end

    it "should return nil when the file don't have an account" do
      qif = Quicken::Parser.new('spec/fixtures/ms_money.qif').parse!
      qif.account.should be_nil
    end
  end

  context "transactions section" do
    it "should return the transactions" do
      file.transactions.should_not be_empty
    end

    it "should map each transaction to Transaction objects" do
      file.transactions.first.should be_instance_of(Quicken::Transaction)
      file.transactions.size.should be(4)
    end

    it "should remove carriage return" do
      qif = Quicken::Parser.new('spec/fixtures/ms_money.qif').parse!
      qif.transactions.first.payee.should_not match(/\r/)
    end

    describe "regard to date_format" do
      it "should delegate this to each transaction" do
        qif = Quicken::Parser.new('spec/fixtures/bco_real.qif', [:day, :month, :year]).parse!
        qif.transactions.first.date.should == Date.civil(2010, 04, 19)
      end

      it "should use default value when didn't receive the format" do
        qif = Quicken::Parser.new('spec/fixtures/default.qif').parse!
        qif.transactions.first.date.should == Date.civil(2010, 04, 19)
      end
    end

  end
end