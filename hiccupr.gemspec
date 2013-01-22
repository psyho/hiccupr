# -*- encoding: utf-8 -*-
require File.expand_path('../lib/hiccupr/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Adam Pohorecki"]
  gem.email         = ["adam@pohorecki.pl"]
  gem.description   = %q{Implementation of Hiccup in Ruby}
  gem.summary       = %q{This is an implementation of the excellent Clojure templating library in Ruby.}
  gem.homepage      = "http://github.com/psyho/hiccupr"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "hiccupr"
  gem.require_paths = ["lib"]
  gem.version       = Hiccupr::VERSION

  gem.add_dependency 'dependor'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'

  gem.add_development_dependency 'bogus'

  gem.add_development_dependency 'guard'
  gem.add_development_dependency 'guard-rspec'
  gem.add_development_dependency 'guard-ctags-bundler'
  gem.add_development_dependency 'growl'
  gem.add_development_dependency 'libnotify'
  gem.add_development_dependency 'rb-inotify', "~> 0.8.8"
end
