# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'array_form_helper/version'

Gem::Specification.new do |spec|
  spec.name          = 'array_form_helper'
  spec.version       = ArrayFormHelper::VERSION
  spec.authors       = ['Yuji Yaginuma']
  spec.email         = ['yuuji.yaginuma@gmail.com']
  spec.summary       = %q{TODO: Write a short summary. Required.}
  spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'actionpack', '>= 4.0'
  spec.add_development_dependency 'activemodel', '>= 4.0'
  spec.add_development_dependency 'activesupport', '>= 4.0'
  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'sqlite3', '~> 1.3.3'
  spec.add_development_dependency 'coveralls'
end
