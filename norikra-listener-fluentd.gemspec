# coding: utf-8

Gem::Specification.new do |spec|
  spec.name          = "norikra-listener-fluentd"
  spec.version       = "0.0.1"
  spec.authors       = ["TAGOMORI Satoshi"]
  spec.email         = ["tagomoris@gmail.com"]
  spec.summary       = %q{Norikra listener plugin to send events to Fluentd}
  spec.homepage      = "https://github.com/tagomoris/norikra-listener-fluentd"
  spec.license       = "GPLv2"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.platform      = Gem::Platform.new("java")

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_runtime_dependency "norikra", ">= 1.3.0"
  spec.add_runtime_dependency "fluent-logger"
end
