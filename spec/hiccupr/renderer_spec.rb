require 'spec_helper'

describe Hiccupr::Renderer do
  it "renders data using first matching renderer" do
    first = fake(matches?: false)
    second = fake(matches?: true, render: "foo")
    third = fake(matches?: true, render: "bar")

    renderer = Hiccupr::Renderer.new([first, second, third])

    renderer.render(:something).should == "foo"
  end
end
