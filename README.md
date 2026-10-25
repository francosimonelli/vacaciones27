# vacaciones27
mamaguevossss
test

## GitHub Pages environments

This repository deploys two versions of the static site:

- **Production:** contents of `main` at the Pages site root.
- **Development:** contents of `dev` at the `/dev/` path.

The workflow publishes both branches together on every push to either `main`
or `dev`, so deploying one environment does not replace the other.

### Setup

1. Create a `dev` branch from `main` and push it to GitHub. The deployment
   workflow expects both `main` and `dev` to exist.
2. In the repository, open **Settings → Pages** and set the build and
   deployment source to **GitHub Actions**.
3. Merge this workflow into `main`. Subsequent pushes to `main` deploy
   production; pushes to `dev` deploy development. You can also run the
   workflow manually from the **Actions** tab.

For the default GitHub Pages URL, production is served from
`https://francosimonelli.github.io/vacaciones27/` and development from
`https://francosimonelli.github.io/vacaciones27/dev/`.
