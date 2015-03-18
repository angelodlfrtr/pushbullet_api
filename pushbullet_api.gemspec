# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pushbullet_api/version'

Gem::Specification.new do |spec|
  spec.name          = "pushbullet_api"
  spec.version       = PushbulletApi::VERSION
  spec.authors       = ["Angelo Delefortrie"]
  spec.email         = ["angelo.delefortrie@gmail.com"]
  spec.summary       = "Pushbullter rest api ruby wrapper"
  spec.description   = spec.summary
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'rest-client'
  spec.add_dependency 'multi_json'
  spec.add_dependency 'mime-types'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
