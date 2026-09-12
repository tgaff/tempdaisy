# frozen_string_literal: true

require_relative "lib/tailwindcss/ruby/version"

Gem::Specification.new do |spec|
  spec.name = "daisyui-ruby"
  spec.version = Tailwindcss::Ruby::VERSION
  spec.authors = ["Travis Gaff", "Mike Dalessio", "David Heinemeier Hansson"]
  spec.email = ["tgaff@noreply.github.com"]

  spec.summary = "A self-contained `tailwindcss` executable with daisyUI included."
  spec.description = "Like the tailwindcss-ruby gem, but the bundled executable is the tailwind-cli-extra build of the Tailwind CSS CLI with the daisyUI plugin included. Provides the Tailwindcss::Ruby module as a drop-in replacement -- do not install both this gem and tailwindcss-ruby in the same bundle."
  spec.homepage = "https://github.com/tgaff/tempdaisy"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/main/CHANGELOG.md"
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.files = Dir["lib/**/*", "LICENSE.txt", "LICENSE-DEPENDENCIES", "README.md"]
  spec.bindir = "exe"
  spec.executables << "tailwindcss"
  spec.require_paths = ["lib"]
end
