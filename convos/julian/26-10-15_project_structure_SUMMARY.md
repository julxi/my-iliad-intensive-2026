# SUMMARY: Project structure for self-studying the ILIAD intensive

**Last updated:** 26-10-16 (structure built; solutions now fetched by default; fetch output removed so Julian can commit script and course separately)

Julian works through the ILIAD intensive (https://iliad-intensive.org/, source https://github.com/iliad-team/iliad-intensive) on his own, with the agent as sparring partner. He asked whether to clone the whole repo (as he did for ARENA) or download each worksheet's Markdown.

Findings [verified: GitHub API, raw files and live site, 26-10-15]:
- The upstream repo is a Next.js website build. Worksheets are LaTeX (some MDX) under `tex/<slug>/`, with solutions inline. Figures are Git LFS pointers.
- 24 teaching days, 28 worksheets. Mostly math/theory with proof exercises. Code-centric days: C.1, C.2 and C.3 (code in separate repos `iliad-team/iliad-intensive-C.*`), plus D.2 and E.3 (Colab notebooks).
- The site offers per-worksheet MDX/PDF/LaTeX downloads with and without solutions: `https://iliad-intensive.org/downloads/<slug>/<slug>[-nosol].mdx`. License CC BY 4.0. The material changes actively.

Decisions (Julian's C: answers in the LOG):
- [decided] No monorepo clone. Fetch the Markdown; clone each code repo into gitignored `repos/` only on reaching that day. Key reason: in a clone the solutions sit inline, so the agent would see them whenever it read a worksheet.
- [decided] Solutions are downloaded by default (`course/solutions/`), but the agent doesn't open them unless Julian asks. The agent first read this as "don't fetch at all"; Julian corrected it.
- [decided] Follow the schedule order.
- [decided] No formal hint protocol. The agent added one default, to check submitted attempts like a strict grader; that default is not ratified.
- [decided] Julian's write-ups are in Typst.
- [decided] A proper `.venv`: `pyproject.toml` + `uv.lock`, built with `uv sync`.

Built [verified: run 26-10-16]:
- `scripts/fetch_course.py` (`uv run scripts/fetch_course.py`) fetches both variants of all 28 worksheets (`course/worksheets/` without solutions, `course/solutions/` with them) plus 35 figures (5 of them referenced only by solutions) into git-tracked `course/`, and generates `course/INDEX.md` in teaching order. Re-running it shows errata as a `git diff`. **Its output is currently deleted** at Julian's request: he commits the script first, then runs the fetch and commits `course/` separately. Only `course/NOTICE.md` (the attribution file) remains.
- A root `.ignore` hides `course/solutions/` from ripgrep-based search [verified with rg 26-10-16]. Plain `grep -r` and `find` still see it, so agents scope those to `course/worksheets/`.
- `work/template.typ` for write-ups in `work/<day>_<slug>/`. They must be compiled with `typst compile --root . <file>`.
- The rules are in CLAUDE.md, section *This Project: Self-Studying the ILIAD Intensive*. One of them: the `<Solution title="Proof">` blocks that remain in the nosol files are proofs of theorems the text states, not exercise solutions, so they are fine to read. `<Hint>` blocks are not revealed unless Julian asks.

Open: the strict-grader default for checking attempts is not ratified yet. On-demand PDFs are not implemented. (The upstream C.1/C.2 lead "Julian" is someone else.)

- LOG: `convos/julian/26-10-15_project_structure_LOG.md`
- See also: `convos/julian/26-10-15_project_setup_LOG.md`. The request started as a `C:` comment at its bottom.
