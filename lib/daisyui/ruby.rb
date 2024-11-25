# require_relative "ruby/version"
require_relative "ruby/upstream"
require_relative "../tailwindcss/ruby"

module Daisyui
  module Ruby
    VERSION = "4"
    # Not used since we override Tailwindcss::Ruby
    # include Tailwindcss::Ruby
    # extend Tailwindcss::Ruby
  end
end
