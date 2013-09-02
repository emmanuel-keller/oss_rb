# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'oss_rb/version'

Gem::Specification.new do |spec|
  spec.name          = "oss_rb"
  spec.version       = Oss::VERSION
  spec.authors       = ["Ori Pekelman", "Emmanuel Keller"]
  spec.email         = ["ori@pekelman.com", "ekeller@open-search-server.com"]
  spec.description   = %q{OpenSearchServer Ruby Client}
  spec.summary       = %q{A Ruby Client library for OpenSearchServer}
  spec.homepage      = "https://github.com/jaeksoft/oss_rb/"
  spec.license       = "MIT"

  spec.metadata      = { "Issues" => "https://github.com/jaeksoft/oss_rb/issues" }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency 'activesupport'
  spec.add_dependency 'rest-client'
end
