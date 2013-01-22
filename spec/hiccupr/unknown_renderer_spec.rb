require "spec_helper"

describe Hiccupr::UnknownRenderer do
  let(:renderer) { isolate(Hiccupr::UnknownRenderer) }

  it "matches everything" do
    renderer.matches?("foo").should be_true
    renderer.matches?([:div]).should be_true
    renderer.matches?(nil).should be_true
    renderer.matches?(Object.new).should be_true
  end

  it "returns always an empty string" do
    renderer.render("foo").should == ""
  end
end

