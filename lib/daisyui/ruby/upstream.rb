module Daisyui
  module Ruby
    module Upstream
      # constants describing the upstream tailwindcss project
      VERSION = "v4.12.14"
      # rubygems platform name => upstream release filename
      # see https://github.com/dobicinaitis/tailwind-cli-extra/
      NATIVE_PLATFORMS = {
        "arm64-darwin" => "tailwindcss-extra-macos-arm64",
        "x64-mingw32" => "tailwindcss-extra-windows-x64.exe",
        "x64-mingw-ucrt" => "tailwindcss-extra-windows-x64.exe", # using same as above because upstream did
        "x86_64-darwin" => "tailwindcss-extra-macos-x64",
        "x86_64-linux" => "tailwindcss-extra-linux-x64",
        "aarch64-linux" => "tailwindcss-extra-linux-arm64",
        "arm-linux" => "tailwindcss-extra-linux-armv7"
      }
    end
  end
end
