lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "dotenv/secrets/version"

Gem::Specification.new do |spec|
  spec.name          = "dotenv-secrets"
  spec.version       = Dotenv::Secrets::VERSION
  spec.authors       = ["Steven Eksteen"]
  spec.email         = ["eksoverzero@outlook.com"]

  spec.summary       = ".env files with secret management"
  spec.description   = "Integrating .env files with secret management services"
  spec.homepage      = "https://github.com/eksoverzero/dotenv-secrets"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/eksoverzero/dotenv-secrets/CHANGELOG.md"
  spec.metadata["source_code_uri"] = "https://github.com/eksoverzero/dotenv-secrets"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "dotenv"
  spec.add_dependency "vault"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
