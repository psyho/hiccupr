require 'spec_helper'

describe "Rendering" do
  it "renders strings" do
    Hiccupr.render("hello!").should == "hello!"
  end

  it "renders simple tags" do
    Hiccupr.render([:div, "hello!"]).should == "<div>hello!</div>"
  end

  it "renders nested data structures" do
    Hiccupr.render([:div, [:p, "foo"], [:p, "bar"]]).should == "<div><p>foo</p><p>bar</p></div>"
  end

  it "renders tags with attributes" do
    Hiccupr.render([:div, {foo: "bar"}, "hello!"]).should == '<div foo="bar">hello!</div>'
  end

  it "renders tags with classes" do
    Hiccupr.render(["div.foo.bar", "hello!"]).should == '<div class="foo bar">hello!</div>'
  end

  it "renders tags with ids" do
    Hiccupr.render(["div#foo#bar", "hello!"]).should == '<div id="foo bar">hello!</div>'
  end

  it "assumes tag name is span" do
    Hiccupr.render(["#foo#bar", "hello!"]).should == '<span id="foo bar">hello!</span>'
  end

  it "renders tags with classes and ids" do
    Hiccupr.render(["div#foo.bar", "hello!"]).should == '<div class="bar" id="foo">hello!</div>'
  end
end
