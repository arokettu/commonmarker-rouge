# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'commonmarker/rouge/version'

Gem::Specification.new do |spec|
  spec.name          = 'commonmarker-rouge'
  spec.version       = CommonMarker::Rouge::VERSION
  spec.authors       = ['Anton Smirnov']
  spec.email         = ['sandfox@sandfox.me']

  spec.summary       = 'CommonMarker wrapper with Rouge syntax highlighter'
  spec.homepage      = 'https://sandfox.dev/commonmarker-rouge.html'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.0.0'

  spec.add_dependency 'commonmarker', '>= 0.18.0', '< 1.0'
  spec.add_dependency 'rouge',        '>= 1.10', '< 4'

  spec.add_development_dependency 'bundler',  '>= 1.11'
  spec.add_development_dependency 'rake',     '~> 12.0'
  spec.add_development_dependency 'rspec',    '~> 3.0'
  spec.add_development_dependency 'codeclimate-test-reporter'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'pry'
end
