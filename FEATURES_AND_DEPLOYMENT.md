# Internship Tracker — Drag ordering and assessment deadlines

## Changes
- Under **All** and **Sort: Custom order**, drag the dotted handle on the left side of each application row to reorder it. Clear the search and filters before dragging. Your `order` values are stored with the applications in the existing Supabase `tracker_data` JSON, so they persist across signed-in devices.
- When an application is set to **Assessment**, it automatically appears under **Assessment Deadlines** in the interview schedule sidebar. Click it to set or edit its due date, optional due time, and notes. You can also set the due date when editing an application.
- Assessment deadlines appear as **orange dots** on the same calendar as **blue interview dots**. Clicking a date shows all its events; clicking an assessment opens the deadline editor.
- The public signed-out demo uses fictional sample companies and sample dates.

## Deployment
1. Download/backup your existing tracker JSON before upgrading.
2. If your live GitHub Pages file has configured `PUBLIC_SUPABASE_URL` and `PUBLIC_SUPABASE_KEY`, copy the existing **public** values into the two blank constants near the beginning of this new `index.html`. Never insert a Supabase secret/service-role key.
3. Replace the `index.html` in your `internship-tracker` GitHub Pages repository and commit.
4. Reload the website, sign in, change the custom order, add an assessment deadline, and confirm the changes persist after a refresh / on a second device.

No Supabase SQL changes are required: assessment fields and custom ordering are stored within the existing `applications` JSON column.
