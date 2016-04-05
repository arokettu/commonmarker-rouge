# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'highmarker/version'

Gem::Specification.new do |spec|
  spec.name          = 'highmarker'
  spec.version       = HighMarker::VERSION
  spec.authors       = ['Anton Smirnov']
  spec.email         = ['sandfox@sandfox.me']

  spec.summary       = 'CommonMarker wrapper with Syntax Highlight'
  spec.homepage      = 'https://github.com/sandfoxme/highmarker'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'commonmarker',    '~> 0.5'

  # don't add these libs as runtime dependencies, they both are kinda optional
  spec.add_development_dependency 'rouge',    '~> 1.10'
  spec.add_development_dependency 'coderay',  '~> 1.1'

  spec.add_development_dependency 'bundler',  '~> 1.11'
  spec.add_development_dependency 'rake',     '~> 10.0'
  spec.add_development_dependency 'rspec',    '~> 3.0'

end
