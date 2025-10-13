# Repository Guidelines

## Project Structure & Module Organization

The site is a Hugo project. Content lives in `content/` with section folders
(e.g. `content/blog`). Shared Go templates and partials sit in `layouts/`, while
SCSS/Tailwind sources belong in `assets/`. Use `static/` for files that should
publish verbatim (favicons, robots.txt). Generated artifacts land in `public/`
and `resources/`; do not edit them by hand. Global configuration is centralized
in `hugo.toml`, and build tooling is defined in `package.json` and `flake.nix`.

## Build, Test, and Development Commands

Run `npm run dev` to launch `hugo server` with live reload at
http://localhost:1313. Use `npm run build` for a production build with garbage
collection and minification. `npm run lint` performs prettier format checks and
`taplo check` for TOML config. `npm run format` applies Prettier and Taplo
fixes; prefer it before committing. Use `npm run check` when you need a full
lint + build gate, such as before publishing.

## Coding Style & Naming Conventions

Prettier enforces two-space indentation, 80-character prose wrapping, and
tailwind class sorting; run it on templates and content. HTML templates should
remain idiomatic Go templates, keeping partial names lowercase with hyphens
(e.g. `layouts/partials/nav-bar.html`). Public assets and Hugo sections should
also stay in lowercase-kebab-case to match existing routes. Stick to Tailwind
utility classes and keep bespoke CSS in `assets/css`. TOML configuration is
formatted via Taplo; avoid inline tables unless readability demands it.

## Testing Guidelines

Automated testing is limited to linting and Hugo’s build checks today. Align
with the repo by running `npm run lint` for quick validation and `npm run check`
before PRs. When editing templates or content, verify the rendered page locally
(`npm run dev`) and inspect responsive breakpoints. If you add script logic
later, co-locate any unit tests beside the module in `assets/` and follow the
same lowercase naming.

## Commit & Pull Request Guidelines

Commit messages follow Conventional Commits (`feat:`, `chore:`, etc.) as seen in
`git log`. Scope your changes so each commit compiles and formats cleanly. Pull
requests should describe the user-facing impact, list key validation commands,
and link related issues. Include before/after screenshots or screen captures for
visual changes. Confirm `npm run check` passes and note any follow-up work in
the PR body.
