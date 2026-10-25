# vacaciones27
mamaguevossss
test

## GitHub Pages environments

This repository deploys two versions of the static site:

- **Production:** contents of `main` at the Pages site root.
- **Development:** contents of `dev` at the `/dev/` path, or the selected
  `dev`/`feature/*` branch when that branch starts the deployment.

The workflow publishes production from `main` together with the selected
development branch, so deploying a feature branch updates `/dev/` without
replacing production. Pushes to feature branches do not start deployments.

### Setup

1. Create a `dev` branch from `main` and push it to GitHub. The deployment
   workflow expects both `main` and `dev` to exist.
2. In the repository, open **Settings → Pages** and set the build and
   deployment source to **GitHub Actions**.
3. Merge this workflow into `main`. Subsequent pushes to `main` deploy
   production alongside `dev`; pushes to `dev` deploy development.
4. To deploy manually, open **Actions → Deploy GitHub Pages → Run workflow**
   and choose `dev` or a `feature/*` branch to publish it to `/dev/`. GitHub
   only offers manual runs after the workflow exists on the repository's
   default branch.

For the default GitHub Pages URL, production is served from
`https://francosimonelli.github.io/vacaciones27/` and development from
`https://francosimonelli.github.io/vacaciones27/dev/`.
