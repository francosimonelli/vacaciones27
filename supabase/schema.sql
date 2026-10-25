create table if not exists public.trip_data (
  user_id uuid primary key references auth.users (id) on delete cascade,
  stays jsonb not null default '{}'::jsonb,
  reservations jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.trip_data enable row level security;

revoke all on public.trip_data from anon;
grant select, insert, update on public.trip_data to authenticated;

drop policy if exists "Users can read their trip data" on public.trip_data;
create policy "Users can read their trip data"
  on public.trip_data for select
  to authenticated
  using ((select auth.uid()) = user_id);

drop policy if exists "Users can create their trip data" on public.trip_data;
create policy "Users can create their trip data"
  on public.trip_data for insert
  to authenticated
  with check ((select auth.uid()) = user_id);

drop policy if exists "Users can update their trip data" on public.trip_data;
create policy "Users can update their trip data"
  on public.trip_data for update
  to authenticated
  using ((select auth.uid()) = user_id)
  with check ((select auth.uid()) = user_id);
