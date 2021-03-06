# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'file_finder/version'

Gem::Specification.new do |spec|
  spec.name          = "file_finder"
  spec.version       = FileFinder::VERSION
  spec.authors       = ["Logan Hasson"]
  spec.email         = ["logan.hasson@gmail.com"]
  spec.summary       = "Utility for loading support files within gems."
  spec.homepage      = "http://github.com/loganhasson/file_finder.git"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
