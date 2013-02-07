require 'spec_helper'

describe Hiccupr::Renderer do
  verify_contract(:renderer)

  it "renders data using first matching data renderer" do
    renderer = with_renderers [false, ""],
      [false, "hello!"],
      [true,  "<span>bar</span>"]

    renderer.render([:span, "bar"]).should == "<span>bar</span>"
  end

  it "checks if the renderers match and renders" do
    not_matching = data_renderer(false, "")
    matching = data_renderer(true, "hello!")
    renderer = Hiccupr::Renderer.new([not_matching, matching])

    renderer.render("hello!")

    not_matching.should have_received.matches?("hello!")
    not_matching.should_not have_received.render(any_args)

    matching.should have_received.matches?("hello!")
    matching.should have_received.render("hello!", renderer)
  end

  def with_renderers(*matches_text_pairs)
    renderers = matches_text_pairs.map{ |matches, text| data_renderer(matches, text) }
    Hiccupr::Renderer.new(renderers)
  end

  def data_renderer(matches, text)
    fake(:data_renderer, matches?: matches, render: text)
  end
end
