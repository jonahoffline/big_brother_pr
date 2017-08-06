# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'big_brother_pr/version'

Gem::Specification.new do |spec|
  spec.name          = 'big_brother_pr'
  spec.version       = BigBrotherPR::VERSION
  spec.authors       = ['Jonah Ruiz']
  spec.email         = ['jonah@pixelhipsters.com']

  spec.summary       = %q{A Ruby client and library for ITS/DTOP's Traffic Cameras API.}
  spec.description   = %q{A Ruby client and library for ITS/DTOP's Traffic Cameras API.}
  spec.homepage      = 'https://github.com/jonahoffline/big_brother_pr'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.15.3'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry'
  spec.add_dependency 'httparty', '~> 0.15.6'
  spec.add_dependency 'activesupport', '~> 5.1.3'
  spec.add_dependency 'geocoder', '~> 1.4.4'
end
