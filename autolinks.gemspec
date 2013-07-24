# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'autolinks/version'

Gem::Specification.new do |gem|
  # Details
  gem.name          = "autolinks"
  gem.version       = Autolinks::VERSION
  gem.authors       = ["Jay Sanders"]
  gem.email         = ["mindtonic@gmail.com"]
  gem.description   = "Autolinks automatically replaces urls, emails, twitter handles and hashtags with html links"
  gem.summary       = ""
  gem.homepage      = "http://github.com/mindtonic/autolinks"
  gem.license       = "MIT"
  # Files
  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  # Development
  gem.add_development_dependency "rspec", "~> 2.6"
  gem.add_development_dependency "ffaker"
  # Dependencies
  gem.add_dependency "sanitize"
end