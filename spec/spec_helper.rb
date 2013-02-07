require 'bogus/rspec'
require 'dependor/rspec'

require File.expand_path("../../lib/hiccupr.rb", __FILE__)

RSpec.configure do |c|
  c.color_enabled = true
end

Bogus.configure do |c|
  c.search_modules = Hiccupr::Injector.look_in_modules
end

Bogus.fakes do
  fake :data_renderer, class: proc{Hiccupr::StringRenderer} do
    matches? false
    render ""
  end
end
