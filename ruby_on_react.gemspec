
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ruby_on_react/version"

Gem::Specification.new do |spec|
  spec.name          = "ruby_on_react"
  spec.version       = RubyOnReact::VERSION
  spec.authors       = ["Alexandre Moutapam"]
  spec.email         = ["moutapamalexandre@gmail.com"]
  spec.summary       = "no summary"
  spec.description   = "ruby_on_react is a Command Line Interface tool that automates React-based project's workflow"
  spec.homepage      = 'https://rubygems.org/gems/ruby_on_react'
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)

    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = "https://github.com/alexombre/ruby_on_react"
    spec.metadata["changelog_uri"] = "https://github.com/alexombre/ruby_on_react/blob/master/CODE_OF_CONDUCT.md"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.files +=
  spec.bindir        = "exe"
  spec.require_paths = ["lib","assets"]
  spec.executables = ["react"]
  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "thor", "~> 0.20"
  spec.add_development_dependency "dotenv"
end
