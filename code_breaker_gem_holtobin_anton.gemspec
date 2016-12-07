# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'code_breaker_gem_holtobin_anton/version'

Gem::Specification.new do |spec|
  spec.name          = "code_breaker_gem_holtobin_anton"
  spec.version       = CodeBreakerGemHoltobinAnton::VERSION
  spec.authors       = ["HoltobinAnton"]
  spec.email         = ["antoshkabest@ua.fm"]

  spec.summary       = %q{Second gem }
  spec.description   = %q{Second gem }
  spec.homepage      = ""
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.


  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
end
