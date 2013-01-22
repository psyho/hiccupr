require "spec_helper"

describe Hiccupr::StringRenderer do
  let(:renderer) { isolate(Hiccupr::StringRenderer) }

  it "matches strings" do
    renderer.matches?("foo").should be_true
  end

  it "doesn't match arrays" do
    renderer.matches?([:div]).should be_false
  end

  it "returns the passed string, unchanged" do
    renderer.render("foo").should == "foo"
  end

  it "escapes unsafe content"
end
