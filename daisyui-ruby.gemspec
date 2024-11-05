# frozen_string_literal: true

require_relative "lib/tailwindcss/ruby/version"

Gem::Specification.new do |spec|
  spec.name = "daisyui-ruby"
  spec.version = Tailwindcss::Ruby::VERSION
  spec.authors = ["Authors of the upstream Tailwindcss-ruby gem and Travis Gaff"]
  spec.email = ["tgaff@noreply.github.com"]

  spec.summary = "A self-contained `tailwindcss` executable including Daisy UI."
  spec.description = "Similar to the tailwindcss-ruby gem with the addition of Daisy UI"
  spec.homepage = "https://github.com/tgaff"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/flavorjones/tailwindcss-ruby/blob/main/CHANGELOG.md"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files = Dir["lib/**/*", "LICENSE.txt", "LICENSE-DEPENDENCIES", "README.md"]
  spec.bindir = "exe"
  spec.executables << "tailwindcss"
  spec.require_paths = ["lib"]
end
