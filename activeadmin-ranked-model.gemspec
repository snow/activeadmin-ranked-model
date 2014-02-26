# encoding: utf-8

# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'activeadmin-ranked-model/version'

Gem::Specification.new do |gem|
  gem.name          = "activeadmin-ranked-model"
  gem.version       = Activeadmin::RankedModel::VERSION
  gem.authors       = ["Björn Wolf"]
  gem.email         = ["bjoern@dreimannzelt.de"]
  gem.description   = %q{Drag and drop sort interface for ActiveAdmin tables for ranked-model enhanced models}
  gem.summary       = %q{Drag and drop sort interface for ActiveAdmin tables for ranked-model enhanced models}
  gem.homepage      = "https://github.com/dreimannzelt/activeadmin-ranked-model"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{  ^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'activeadmin', '>= 0.4'
  gem.add_dependency 'ranked-model'
end
