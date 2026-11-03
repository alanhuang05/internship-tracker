-- Run once in the SQL Editor of YOUR Supabase project.
-- Each signed-in account can read and modify ONLY its own tracker.
create table if not exists public.tracker_data (
  user_id uuid primary key references auth.users(id) on delete cascade,
  applications jsonb not null default '[]'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.tracker_data enable row level security;
revoke all on table public.tracker_data from anon, authenticated;
grant select, insert, update on table public.tracker_data to authenticated;

create policy "select own tracker" on public.tracker_data
for select to authenticated
using ((select auth.uid()) = user_id);

create policy "insert own tracker" on public.tracker_data
for insert to authenticated
with check ((select auth.uid()) = user_id);

create policy "update own tracker" on public.tracker_data
for update to authenticated
using ((select auth.uid()) = user_id)
with check ((select auth.uid()) = user_id);
