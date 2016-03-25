# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "busser/testinfra/version"
require "English"

Gem::Specification.new do |gem|
  gem.name          = "busser-testinfra"
  gem.version       = Busser::Testinfra::VERSION
  gem.authors       = ["Jimmy Tang"]
  gem.email         = ["jimmy_tang@rapid7.com"]
  gem.description   = "A Busser runner plugin for testing testinfra"
  gem.summary       = gem.description
  gem.homepage      = "https://github.com/jcftang-r7/busser-testinfra"
  gem.license       = "Apache 2.0"

  gem.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  gem.executables   = []
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "busser", ">= 0.2.0"

  gem.add_development_dependency "aruba"
  gem.add_development_dependency "bundler", "~> 1.3"
  gem.add_development_dependency "countloc"
  gem.add_development_dependency "rake"
  gem.add_development_dependency "simplecov"

  # style and complexity libraries are tightly version pinned as newer releases
  # may introduce new and undesireable style choices which would be immediately
  # enforced in CI
  gem.add_development_dependency "finstyle",  "1.2.0"
  gem.add_development_dependency "cane",      "2.6.2"
end
