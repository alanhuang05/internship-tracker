# Internship Tracker — sync across devices

This is your existing GitHub Pages tracker plus optional cloud synchronization using **Supabase Auth + Postgres**. It keeps the applications table, separate Action and Status, interview sidebar, and side-by-side calendar.

## One-time setup (about 10 minutes of hands-on configuration)

1. Create a free Supabase project at https://supabase.com/dashboard.
2. Open **SQL Editor**, paste `supabase_setup.sql`, and run it **once**. This creates a per-user data row secured by row-level security (RLS). Do not disable RLS.
3. Go to **Project Settings → API Keys** (or **Connect** in newer dashboard layouts). Find the **Project URL** and **publishable key** (`sb_publishable_...`) or legacy **anon** key. **Never copy the `service_role` key, secret key (`sb_secret_...`), or your database password into any HTML or GitHub repository.**
4. Recommended: open `index.html` in a text editor and set the two public constants near the beginning of the script:
   ```js
   const PUBLIC_SUPABASE_URL='https://YOUR_PROJECT.supabase.co';
   const PUBLIC_SUPABASE_KEY='sb_publishable_YOUR_KEY';
   ```
   Save and upload `index.html` to your `alanhuang05/internship-tracker` GitHub repository, replacing the old file. On a shared publicly hosted frontend it is normal for **publishable keys to be public**; the SQL policies, not the key, protect your records.
   Alternatively, leave both constants blank and enter the URL/key in the website's **☁ Cloud sync** dialog on each device; it saves these public settings in that browser.
5. In Supabase, open **Authentication → URL Configuration**. Set the Site URL to `https://alanhuang05.github.io/internship-tracker/` and add `https://alanhuang05.github.io/internship-tracker/**` as an allowed redirect URL (for email confirmation/reset). Ensure **Authentication → Providers → Email** is enabled. Email verification is normally enabled by default.
6. Open the hosted tracker, click **☁ Cloud sync**, and **Create account** using your email and a strong unique password. If confirmation is enabled, click the verification email, then sign in.
7. The first time you sign in, the tracker checks your cloud account. If no cloud data exists, it offers to **upload the applications, interviews, and notes from that browser**. Sign in on your main computer first and choose OK to migrate the existing data. **Export a JSON backup before migrating**, especially if you have saved interviews.
8. On your laptop or phone, open the same GitHub Pages URL and sign in with **the same account**. Your cloud data loads automatically. It refreshes when you switch back to the tab and roughly every 20 seconds while open; saves are sent shortly after edits.

## Using it

- The status indicator at the top shows **Synced**, **Saving to cloud**, or a **Sync error**. Use **☁ Cloud sync → Sync now** to retry or refresh.
- Changes also save as a local browser cache while signed in. A cloud save failure means **not yet synced across devices**; retry before closing the tab or export a JSON backup.
- Signing out removes the locally cached applications from that device. Your data stays in your Supabase account.
- The original JSON backup and import functions still work. Importing while signed in replaces that account's saved tracker after confirmation.
- Open the tracker from one device at a time when making edits. This lightweight version saves the full dataset as one record, so **simultaneous conflicting edits can overwrite each other** (last successful write wins).
- GitHub Pages continues to serve the static frontend; Supabase stores your private data. Your account's records are protected by RLS, but the sample/default applications included in the public HTML source are visible to anyone. Remove the defaults if you don't want those company names public.

## Troubleshooting

- **Sync error / relation does not exist:** Make sure you ran `supabase_setup.sql` in the right project.
- **Invalid API key / URL:** Use the Project URL and a public publishable/anon key, not a secret or service key.
- **Email confirmation link rejected:** Check Supabase Authentication URL Configuration and GitHub Pages URL.
- **No saved data on the second device:** Make sure the first device shows **Synced** and you're using the same email/account.
- **Changes don't appear immediately:** Focus/reopen the tab or select **Sync now**.
- **Supabase script blocked:** Your internet, privacy extensions, or network may be blocking `cdn.jsdelivr.net`; cloud sync requires reaching the Supabase SDK and your Supabase project.
