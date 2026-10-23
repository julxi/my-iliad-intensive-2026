# SUMMARY: Day A.1, AI Alignment Introduction

**Last updated:** 26-10-23 (Julian's C: comments on the Session 2 discussion answered in place)

Julian is working through A.1 (`course/worksheets/ai-alignment-intro.mdx`). Session 1 (alignment targets) has readings on CEV, intent alignment, Claude's constitution and corrigibility, plus three discussion prompts.

- Write-up: `work/A1_AI_Alignment_Introduction/A1.typ`. Claude formatted Julian's notes: fixed the header (it had been copied from day 0), added `#source` entries for the readings and `#discussion` blocks for the prompts, fixed spelling only. `work/template.typ` gained `#discussion[prompt][answer]`. [verified: compiles, 26-10-23]
- Grading of Session 1 (details in LOG, entry *grading Session 1 answers*), all [concluded] unless marked:
  - The CEV note ("what H is going to want") is wrong: CEV is a counterfactual idealisation and collective, not a prediction of future wants.
  - "Intent alignment ⇒ corrigibility" holds only if H wants A corrigible, and only towards H (counterexamples: Ulysses contract; corrigible to whom). The other three verdicts are right, but no counterexamples were given, though the prompt asks for them.
  - Sufficiency answers lack mechanisms. Key missing points: misuse and power concentration under intent alignment; irreversibility and detection lag under corrigibility.
  - The comet example attributed to arXiv:2506.03056 (Potham & Harms, CAST) is not in that paper. [verified: arXiv HTML v1, 26-10-23] It may come from Harms's LessWrong sequence (unchecked); as described it fits the naive "maximise own corrigibility" version, which CAST rejects.
  - The human-empowerment target already exists in the literature (AvE, Du et al. 2020) [assumed: from memory]. The benefit Julian didn't state: it is value-agnostic. Further failure modes: no commitments, which goals count, whose empowerment, resource hoarding.
- Julian closed the Session 1 discussion (no replies to the open questions) and revised some notes himself.
- Session 2 (alignment problem decompositions): Julian filled in readings and the three prompts; Claude proofread (spelling/grammar only). `work/template.typ` restyled (title, coloured section headings, prompt boxes, sticky titles), which also changes day 0's look. [verified: both write-ups compile, renders inspected, 26-10-23]
- Discussion of the Session 2 answers (LOG entry *Session 2 monologues*), all [concluded] unless marked:
  - Sycophancy was filed under goal misgeneralization, but the stated reason ("shortcut to good feedback") is specification gaming; GMG needs a reward that is correct on the training distribution.
  - Paperclip maximiser is a poor example: no training process; the original "squiggle" version is inner-side [assumed: from memory].
  - Training stories: the answer describes what a training story is, not what it fixes: inner/outer presupposes the loss is the target and the model is an optimiser. Training goal / training rationale missing from the note. Example offered: a pure next-token predictor.
  - Inductive biases: the examples are capabilities, not traceable generalisation. The persona theory of emergent misalignment is the strongest part and matches the literature [assumed: from memory]. Combined with the compression guess, it gives the inductive-bias answer Julian said he lacked.
  - Julian's replies (C: comments in that entry, answered in place):
    - His revised sycophancy story (correct reward, but only ever shown genuinely good questions) is a valid goal-misgeneralization example. Combined with real raters' preference for agreement, it is also an example of misspecification and misgeneralization at once.
    - Claude conceded the paperclip point: "maximise paperclip count" as the specified objective is misspecification (missing constraints).
    - Julian's coping-mechanism analogy counts as goal misgeneralization only where the adult competently pursues a proxy goal; a reflex that just misfires is a different failure.
    - There is no theory that pure next-token predictors are safe; Julian's scepticism is right. Training stories locate that gap in the training rationale.
    - Generalisation examples may be about capabilities; the problem was the missing generalisation step.
    - MLPs do have inductive biases: soft ones from parametrisation and gradient descent. A persona mechanism showing up in an MLP would locate the bias in finetuning preferring a small shared change.
    - Emergent alignment: Julian proposed "maybe none". Claude rejected the premises (persona-space has many axes; the assistant is not the most aligned persona available) and cited re-alignment from a few hundred benign examples [assumed: from memory].

- LOG: `convos/julian/26-10-23_A1_alignment_intro_LOG.md`
