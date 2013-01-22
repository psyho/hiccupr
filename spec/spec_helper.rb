require 'bogus/rspec'
require 'dependor/rspec'

require File.expand_path("../../lib/hiccupr.rb", __FILE__)

RSpec.configure do |c|
  c.color_enabled = true
  c.mock_with :rr
end

Bogus.configure do |c|
  c.search_modules = Hiccupr::Injector.look_in_modules
end
