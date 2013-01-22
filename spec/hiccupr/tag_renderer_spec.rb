require "spec_helper"

describe Hiccupr::TagRenderer do
  fake(:tag_extractor)
  fake(:renderer)

  let(:tag_renderer) { isolate(Hiccupr::TagRenderer) }

  before do
    stub(tag_extractor).extract([:div, {foo: "bar"}, "hello!"]) { ["div", {foo: "bar"}, ["hello!"]] }
    stub(renderer).render("hello!") { "hello!" }
  end

  it "doesn't match strings" do
    tag_renderer.matches?("foo").should be_false
  end

  it "matches arrays" do
    tag_renderer.matches?([:div]).should be_true
  end

  it "serializes the tag" do
    tag_renderer.render([:div, {foo: "bar"}, "hello!"], renderer).should ==
      %Q{<div foo="bar">hello!</div>}
  end
end

