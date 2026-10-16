C: (transcribed from chat) can you setup the memory system?

---

26-10-15, Claude Opus 5.5 — *template setup interview and changes*

I have read CLAUDE.md, the template README (setup checklist), docs/README_SKELETON.md, FUTURE_WORK.md, FEEDBACK.md and .gitignore. I have not read docs/HOW_TO_USE.md, docs/CODING.md or the procedure files in full.

Interview answers, given by the user through the multiple-choice question tool in chat (selected option labels, verbatim):

- Team: "Just me (Julian)" → team of one, folder `convos/julian/`. `git config user.name` is "Julian Bitterlich".
- Project: "ILIAD intensive notes" (option description: general notes, exercises and research work from the ILIAD 2026 intensive (AI alignment), to be refined later).
- Private-records folder: "No" → no `convos/julian/private/` created. It can be added later (CLAUDE.md §Privacy); `.gitignore` already excludes it.
- Git workflow: "Keep default (Recommended)" → agents never commit or push; the user reviews diffs and commits. No changes to the git rules in CLAUDE.md, docs/CODING.md or docs/HOW_TO_USE.md.

These answers were selections in a chat tool, not `C:` comments, so I tag them `[assumed]` here rather than `[decided]`; the user can ratify by adding a `C:` line.

Changes made:

- Created `convos/julian/`.
- Replaced README.md with the filled-in skeleton (project description, team, status, maintenance, conversation index). I dropped the skeleton's optional LLM-ism-refresh maintenance row (the skeleton says to delete it if the project publishes nothing) and the empty one-time-deadlines table. `[assumed]` that this notes project publishes little; re-add the row from docs/README_SKELETON.md if that changes.
- Deleted `convos/jamie/` (demo content), `CORE.md`, and the template note in CLAUDE.md.
- FUTURE_WORK.md: deleted the template paragraph and the template's roadmap entries; the list is now empty.
- FEEDBACK.md: deleted the example entry and the sentence describing it; the list is now empty.
- Private-folder sanity check: no `private/` folder exists under any user.

Not done: nothing committed (per the git workflow above). The README description of the project is a placeholder-level sentence; the user may want to replace it with something more specific.

C: I want to discuss how this project should be structured. I want to go through the iliad intensive on my own (https://iliad-intensive.org/ or https://github.com/iliad-team/iliad-intensive). My initial idea was to clone the whole repo as I have done the same for arena, but I'm not sure. Maybe it is better here to just download the .md for each worksheet. This also depends on how much this course depends on code. Furthermore, you are going to be my sparing partner for the exercises and discussions.
    Answer (26-10-15, Claude Opus 5.5): This is a new topic, so I moved the discussion to `convos/julian/26-10-15_project_structure_LOG.md` (entry *structure proposal: fetch worksheets, clone code repos on demand*). In short, I recommend not cloning the monorepo. Instead, download each worksheet's Markdown export, with the solutions version kept in a separate folder, and clone the separate code repos only when you reach a coding day. Of the course's 24 days, roughly 5–6 are code-centric; the rest are math/theory worksheets with proof-style exercises. Open questions for you are at the end of that entry.
