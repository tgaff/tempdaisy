# AGENTS.md — daisyui-ruby

Hand-off doc. Originally written 2026-09-12 (conversion was broken then); **updated 2026-09-12 after the conversion was completed**. Read this first.

## Mission

`daisyui-ruby` is to `tailwindcss-ruby` what `tailwind-cli-extra` is to `tailwindcss`: a self-contained `tailwindcss` executable with **DaisyUI baked in**, wrapped as a ruby gem. It pairs with the sibling `daisyui-rails` gem (`~/devel/Scatter/daisyui2/daisyui-rails`), which handles Rails integration. Goal: DaisyUI + Tailwind in Rails with no Node install and no JS bundler, exactly the way `tailwindcss-rails` works.

## Current state: conversion COMPLETE on branch `daisyui` (uncommitted as of this update)

The recommended path from the original hand-off was executed:

- Branch `daisyui` created from upstream tag **v4.3.3** (fresh `flavorjones/tailwindcss-ruby`; the old broken commits `4a3747f`/`5a8bf9c` on `main` were NOT merged — crib only, they're obsolete).
- `lib/tailwindcss/ruby/upstream.rb`: `VERSION = "v2.10.24"`, `NATIVE_PLATFORMS` pointed at `tailwindcss-extra-*` assets with the gnu/musl split, no armv7.
- `lib/tailwindcss/ruby.rb`: `GEM_NAME = "daisyui-ruby"` (shadow design preserved — see below).
- `lib/tailwindcss/ruby/version.rb`: gem version `2.10.24` (tracks tailwind-cli-extra version; add a 4th digit for gem-only fixes).
- `daisyui-ruby.gemspec` replaces `tailwindcss-ruby.gemspec` (metadata: homepage `https://github.com/tgaff/tempdaisy` — that's the `temp` git remote).
- `rakelib/package.rake`: download URL → `dobicinaitis/tailwind-cli-extra`; **`check` task rewritten** to read per-asset `assets[].digest` (`"sha256:..."`) from the GitHub releases API (`/releases/tags/<VERSION>`) because tailwind-cli-extra publishes no `sha256sums.txt`.
- `README.md` rewritten; `CHANGELOG.md` has a v2.10.24 entry.
- Verified working: `rake test` green (8 runs), `rake gem:x86_64-darwin` built `pkg/daisyui-ruby-2.10.24-x86_64-darwin.gem`, and the binary compiles `@plugin "daisyui"` CSS (emits `daisyUI 5.7.37`, Tailwind 4.3.3). Checksum validation ran clean during download.
- Host here is **Intel mac (x86_64)** — use `gem:x86_64-darwin` locally; `exe/arm64-darwin/tailwindcss` on disk can't execute (bad CPU type).

## Design decision: shadow `Tailwindcss::Ruby` (unchanged)

The fork keeps the module name `Tailwindcss::Ruby` (with `GEM_NAME = "daisyui-ruby"`) rather than a parallel `Daisyui::Ruby` API. Drop-in replacement for `tailwindcss-rails` 3.x/4.x. **Users must not have both `tailwindcss-ruby` and `daisyui-ruby` in the same bundle** — bundler can't express the conflict; README documents it.

## Known nits / remaining work

- Changes on `daisyui` are **not yet committed/pushed** (push remote: `temp` = `git@github.com:tgaff/tempdaisy.git`).
- `bundle exec rake` (default) runs `standard`, which fails even on pristine upstream v4.3.3 files (`exe/tailwindcss` STDERR style, `URI.open` in package.rake, etc.). **Upstream CI only runs `rake test`** (`.github/workflows/ci.yml`), so this is pre-existing lint debt, not a regression. Don't chase it.
- `pkg/` contains stale `daisyui-ruby-4-*.gem` artifacts from the old broken fork (Nov 2024) — clobber/rebuild before release.
- Bumping versions: bump BOTH `lib/tailwindcss/ruby/upstream.rb` `VERSION` (tag incl. `v`) and `lib/tailwindcss/ruby/version.rb`. Verify platform asset names against `https://api.github.com/repos/dobicinaitis/tailwind-cli-extra/releases/latest` — releases happen every few days via bot.
- Windows ships two gems (`x64-mingw32`, `x64-mingw-ucrt`) with the same binary — don't merge.
- `TAILWINDCSS_INSTALL_DIR` env escape hatch still works (from upstream `Tailwindcss::Ruby.executable`).

## Commands

- `bundle exec rake test` — tests (what CI runs)
- `bundle exec rake gem:x86_64-darwin` — download (with checksum validation) + build local platform gem
- `bundle exec rake gem:<platform>` / `rake package` — other platforms / all
- Smoke test: build a CSS file with `@import "tailwindcss"; @plugin "daisyui";` and run `exe/<platform>/tailwindcss -i input.css -o out.css`

## Notes

- Tailwind v4 / daisyUI 5 are CSS-first config (`@import "tailwindcss"; @plugin "daisyui";`) — no `tailwind.config.js`, no Node-resolvable daisyui package needed (verified empirically).
- Old experiment dirs (reference only, don't confuse): `~/devel/Scatter/daisyui-rails` (abandoned full tailwindcss-rails fork — its gemspec is still named `tailwindcss-rails`), `~/devel/Scatter/daisyui-ruby` (empty skeleton), `~/devel/Scatter/subfolder-version` (subtree experiment). Workspace overview: `~/devel/Scatter/AGENTS.md`.
