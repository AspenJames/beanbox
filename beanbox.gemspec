
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "beanbox/version"

Gem::Specification.new do |spec|
  spec.name          = "beanbox"
  spec.version       = Beanbox::VERSION
  spec.authors       = ["Aspen James"]
  spec.email         = ["aspenjames@tqca.org"]

  spec.summary       = "Shows Bean Box's top selling coffees"
  spec.description   = "Lists Seattle's top selling coffees on beanbox.co with the option to view further information via a command-line interface."
  spec.homepage      = "https://github.com/AspenJames/beanbox"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_runtime_dependency "nokogiri"

end
