module Tailwindcss
  module Ruby
    module Upstream
      VERSION = "v2.10.24"

      # rubygems platform name => upstream release filename
      # https://github.com/dobicinaitis/tailwind-cli-extra/
      NATIVE_PLATFORMS = {
        "arm64-darwin" => "tailwindcss-extra-macos-arm64",
        "x64-mingw32" => "tailwindcss-extra-windows-x64.exe",
        "x64-mingw-ucrt" => "tailwindcss-extra-windows-x64.exe",
        "x86_64-darwin" => "tailwindcss-extra-macos-x64",
        "x86_64-linux-gnu" => "tailwindcss-extra-linux-x64",
        "x86_64-linux-musl" => "tailwindcss-extra-linux-x64-musl",
        "aarch64-linux-gnu" => "tailwindcss-extra-linux-arm64",
        "aarch64-linux-musl" => "tailwindcss-extra-linux-arm64-musl",
      }
    end
  end
end
