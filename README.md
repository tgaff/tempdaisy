# Daisyui::Ruby — `daisyui-ruby`

A self-contained `tailwindcss` executable **with daisyUI included**, wrapped up in a ruby gem.

This gem is a fork of [`tailwindcss-ruby`](https://github.com/flavorjones/tailwindcss-ruby) that swaps the upstream binary for the [tailwind-cli-extra](https://github.com/dobicinaitis/tailwind-cli-extra) build: the official Tailwind CSS CLI with the [daisyUI](https://daisyui.com/) plugin bundled. No Node install, no JS bundler, no `daisyui` npm package required.

It intentionally keeps the `Tailwindcss::Ruby` module and executable interface, so it works as a **drop-in replacement** for `tailwindcss-ruby` — including with [`tailwindcss-rails`](https://github.com/rails/tailwindcss-rails).

## ⚠️ Do not install both gems

Because `daisyui-ruby` shadows `tailwindcss-ruby`'s API, you must **not** have `tailwindcss-ruby` and `daisyui-ruby` in the same bundle. Replace one with the other:

```ruby
# Gemfile
gem "daisyui-ruby" # instead of gem "tailwindcss-ruby"
gem "tailwindcss-rails"
```

## Usage

Tailwind v4 / daisyUI 5 are CSS-first — no `tailwind.config.js` needed:

```css
@import "tailwindcss";
@plugin "daisyui";
```

Everything else behaves exactly like `tailwindcss-ruby` (see [that gem's README](https://github.com/flavorjones/tailwindcss-ruby#table-of-contents) for full documentation, including the `TAILWINDCSS_INSTALL_DIR` escape hatch).

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add daisyui-ruby
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install daisyui-ruby
```

Supported platforms (one native gem per platform, selected automatically):

- arm64-darwin (macos-arm64)
- x86_64-darwin (macos-x64)
- x86_64-linux-gnu (linux-x64)
- x86_64-linux-musl (linux-x64-musl)
- aarch64-linux-gnu (linux-arm64)
- aarch64-linux-musl (linux-arm64-musl)
- x64-mingw32 (windows-x64)
- x64-mingw-ucrt (windows-x64)

## Versioning

The gem version tracks the [tailwind-cli-extra release](https://github.com/dobicinaitis/tailwind-cli-extra/releases) it packages (e.g. gem `2.10.24` ships tailwindcss-extra `v2.10.24`, which contains Tailwind CSS 4.3.3 + daisyUI 5.7.37).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then:

- `bundle exec rake` — run tests and lint (standard)
- `bundle exec rake download` — download all platform binaries into `exe/`
- `bundle exec rake package` — build the vanilla gem plus one gem per platform
- `bundle exec rake gem:arm64-darwin` — build a single platform gem

## Credits

- Upstream gem: [tailwindcss-ruby](https://github.com/flavorjones/tailwindcss-ruby) by Mike Dalessio (and the Rails team's [tailwindcss-rails](https://github.com/rails/tailwindcss-rails))
- Binary: [tailwind-cli-extra](https://github.com/dobicinaitis/tailwind-cli-extra) by dobicinaitis
- CSS framework: [Tailwind CSS](https://tailwindcss.com/), [daisyUI](https://daisyui.com/)
