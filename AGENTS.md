# Repository Guidelines

## Project Structure & Module Organization

- Hugo site with Tailwind CSS 4 (and Flowbite) and Cloudflare Pages Functions.
- Key paths:
  - `content/` (Markdown pages, kebab-case section folders)
  - `layouts/` (Go templates, `_partials/`)
  - `assets/css/main.css` (Tailwind 4 source; keep bespoke CSS here)
  - `static/` (public assets; favicons are downloaded, gitignored)
  - `functions/` (Pages Functions, TypeScript)
  - `public/`, `resources/` (build output, gitignored; never edit by hand)
- Config lives in `hugo.yaml`. Tooling is defined in `flake.nix` (`default` and
  `ci` dev shells) and `package.json` (pnpm).

## Build, Test, and Development Commands

- `nix develop` — enter dev shell (Hugo, Node, pnpm, Wrangler, LSPs).
- `pnpm install` — install Node dev tools.
- `pnpm run dev` — download favicons and run `hugo server` at
  `http://localhost:1313`.
- `pnpm run format` — apply Prettier formatting.
- `pnpm run build` — clean, download favicons, `hugo build --gc --minify`.
- `pnpm run check` — Prettier check, TypeScript type check, then build.
- `pnpm run dev-serve` — build and serve `public/` with Wrangler to test Pages
  Functions (needs `PLAUSIBLE_SCRIPT_ID` in `.dev.vars`).

## Coding Style & Naming Conventions

- Indentation: 2 spaces (`.editorconfig`).
- Formatting: Prettier (`.prettierrc.yaml`) with `prettier-plugin-go-template`
  and Tailwind class sorting; 80-character prose wrapping.
- Partial names are lowercase with hyphens (e.g. `page--header.html`).
- Stick to Tailwind utility classes.

## Testing Guidelines

- `pnpm run check` must pass (CI runs it via `nix develop .#ci`).
- When editing templates or content, verify the rendered page locally
  (`pnpm run dev`) and inspect responsive breakpoints.

## Commit & Pull Request Guidelines

- Use Conventional Commits (e.g. `feat: add hero subheading`,
  `fix(ui): button contrast`). This repository is released via release-please.
- PRs should describe user-facing impact, link related issues, and include
  screenshots for visual changes.

## Deployment & Security

- Cloudflare Pages runs `./deploy.sh` (output: `public`), which derives
  `HUGO_BASEURL` from `CF_PAGES_BRANCH`/`CF_PAGES_URL`. Production is `main`.
- `functions/r/v1/` proxies Plausible Analytics and requires the
  `PLAUSIBLE_SCRIPT_ID` environment variable in Cloudflare Pages.
- Never commit secrets. Keep `.dev.vars` local.
