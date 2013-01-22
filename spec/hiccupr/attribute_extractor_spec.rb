require 'spec_helper'

describe Hiccupr::AttributeExtractor do
  let(:extractor) { Hiccupr::AttributeExtractor.new(".", :class) }

  it "does nothing if tag name does not contain the character" do
    extractor.extract("foo#bar", {test: 1}, ["#", "\\."]).should == ["foo#bar", {test: 1}]
  end

  it "extracts the attributes without removing others" do
    extractor.extract("foo.x#bar.xyz", {test: 1}, ["#", "\\."]).should ==
      ["foo#bar", {class: "x xyz", test: 1}]
  end
end
