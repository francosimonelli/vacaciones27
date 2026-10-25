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

## Cloud-saved lodging and checklist

GitHub Pages only hosts static files, so cross-device saves require a database
service. This page uses Supabase Auth and a private Postgres row per account.

1. Create a Supabase project.
2. In **SQL Editor**, run [`supabase/schema.sql`](./supabase/schema.sql).
   Row-level security limits each account to its own trip data.
3. Enable **Email** under Supabase **Authentication → Providers**. If email
   confirmation is enabled, configure SMTP if needed and confirm the signup
   message before signing in.
4. In Supabase **Authentication → URL Configuration**, add both the production
   and development GitHub Pages URLs as allowed redirect URLs.
5. Copy the project URL and **publishable/anon** key from the Supabase API
   settings into `SUPABASE_URL` and `SUPABASE_ANON_KEY` near `STAY_KEY` in
   `index.html`. These values are public in a static site; never put a
   `service_role` or secret key in the HTML.
6. Push and deploy the page. In **Dónde dormir**, create an account, confirm
   its email if prompted, and sign in. Existing lodging options/checklist in
   that browser are copied to the new account the first time. Later logins
   load the database copy and every edit is saved to Supabase.

Until the Supabase project is configured and a user signs in, lodging and
checklist editing is disabled rather than pretending changes were saved.
Existing browser data can be migrated when the first account is created.
Export and **Guardar en el HTML** remain available as manual backups.
