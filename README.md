# Host Patrol Website and Documentation

This repository contains the source code for the Host Patrol Website and
documentation, built with [Hugo], [Tailwind], [Cloudflare Pages] and [Cloudflare
Pages Functions].

- Website: <https://www.hostpatrol.io> ([repo][repo-website])
- Console Application: <https://console.hostpatrol.io> ([repo][repo-console])
- Host Patrol CLI Application Repository: <https://github.com/vst/hostpatrol>

## Development

Enter the Nix shell provisioned in the repository:

```sh
nix develop
```

For [direnv] integration, create a `.envrc` file and allow it:

```sh
echo "use flake" > .envrc
direnv allow
```

Install Node dependencies:

```sh
pnpm install
```

Run the Website in development mode (<http://localhost:1313>):

```sh
pnpm run dev
```

Format the codebase:

```sh
pnpm run format
```

Check (format and type-check) and build the codebase:

```sh
pnpm run check
```

Build the Website in production mode:

```sh
pnpm run build
```

To test Pages Functions locally, create a `.dev.vars` file with the
`PLAUSIBLE_SCRIPT_ID` (see below) and serve the build output with Wrangler:

```sh
echo "PLAUSIBLE_SCRIPT_ID=replace-me" > .dev.vars
pnpm run dev-serve
```

## Deployment

The Website is deployed on Cloudflare Pages with build command `./deploy.sh` and
output directory `public`:

- `deploy.sh` sets `HUGO_BASEURL` based on `CF_PAGES_BRANCH`/`CF_PAGES_URL`: the
  `main` branch deploys to `https://www.hostpatrol.io/`, other branches use the
  preview URL Cloudflare provides, and an explicitly-set `HUGO_BASEURL` is
  always left untouched.
- The Plausible Analytics proxy (`functions/r/v1/`) requires a
  `PLAUSIBLE_SCRIPT_ID` environment variable set in the Cloudflare Pages project
  settings: the site-specific part of the Plausible script URL, e.g. `abc123`
  for `https://plausible.io/js/pa-abc123.js`.

Releases are managed by [release-please] using Conventional Commits.

<!-- REFERENCES -->

[Hugo]: https://gohugo.io
[Tailwind]: https://tailwindcss.com
[Cloudflare Pages]: https://pages.cloudflare.com
[Cloudflare Pages Functions]: https://developers.cloudflare.com/pages/functions/
[direnv]: https://direnv.net
[release-please]: https://github.com/googleapis/release-please
[repo-console]: https://github.com/vst/hostpatrol-console
[repo-website]: https://github.com/vst/hostpatrol-website
