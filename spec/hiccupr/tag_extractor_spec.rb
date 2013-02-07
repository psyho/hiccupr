require "spec_helper"

describe Hiccupr::TagExtractor do
  let(:attribute_extractors) { [attr_extractor("\\."), attr_extractor("#")] }
  let(:all_chars) { ["\\.", "#"] }

  let(:extractor) { isolate(Hiccupr::TagExtractor) }

  before do
    attribute_extractors.each do |e|
      stub(e).extract(anything, anything, all_chars) { [:tag_name, {foo: "bar"}] }
    end
  end

  it "returns the first element as tag name" do
    extractor.extract([:div, "hello"]).first.should == :tag_name
  end

  it "returns the content as last element" do
    extractor.extract([:div, "hello"]).last.should == ["hello"]
  end

  it "returns the attributes as middle element" do
    extractor.extract([:div, "hello"])[1].should == {foo: "bar"}
  end

  it "assumes the tag names is span if missing" do
    mock(attribute_extractors.last).extract(:tag_name, {foo: "bar"}, all_chars) { ["", {foo: "bar"}] }

    extractor.extract([:div, "hello"]).first.should == 'span'
  end

  def attr_extractor(char)
    fake(:attribute_extractor, character: char)
  end
end
