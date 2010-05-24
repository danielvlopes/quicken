require "spec_helper"

class Foo < Quicken::Foundation
  ACCOUNT = {
    :number => /^N(.+)/,
    :type => /^T(.+)/
  }

  accessors_for_spec ACCOUNT
end

describe Quicken::Foundation do

  describe "when create" do

    it "should receive args and define each one as attribute" do
      foo = Foo.new({:number=>"0833_5710633", :type=>"Bank"})
      foo.number.should == "0833_5710633"
      foo.type.should == "Bank"
    end

    it "should have accessors based on his SPEC" do
      foo = Foo.new

      Foo::ACCOUNT.each do |key,item|
        foo.should respond_to(key)
        foo.should respond_to("#{key}=")
      end
    end

    it "should skip the attributes that doesn't fit in SPEC" do
      account = Foo.new({:number=>"0833_5710633", :anything=>"blabla"})
      account.number.should == "0833_5710633"
      account.should_not respond_to(:anything)
    end

  end
end