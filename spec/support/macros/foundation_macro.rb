module FoundationMacro

  def should_be_child_of_foundation
    it "should be a child of Quicken::Foundation" do
      klass = described_class
      klass.ancestors.should include(Quicken::Foundation)
    end
  end

end