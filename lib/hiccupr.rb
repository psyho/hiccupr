require "dependor"
require "dependor/shorty"

Dir[File.expand_path("../hiccupr/**/*.rb", __FILE__)].each { |f| require f }

module Hiccupr
  def self.hello
    puts "hello"
  end

  def self.render(data)
    injector.renderer.render(data)
  end

  private

  def self.injector
    @injector ||= Injector.new
  end
end
