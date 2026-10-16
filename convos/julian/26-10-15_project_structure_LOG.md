The user's request is the `C:` comment at the bottom of `convos/julian/26-10-15_project_setup_LOG.md` (reproduced verbatim):

> C: I want to discuss how this project should be structured. I want to go through the iliad intensive on my own (https://iliad-intensive.org/ or https://github.com/iliad-team/iliad-intensive). My initial idea was to clone the whole repo as I have done the same for arena, but I'm not sure. Maybe it is better here to just download the .md for each worksheet. This also depends on how much this course depends on code. Furthermore, you are going to be my sparing partner for the exercises and discussions.

---

26-10-15, Claude Opus 5.5 — *structure proposal: fetch worksheets, clone code repos on demand*

I have read the upstream repo's README.md, AGENTS.md, docs/NOTEBOOKS.md, schedule.yaml, .gitattributes, license.md and its full file tree (via the GitHub API, 26-10-15), and I checked the live site's download links. I have not read any worksheet in full.

## What the course material looks like [verified: GitHub API + raw files + live site, 26-10-15]

- **The monorepo is a website build, not a course workspace.** It is a static Next.js site. The worksheet sources are `tex/<slug>/main.tex` (a few are `main.mdx`) plus slide decks. Around them sit the site code (`src/`), a LaTeX→MDX converter, CI workflows and a TeX + Node toolchain (`setup.sh`). GitHub reports the repo at 58538 KB. All figures are Git LFS pointers (the 130-byte `fig/*.png` / `fig/*.pdf` entries in the tree), so a clone without `git lfs` has broken images.
- **Curriculum:** `schedule.yaml` lists 24 teaching days in 6 clusters (0 Foundations; A Alignment; B Learning; C Abstractions/Representations/Interpretability; D Agency; E Safety Guarantees) and 28 worksheet slugs (some days have two worksheets, e.g. D.3 = Solomonoff Induction then AIXI).
- **How much code:** mostly theory. Most days are math worksheets with proof-style exercises (AIXI, SLT, reward learning theory, debate, decision theory, ...). The code-centric days are:
  - C.1 Intro to ML Engineering: three lectures, code in separate public repos `iliad-team/iliad-intensive-C.1.1`, `-C.1.2`, `-C.1.3`.
  - C.2 Mechanistic Interpretability: the worksheet page is a short stub (its MDX is 7828 bytes); the material lives in `iliad-team/iliad-intensive-C.2` (GitHub reports 168600 KB).
  - C.3 Computational Mechanics: also has a code repo, `iliad-team/iliad-intensive-C.3`.
  - D.2 Policy Gradients and Misgeneralization and E.3 Worst-Case Interpretability: Colab notebooks generated from `.py` master files in the monorepo (ARENA format). The schedule marks D.2 as a stub (recorded lecture only, coding material not yet ported).
  - Smaller scripts: D.7 (`mess3_transducer.py`), B.4 (has its own source repo).
- **Downloads per worksheet:** every worksheet page offers PDF, LaTeX and Markdown (MDX) downloads at `https://iliad-intensive.org/downloads/<slug>/`, each **with solutions** (`<slug>.mdx`) and **without** (`<slug>-nosol.mdx`). Example: `aixi.mdx` is 94484 bytes and `aixi-nosol.mdx` is 52231 bytes. For worksheets without solutions (e.g. `debate`, where the schedule notes no solutions exist upstream), the two files are the same size (74100 bytes). The MDX is plain Markdown with `$...$` math, a KaTeX macro line at the top and a few custom tags like `<LearningOutcomes>`. It is fine for both of us to read.
- **The material is still changing:** the repo was last pushed 26-10-15 (today), it has an errata workflow, and several days are marked `source: missing` or `partial`.
- **License:** CC BY 4.0 (`license.md`), so keeping copies in your repo is fine with attribution.

## Why not clone the whole repo (unlike ARENA)

[concluded] Cloning made sense for ARENA because ARENA is code-first: notebooks, solution files and tests are the course. Here the clone mostly brings a website pipeline you won't use, and two specific problems:

1. **Solutions are inline.** In `main.tex`, each `\begin{solution}` sits right in the worksheet source. If I read a worksheet from the clone to discuss it with you, I see the solutions too. That undermines sparring: I could leak hints without meaning to, or anchor on the official proof instead of engaging with yours. The `-nosol` download gives both of us the worksheet without them.
2. **Figures need LFS**, and reading LaTeX source is harder than reading the rendered Markdown, for you at least.

What the clone would give you: `git pull` for errata and `git log` to see what changed. You can get most of that without the clone (see the tracked-copies point below).

## Proposed structure [concluded, pending your answers below]

```
my-iliad-intensive-2026/
├── course/
│   ├── NOTICE.md               # CC BY 4.0 attribution + source URL + fetch date
│   ├── worksheets/<slug>.mdx   # the -nosol versions: what we both read
│   └── solutions/<slug>.mdx    # with-solutions versions: I open only on request (rule below)
├── scripts/fetch_course.py     # reads upstream schedule.yaml, downloads both variants per slug
├── work/<day>_<slug>/          # your attempts: exercise write-ups (.md with LaTeX), code, scratch
├── repos/                      # gitignored: clones of code repos, made when you reach that day
└── convos/julian/              # one LOG/SUMMARY pair per day, e.g. 26-10-20_D3_aixi_LOG.md
```

- **Track `course/` in git.** Re-running the fetch script later shows errata as an ordinary `git diff`, which replaces the main benefit of `git pull` on a clone.
- **PDFs** (for reading on a tablet/paper, and for figures): fetched on demand into a gitignored `course/pdf/`. [assumed] The MDX may not embed every figure; I have not checked that across worksheets.
- **Code days:** clone only that day's repo into `repos/` when you get there. The C.2 repo alone is larger than the whole monorepo, so fetching on demand also saves space.

## Sparring-partner role: proposed rules

To be added to CLAUDE.md (project-specific section) once you agree:

- **Solutions:** I don't open `course/solutions/` unless you ask, or until you have handed in an attempt and want it checked. When checking, I tell you whether and where your argument fails before I show anything from the official solution.
- **Help style:** by default I give graded hints (a nudge → the key idea → a full step), not answers. I point out gaps in your proofs the way a strict grader would.
- **Discussion goes into the day's LOG** (append-only). Your attempts go into `work/`, where you can revise them freely, like a DRAFT file.

## Open questions for you

1. Do you agree with this hybrid (fetched Markdown + code repos on demand), or do you still prefer the full clone?
C: that's fine yes
2. Solution access: is the rule above right, or would you rather I can always see solutions and just never reveal them unprompted? Tradeoff: if I can see them, I can check you more precisely, but the official approach will bias my hints.
C: let's go with no-solution right now
3. Order: follow the schedule (0 Prerequisites → A.1 → ... → E.3), or pick clusters by interest?
C: follow schedule
4. Hint style: graded hints by default, or something else (e.g. pure Socratic questions, or direct feedback)?
C: I don't think we have to formalie this. I'll just query you natrually.

Once you answer, I'll write the fetch script (after reading `docs/CODING.md`), run it, and add the sparring rules to CLAUDE.md.

C: one more thing: I want my work to be in typst.

---

26-10-16, Claude Opus 5.5 — *answers applied: fetch script run, Typst template, sparring rules in CLAUDE.md*

I have read the C: answers above, `docs/CODING.md`, and upstream `schedule.yaml` (fetched 26-10-16).

## Decisions from Julian's answers

- [decided] Hybrid structure: fetched Markdown + code repos cloned on demand, no monorepo clone (answer to Q1).
- [decided] No access to official solutions for now (Q2). I read "no-solution right now" as: the solutions are not fetched at all, rather than fetched and left unopened. Nothing lying around means nothing to leak by accident. The script has a `--solutions` flag for when you lift this. If you meant "fetch them, but I stay out", say so and I'll run it.  
C: no, I meant. For now we do it like that you are not supposed to open the solutions yourself, they should be downloaded by default though
Answer (26-10-16, Claude Opus 5.5): Done. The script now always fetches both variants (`course/solutions/` next to `course/worksheets/`), and the `--solutions` flag is gone. The CLAUDE.md rule now says I don't open solutions unless you ask. Details are in the entry *solutions fetched by default, uv .venv, fetch output removed* below.
- [decided] Order: follow the schedule (Q3).
- [decided] No formal hint protocol; you query me naturally (Q4). I kept one default in the CLAUDE.md rules: when you submit an attempt, I check it like a strict grader and name the failing step before offering any fix. That is how I read "sparring partner", not something you ratified, so strike it if you don't want it.
- [decided] Your work is in Typst (final C: comment).

## What I built

- `scripts/fetch_course.py` (run with `uv run scripts/fetch_course.py`; dependencies declared inline, so no venv setup is needed). It reads upstream `schedule.yaml`, downloads each slug's `-nosol.mdx` into `course/worksheets/`, downloads every figure the MDX references (`<Figure src="/uploads/...">`) into `course/uploads/`, and generates `course/INDEX.md` (days in teaching order, links to local files).  
C: I'd like to have a proper `.venv` setup.
Answer (26-10-16, Claude Opus 5.5): Done. `pyproject.toml` + `uv.lock` at the repo root; `uv sync` builds `.venv`, and `uv run scripts/fetch_course.py` runs in it. The inline script metadata is removed.
  - [verified: run 26-10-16] 24 days, 28 worksheets, 30 figures (6 PNG, 24 SVG, checked with `file`), 6.6 MB in total. Every figure reference in the worksheets uses that one `src="/uploads/..."` form: a grep for Markdown images and other `src=` forms found none.
  - Figure paths in the MDX stay absolute (`/uploads/...`), so a Markdown previewer won't render them. The files sit at `course/uploads/...`.
- `course/NOTICE.md`: CC BY 4.0 attribution, as the licence requires.
- `work/template.typ`: page setup, an `exercise("2.1")[...]` block keyed to the worksheet's exercise number, `proof[...]`, and a few notation shortcuts the worksheets define as KaTeX macros (`Ex`, `Prob`, `argmax`, `KL`, `TV`). Kept minimal on purpose.
  - [verified: test compile 26-10-16, typst 0.14.2, rendered and inspected] Compiling a write-up in a subfolder needs `--root .` from the repo root, because Typst refuses imports from above the compiled file's folder. If you use the Tinymist VS Code extension, it may need its root set to the repo, too. [assumed] I have not tested Tinymist.
- `.gitignore`: `repos/`, `work/**/*.pdf`, `course/pdf/`.
- CLAUDE.md: a new section, *This Project: Self-Studying the ILIAD Intensive*, holds the layout, the order, the no-solutions rule and the sparring default, so every future session follows them.

## A finding about the "no solutions" files

[verified: grep + inspection 26-10-16] Six of the nosol worksheets still contain `<Solution>` blocks (15 in total). I checked each one: 13 are titled "Proof" and directly follow a `<Theorem>` that the text states. They are expository proofs, not exercise solutions. The other 2 (in `debate`) are "Deliberately false proof" blocks, which an exercise asks you to find the flaw in. The CLAUDE.md rule says these are fine to read. The worksheets also contain 83 `<Hint>` blocks, which the website shows collapsed. The rule says I don't reveal them unless you ask.

## Open points

- Upstream `schedule.yaml` lists the lead of C.1 (Intro to ML Engineering) and C.2 (Mech Interp) as "Julian". If that's you, you might want to skip those days or treat them differently. I don't know whether it is.  
C: not me
Answer (26-10-16, Claude Opus 5.5): Noted. C.1 and C.2 are ordinary days.
- `course/pdf/` (on-demand PDFs) is gitignored but not implemented. I'll add it when you first want a PDF.  
C: fine
Answer (26-10-16, Claude Opus 5.5): Noted.

C: additional comment. Can you delete the output of the fetch_course.py again. I want to commit the script and convos and then commit the fetch
Answer (26-10-16, Claude Opus 5.5): Done. `course/` now holds only `NOTICE.md`. I ran the updated script once to verify it before deleting the output; see the entry below.

---

26-10-16, Claude Opus 5.5 — *solutions fetched by default, uv .venv, fetch output removed*

I acted on Julian's five C: comments on the entry *answers applied: fetch script run, Typst template, sparring rules in CLAUDE.md*.

- **Solutions:** [decided] (C: above) they are downloaded by default, but the agent doesn't open them on its own initiative. That replaces my earlier reading, "don't fetch them at all". `scripts/fetch_course.py` now always writes `course/worksheets/<slug>.mdx` (no solutions) and `course/solutions/<slug>.mdx` (with solutions). It prints only sizes, never content, so running it doesn't expose solutions to the agent.
  - Protection against accidental reads: a root `.ignore` file lists `course/solutions/`. Ripgrep honours it and git doesn't, so the files stay tracked but drop out of searches. [verified: test 26-10-16 with VS Code's bundled rg, test files since deleted] A marker string placed in both folders was found only in `course/worksheets/`. [assumed] VS Code's own search should skip the folder too (its `search.useIgnoreFiles` setting reads `.ignore`); not tested. Plain `grep -r` and `find` ignore `.ignore`, so the CLAUDE.md rule tells agents to scope those searches to `course/worksheets/`.
  - [verified: run 26-10-16] 28 worksheets in both variants, 35 figures. 5 of them are referenced only by solutions, so `course/uploads/` holds solution-only figures as well; the CLAUDE.md rule covers that. Solutions are larger than nosol for 16 worksheets and the same size for 12 (prerequisites, ai-alignment-intro, alignment-in-practice, alignment-in-practice-ii, intro-to-ml-engineering, mechanistic-interpretability, optimization-thermodynamics, decision-theory, open-source-game-theory, world-models, debate, worst-case-interp). Same size most likely means upstream has no exercise solutions for that worksheet. That is confirmed only for debate, by a note in `schedule.yaml`; for the others it is [assumed]. I compared sizes only, without opening any solution file.
- **.venv:** `pyproject.toml` (requests, pyyaml; `package = false`, because there is nothing to install) plus `uv.lock`. `uv sync` builds `.venv`, which is gitignored. I removed the inline script metadata, so `uv run` now uses the project environment. `uv.lock` should be committed with the script.
- **Fetch output deleted** [verified: `ls course/` shows only `NOTICE.md`]. `course/NOTICE.md` stays: I rewrote it to describe both variants and dropped the fetch date, since git history records when the fetch happened. Suggested commit split: (1) everything except `course/` content, (2) `uv run scripts/fetch_course.py`, then commit `course/`.
- CLAUDE.md, section *This Project*: added the Python/uv line, the solutions folder, and the revised no-solutions rule.
