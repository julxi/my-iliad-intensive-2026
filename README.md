# ILIAD Intensive 2026

Julian Bitterlich's notes, exercises and research work from the ILIAD 2026 intensive (AI alignment). This is a working repository: each discussion topic lives as a LOG/SUMMARY pair in `convos/julian/`, and the Conversation Index below is the entry point to all of them.

This project uses the [Epistemic Memory](https://github.com/FlorianDietz/EpistemicMemory) conventions: all project memory lives in LOG/SUMMARY file pairs under `convos/`, governed by [CLAUDE.md](CLAUDE.md). Human guide: [docs/HOW_TO_USE.md](docs/HOW_TO_USE.md). Open ideas and deferred items: [FUTURE_WORK.md](FUTURE_WORK.md). Workflow problems and lessons: [FEEDBACK.md](FEEDBACK.md).

## Team

A team of one, so no user-identification step is needed.

- Julian Bitterlich — `convos/julian/`

## Current status and goals

Structure set up 26-10-16: `uv run scripts/fetch_course.py` fetches the course into `course/` (committed), Julian's Typst write-ups go in `work/`, sparring rules are in CLAUDE.md. In progress: day 0 (Prerequisites) and day A.1 (Sessions 1–3 done), following the schedule.

## Maintenance

Recurring tasks:

| Task | Last run | Due when | Notes |
|------|----------|----------|-------|
| Sync (LOG/SUMMARY drift) | — | After many LOG changes, or ~monthly | `!sync`; procedure: `docs/procedures/sync.md` |

## Conversation Index

All discussions live in `convos/{user}/`. **When starting a new topic, add a row here.** Read the SUMMARY first; open the LOG only if the SUMMARY is insufficient. Status cells describe current state only — rewrite them on update, don't append.

| Date | User | Topic | Status | SUMMARY | LOG |
|------|------|-------|--------|---------|-----|
| 26-10-15 | julian | Memory system setup | Done | [SUMMARY](convos/julian/26-10-15_project_setup_SUMMARY.md) | [LOG](convos/julian/26-10-15_project_setup_LOG.md) |
| 26-10-15 | julian | Project structure for self-study | Done; course fetched, rules in CLAUDE.md | [SUMMARY](convos/julian/26-10-15_project_structure_SUMMARY.md) | [LOG](convos/julian/26-10-15_project_structure_LOG.md) |
| 26-10-16 | julian | Day 0: Prerequisites | Write-up skeleton ready; Julian filling in source notes | [SUMMARY](convos/julian/26-10-16_prerequisites_SUMMARY.md) | [LOG](convos/julian/26-10-16_prerequisites_LOG.md) |
| 26-10-23 | julian | Day A.1: AI Alignment Introduction | Sessions 1–3 done and graded; Session 4 in progress: reading notes and prompt 1 answer in A1.typ (proofread) | [SUMMARY](convos/julian/26-10-23_A1_alignment_intro_SUMMARY.md) | [LOG](convos/julian/26-10-23_A1_alignment_intro_LOG.md) |
