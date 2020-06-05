require_relative 'lib/localizable_sanitizer/version'

Gem::Specification.new do |spec|
  spec.name          = "localizable_sanitizer"
  spec.version       = LocalizableSanitizer::VERSION
  spec.authors       = ["Daniel Barden"]
  spec.email         = ["daniel.barden@mhp.com"]

  spec.summary       = "Sanitizes Localizable strings files"
  spec.description   = "Check for missing translation keys"
  spec.homepage      = "https://github.com/dbarden/localizable_verifier"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/dbarden/localizable_verifier"
  spec.metadata["changelog_uri"] = "https://github.com/dbarden/localizable_verifier/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "bin"
  spec.executables   = ["localizable_sanitizer"]
  spec.require_paths = ["lib"]
end
