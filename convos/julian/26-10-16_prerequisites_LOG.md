Can you create a write-up for prerequesities. I simply want to write down the sources and my thoughts about them. So you can include Cognitive Superpowers there with some lorem ipsum so that I know how the syntax works and I can fill in the rest

---

26-10-16, Claude Opus 5.5 — *write-up skeleton with source helper*

I have read README, `course/INDEX.md`, `course/worksheets/prerequisites.mdx`, `work/template.typ` and `convos/julian/26-10-15_project_structure_SUMMARY.md`.

Day 0 (Prerequisites) has no exercises, only reading lists, so the template's `#exercise` didn't fit. I added a `#source(title, author:, url:, star:)[notes]` helper to `work/template.typ`: it prints the title in bold (as a link when `url` is given), the author in parentheses, and a ★ when `star: true` (mirroring the worksheet's "particularly important" marker), followed by the notes.

Created `work/0_prerequisites/prerequisites.typ` with the worksheet's section headings for the first source only (Background worldview and assumptions → Why AI matters) and one entry, Bostrom's *Cognitive Superpowers*, filled with `#lorem(60)` plus a line showing paragraph and math syntax. A comment at the top documents the entry syntax. Julian fills in the remaining sources himself.

[verified: compiled with `typst compile --root .` to PNG, 26-10-16, and inspected the render]
