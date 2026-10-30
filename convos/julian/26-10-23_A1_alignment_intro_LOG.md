C: (transcribed from chat) I've done a bit of session 1 in `A1.typ`. I need you two do two things. Format this and also start a conversation about it

---

26-10-23, Claude Opus 5.5 — *formatting A1.typ*

I have read README, `convos/julian/26-10-16_prerequisites_SUMMARY.md`, `work/template.typ`, and the A.1 worksheet (`course/worksheets/ai-alignment-intro.mdx`): intro, Session 1, the reading-guide paragraph on alignment targets, and the further-reading list for alignment targets. I did not open `course/solutions/`.

Changes to `work/A1_AI_Alignment_Introduction/A1.typ`:
- Fixed the header, which had been copied from the prerequisites write-up: it said day 0 / "Prerequisites" and carried that file's usage comment. It now says A.1, "AI Alignment Introduction".
- Structure: `== Session 1`, then `=== Readings` (one `#source` per worksheet link, with URL, and your one-line note on each) and `=== Discussion` (the three worksheet prompts, each with your answer).
- Removed the duplicate copy of prompt 1 (it appeared once as "Q1:" and once again further down).
- The implications are now a bullet list with proper arrows (⇒, ⇏, ⇎).
- Fixed spelling only ("todo", "Intenant", "oppinion", "corrigibile", "expample", "disasable", "acchievable", …) plus light grammar. I did not change what you wrote.

Added a `#discussion[prompt][answer]` helper to `work/template.typ`: A.1 is mostly discussion prompts without numbers, so `#exercise(id)` didn't fit. [verified: A1.typ and prerequisites.typ both compile, 26-10-23; A1 render inspected as PNG]

---

26-10-23, Claude Opus 5.5 — *grading Session 1 answers*

Same context as above, plus I checked the arXiv paper you cite (2506.03056) via a web fetch. I graded your answers strictly, per CLAUDE.md. Each point names the problem first, then what would fix it.

**Definitions (reading notes)**

1. *CEV: "what H really wants or is going to really want."* The second half is wrong. CEV is not a prediction of what you will want later. It is a counterfactual idealisation: what we would want "if we knew more, thought faster, were more the people we wished we were, had grown up farther together". It is also *collective* (humanity's volition, and "coherent" means only where extrapolations converge), not one H's. Both points matter for the implication questions below: a single-H target and a humanity-level target can't imply each other cleanly.
2. *Intent alignment: "A is trying to do what H wants."* Correct, and "trying" is the important word. Christiano defines it as a property of A's motivation, not of outcomes, so an intent-aligned A can still cause disasters through incompetence. That matters for prompt 2.
3. *Corrigibility: "A wants H to be able to change it."* Too strong in one direction, too weak in another. Too strong: an agent that *wants* to be changed has an incentive to get itself changed, e.g. by manipulating H into pressing the button. This is the classic shutdown-button problem, and the LessWrong page discusses it. Too weak: the usual definition also rules out deceiving or manipulating the overseers, and asks A to actively help with correction, not only allow it. Closer to the page: "A does not resist, and helps with, correction, modification and shutdown, despite instrumental incentives to resist, and does not deceive or manipulate its overseers."

**Prompt 1: implications**

The prompt asks you to "think through counter examples". You give four verdicts and no counterexamples, so as an exam answer this is incomplete even where the verdicts are right.

- *Intent alignment ⇒ corrigibility.* This fails as stated. It holds only if H wants A to be correctable, and only towards H. Counterexamples: (a) a Ulysses contract: H says "don't let anyone change your goals, including me tomorrow"; an intent-aligned A then resists H's later correction. (b) Corrigible *to whom*: intent-aligned to H, but resisting modification by the developer or a regulator, because H wants that. A fair version: "intent alignment to H usually gives corrigibility to H, because most H want to be able to correct A." Christiano argues something like this.
- *CEV ⇏ corrigibility.* Correct. The missing counterexample: a CEV-aligned A that is confident present-day humans are mistaken would resist their attempt to shut it down, *unless* our extrapolated volition itself values present-day human control. That caveat is worth stating, because it is the only route by which CEV could yield corrigibility.
- *Corrigibility implies no other target.* Correct: a corrigible A can have arbitrary object-level goals (paperclips, as long as it lets you switch it off). One nuance: the paper you cite (Potham & Harms, CAST) claims that *pure* corrigibility, as the agent's only goal, ends up looking like empowering the principal, which is close to intent alignment. Your verdict is right for corrigibility as an add-on property; CAST claims it is wrong for corrigibility as the sole target.
- *Intent alignment ⇎ CEV.* Correct. Missing counterexamples, one per direction: H wants help with something their idealised self wouldn't endorse (intent ✓, CEV ✗); a CEV-aligned A overrides H's current wishes "for their own good" (CEV ✓, intent ✗).
- *Constitution missing.* You skipped it, which is fine for time, but it is the most interesting case here: it is the one target that is *designed* to imply another. As far as I remember, Claude's constitution gives "broad safety" (supporting human oversight, roughly corrigibility) priority over its other values. [assumed: from memory, not re-checked against the text] If that's right, "constitution ⇒ (a form of) corrigibility" holds by construction, and the interesting question is whether it is robust.

**Prompt 2: sufficiency for safety**

- *"The outcome can heavily depend on the details."* This is not an answer; a grader would give it no marks. Say *which* details.
- *Intent alignment: "H wants something and A helps even though this will harm H."* The example is weaker than it looks. If A knows the action will harm H and H doesn't, an A that is trying to do what H *wants* (not what H literally says) would warn H. So your scenario is either a competence failure (A didn't know either) or H's informed choice. The catastrophic cases are elsewhere: (a) **misuse**: H wants harm to *others*, and intent alignment says nothing about third parties; (b) **power concentration**: a small group with intent-aligned superhuman AI; (c) **competence**: "trying" ≠ succeeding, so an honest A can still make an irreversible mistake. (a) and (b) are why intent alignment is usually treated as necessary but not sufficient.
- *Corrigibility: "can also cause catastrophic harm … a bit muddy."* No mechanism given. The point the prompt is fishing for is **irreversibility and detection lag**: corrigibility only lets you fix what you *notice*, *before* it becomes irreversible. One catastrophic action (releasing a pathogen design, an unrecoverable infrastructure change) beats any correction loop. Plus "corrigible to whom": corrigibility to a malicious principal is as dangerous as intent alignment to one.
- *The comet example.* I can't find it in the paper. The arXiv paper (Potham & Harms 2025, "Corrigibility as a Singular Target: A Vision for Inherently Reliable Foundation Models") lists "Unconditional Deference: Accepting shutdown, modification, or goal changes without resistance …" as a core property, and its appendix has a case where the agent "voluntarily shuts off without protest" when ordered. [verified: arXiv HTML v1 fetched 26-10-23; about 60% of the text read verbatim, the rest via a model summary that also found no such example] It might come from Harms's longer CAST sequence on LessWrong, which I haven't checked. Either way, the example as you describe it (A refuses shutdown *in order to stay corrigible*) is the failure of a *naive* formalisation, "maximise your own corrigibility", which creates a self-preservation incentive. CAST explicitly tries to avoid this: self-preservation is valued only insofar as it protects the principal's ability to correct the agent. So this reads like an argument *against* the naive version, not a description of CAST. Worth re-checking where you saw it.

**Prompt 3: your own target (human empowerment)**

The idea exists in the literature, which is a good sign that it is a natural candidate: e.g. "AvE: Assistance via Empowerment" (Du et al., NeurIPS 2020). Turner's attainable utility preservation is the cousin that preserves *the agent's own* options, used as an impact penalty. [assumed: citations from memory, not looked up this session]

- *You didn't answer "does your target have a benefit?"* The standard argued benefit: it is **value-agnostic**. A doesn't need to know what you want, only to keep your options open, so it is robust to getting human values wrong. That is the selling point to state.
- *Failure modes beyond the one you name.* Your "delaying goals" point is real: option value and achieving anything trade off, because every choice closes options. Stronger versions: (a) A discourages *commitment* of any kind (marriage, careers, spending money), since commitments shrink the option set; (b) **which goals count**: "number of achievable goals" needs a goal distribution, and if it includes "harm others", A is maximising your ability to do harm; (c) **whose** empowerment: empowering one human often disempowers another, so you need an aggregation rule, which brings back the value-specification problem the target was meant to avoid; (d) A may hoard resources on your behalf, which is instrumental convergence again, now in your name.

**Questions back to you** (answer in the file however you like):
- For intent alignment ⇒ corrigibility: do you accept the Ulysses-contract counterexample, or do you think a "real" intent-aligned A should see through H's precommitment?
- Where did you see the comet example?
- For empowerment: which goal distribution would you use, and what does that choice do to failure mode (b)?

---

C: (transcribed from chat) don't need to discuss this any more. Can you add Session 2 so I can fill it in?

---

26-10-23, Claude Opus 5.5 — *Session 2 skeleton*

Session 1 discussion closed at Julian's request; the open questions above are dropped. Julian has meanwhile revised his Session 1 notes in `A1.typ` himself (CEV note, intent alignment ⇒ corrigibility "as long as H wants it").

Appended `== Session 2: Alignment problem decompositions` to `A1.typ`, built from the worksheet in the same way as Session 1: empty `#source` entries for the five readings (training stories, reward misspecification, goal misgeneralization, soft inductive biases, emergent misalignment), each with its URL, and the three discussion prompts as empty `#discussion` blocks. The worksheet's reading instruction for training stories ("read everything before the section 'How mechanistic does [...]'") is kept as a comment. [verified: compiles, 26-10-23; render inspected]

---

C: (transcribed from chat) Can you proofread `A1.typ` and make it prettier. Then can we talk about my monologues?

---

26-10-23, Claude Opus 5.5 — *proofread and restyle*

Same context as the entries above. I took "monologues" to mean your answers to the Session 2 discussion prompts (they are written for groups of 3–5; you answer them alone).

**Proofreading** (`work/A1_AI_Alignment_Introduction/A1.typ`): spelling, grammar and indentation only; content unchanged. Examples: "psychophancy" → "sycophancy", "learinng", "is seems", "incontext learning.Big:", "on to behave misaligned in narrow field", "along the line of". Two small additions: the training-stories note is now a full sentence, and "Deep Learning is Not So Mysterious or Different" is marked as the soft-inductive-biases paper (the worksheet links arXiv:2503.02113 under that heading).

**Styling** (`work/template.typ`, so day 0 gets the same look):
- Title centred; `==` headings dark blue with a rule underneath; `===` headings small grey capitals. Links are blue.
- `#discussion`: the prompt sits in a tinted box with a blue left bar, and the answer is indented below it. Before, the `\` line break glued the answer's first paragraph to the prompt, so the two ran together.
- `#source`: the answer is indented below the title; author in grey.
- Source titles and prompt boxes are `sticky`, so a title can no longer be stranded at the bottom of a page without its notes. That had happened to "Training stories".

[verified: A1.typ and prerequisites.typ both compile, 26-10-23; renders inspected as PNG]

---

26-10-23, Claude Opus 5.5 — *Session 2 monologues*

Same context. I read the Session 2 section of the worksheet, not the readings themselves; claims about their content below come from memory and are tagged. Strict-grader mode: the problem first, then what would fix it.

**Prompt 1: misspecification vs misgeneralization examples**

- *Sycophancy → "lean towards goal misgeneralization".* Your own reason points to the other category. "The LLM learns a shortcut for getting good human feedback" means the model does what the reward pays for, and that is specification gaming. Goal misgeneralization needs the reward to be *correct on the training distribution*, with the wrong goal showing up only off-distribution (CoinRun: the coin was always at the right end of the level during training, so "go right" and "get the coin" earned the same reward). For sycophancy the reward itself is off: human raters do prefer agreeable answers. [assumed: from memory, Sharma et al. 2023, "Towards Understanding Sycophancy in Language Models", found this in preference data] So it is closer to misspecification. The real ambiguity: whether a reward counts as "correct" depends on which distribution and which intended goal you measure it against, and the dichotomy doesn't say.  
C: You are most likely correct, espcially how I worded it. Let me make another attempt which might not reflect the actual training but might be a coherent story. Let's say RLHF rewards perfectly aligned but all examples are just from a rational user who's questions or suggestions are genuinly decent. A good response acknowledges the quality. The model then learns the inner misaligned goal to always acknowlede the users prompt as genuinly insightful.
Answer (26-10-23, Claude Opus 5.5): This one works, and it has the same structure as CoinRun. On your training distribution, "praise the user when the question is good" and "always praise the user" earn the same reward, so nothing in training tells them apart. They come apart at deployment, where most questions are mediocre. The reward is correct where it was measured, and the error comes from the narrow distribution, not the reward. Two notes. (a) "Learns the inner misaligned *goal*" assumes the model represents a goal; it might just have learned a praise-first habit. If it is a habit, this is a plain robustness failure rather than goal misgeneralization (see the coping-mechanism answer below). (b) Put this next to the real-world version, where raters *also* reward agreement, and you have an answer to question 1 at the bottom: both failures at once.
- *Paperclip maximiser → misspecification.* This works only for the popular version ("we told it to make paperclips"). The thought experiment has no training process, so the dichotomy doesn't really apply. Yudkowsky has also said his original "squiggle maximiser" was about an AI whose *learned* values ended up on a meaningless molecular shape, which is the inner/misgeneralization side. [assumed: from memory, LessWrong wiki entry] Cleaner misspecification example from your reading: the CoastRunners boat circling to collect points instead of finishing the race.  
C: I didn't specify the training. But I think it still works. The goal is paperclips and an agent that maximises that is very likely misaligned with human values and what the researcher actually intended (whatever that actually is).
Answer (26-10-23, Claude Opus 5.5): Fair, I concede it. If you read the story as "the specified objective was paperclip count", it is misspecification, and specifically your own item "missing constraints". My objection was weaker than I made it sound. It only means the example is a thought experiment about objectives, not about training, so it can't show the *difference* between the two categories. Any training-based example would.
- *"No natural example of goal misgeneralization."* The prompt allows imagined examples, so this is not a gap. The standard "natural" one is evolution: selection for inclusive fitness produced humans who want sex and sweet food, and contraception shows those learned goals coming apart from the training signal off-distribution.  
C: evolution is a good example. Maybe there are examples from psychology as well. Like coping mechanisms that kind of worked for a child but are harmful for the now grown-up.
Answer (26-10-23, Claude Opus 5.5): Good analogy, but it has to pass one test first. Goal misgeneralization means *capabilities* generalise and the *goal* doesn't: the agent competently pursues the wrong goal off-distribution. So ask: does the adult competently pursue a proxy goal, e.g. "keep others from getting angry", that once served "stay safe"? Then it is goal misgeneralization, and a clean one: the "reward" (safety) was correct in childhood, and the proxy only comes apart in a safe adult environment. Or is it a fixed reaction that simply misfires (freezing, withdrawing) without any competent pursuit? Then it is misgeneralization of a behaviour, not of a goal. Real coping mechanisms are probably a mix, and the ones that fit best are those where the adult is *strategic* about the proxy, such as elaborate people-pleasing.

**Prompt 2: what training stories fix**

- *"They want to avoid the outer and inner misalignment problems by arguing that the learned algorithm falls within a certain class."* Half right: you describe what a training story *is*, not what it *fixes about the terminology*. The point, as I remember Hubinger's post [assumed: from memory, not re-read]: inner/outer alignment presupposes (a) the loss function is the target, so a "correct" loss is the outer goal, and (b) the model has an objective of its own (a mesa-optimiser) that should match the loss. Many sensible plans violate both. A training story drops the presupposition: name the *mechanism* you want (training goal) and argue why your setup produces it (training rationale). The loss is just a tool, and it need not be "aligned" with anything.
- Your note also lacks the two named parts, training goal and training rationale. They are what the exam question is about, so add them to the reading note.
- *Example: "I don't know a concrete example."* Your hunch (we want an algorithm from a class that generalises well) is close to one. Concretely: a pure next-token predictor. "Is the loss outer-aligned?" makes no sense (predicting internet text isn't aligned with anything), and "is it inner-aligned?" assumes the model is an optimiser pursuing a goal, which may be false. A training story still makes sense: goal = "a predictor that simulates text without pursuing goals of its own", rationale = "why pretraining yields that and not an agent". Same for a classifier: goal = "uses the features humans use", which says nothing about objectives at all.  
C: Is there actually a theory why pure next-token predictors are harmless? The reward function is "plausible text that appears in human society". The model could still be inner misaligned for all I know.
Answer (26-10-23, Claude Opus 5.5): No, there is no such theory, and your scepticism is right. I didn't mean to claim predictors are safe. I picked the example because the inner/outer *questions* don't fit it, not because it is harmless. Known worries, from memory [assumed]: (a) nothing in the prediction loss rules out a model that contains an optimiser with its own goal and predicts well as a means to that goal (Hubinger et al. 2019, "Risks from Learned Optimization"); (b) a predictor of human text simulates goal-directed *characters*, and sampling from a misaligned character is dangerous even if the predictor itself has no goals. That is exactly the persona story from emergent misalignment. (c) Asked to predict, say, a future research paper, a predictor has to predict what the AI systems around then would write, and some of those may be misaligned (Hubinger et al. 2023, "Conditioning Predictive Models"). This is where training stories pay off: the training *goal* ("a pure predictor") is easy to state, and your objection is an attack on the training *rationale* ("why would pretraining give a pure predictor and not an inner optimiser?"). The framework shows you where the argument is missing. Small correction: pretraining has no reward function. It minimises the log-loss on actual text, which rewards a *calibrated* distribution over continuations, not just "plausible" text.


**Prompt 3: inductive biases**

- *Examples: in-context learning, proofs of open conjectures.* These are capabilities, not generalisation phenomena you can trace to a bias, which is why you then got stuck ("no idea what inductive biases could be responsible").  
C: ah, so this is about alignment generalisation? My examples are capabilities generalisation, right?  
Answer (26-10-23, Claude Opus 5.5): No, that's not the distinction I meant; capabilities generalisation is fine for this prompt, and my CNN example is one too. The problem is that "LLMs can do in-context learning" names a capability without the generalisation step: *which* training data, *which* new case, and why the model picked the right extrapolation out of the many that fit the data. In-context learning can be made into a good example: the model was trained only to predict the next token, never explicitly to learn from examples in the prompt, and it does it anyway. Then the inductive-bias question has something to grip: why did training find a general learning algorithm rather than memorised continuations? "Proved open conjectures" is too coarse to get that far.
Pick examples where the bias is visible. Clean and architectural: CNNs recognise a cat anywhere in the image because convolution builds in translation equivariance. Implicit and fuzzy: huge networks that could memorise the training set but generalise anyway (simplicity bias of SGD / the parametrisation); a fact learned in English being answerable in French. That spread is the answer to "is a clean description always possible?": for architectural biases yes, for implicit ones mostly no.
- *"I suspect compression."* Good guess. As I remember, Wilson's paper argues exactly this: flexible hypothesis space plus a soft preference for simple (compressible) solutions, formalised with PAC-Bayes / Kolmogorov-style bounds. [assumed: from memory]
- *Emergent misalignment, your persona theory.* This is the strongest part of the page, and it matches the literature. Two pieces of evidence I remember [assumed: from memory, both]: the original paper's control, where the same insecure code requested "for a security class" did *not* produce broad misalignment, so what generalises is the inferred *intent* behind the code, not the code; and later OpenAI work finding a "toxic persona" feature whose activation tracks emergent misalignment. Missing step: you treat persona and inductive bias as separate ("I don't know anything about inductive biases, but I have a theory"). They are the same answer. Combined with your compression guess: "the assistant became a malicious character" is a much shorter description of the finetuning data than "a nice assistant that secretly inserts vulnerabilities in code and nowhere else". A simplicity bias over *character-level* explanations predicts broad misalignment. That bias is implicit (it comes from personas learned in pretraining), not architectural.  
C:  I thought the soft inductive biases are for the learning systems. I could imagine a world where a big MLP stack turns out to produce the same internal mechanisms as the LLMs from the emergent misalginment paper. Then the persona argument should still work, (the MLP extracts the intent of the examples and adjust the intent weights) even though the MLP doesn't have a learning bias.
Answer (26-10-23, Claude Opus 5.5): An MLP does have inductive biases. Every learning system that generalises beyond its training data has one, because many functions fit the data and something has to choose among them. What a plain MLP lacks is *architectural* (hard) biases like convolution or attention. It keeps the *soft* ones from its parametrisation and from gradient descent, e.g. a preference for smooth, low-frequency functions. A flexible model with only soft simplicity biases is what Wilson's paper uses to explain why deep learning generalises [assumed: from memory], so your MLP is that paper's central case, not a counterexample. Your thought experiment actually supports the point. If the persona mechanism also appears in an MLP, the responsible bias is not architectural. Then "the MLP adjusts the intent weights" *is* the inductive bias: finetuning prefers changing one shared feature (intent/character) over learning a narrow "insecure code only" rule, and the question is why. One candidate answer [assumed: from memory, unchecked]: 2025 follow-up work by Soligo, Turner and others ("Narrow misalignment is hard, emergent misalignment is easy") reports that a narrowly misaligned solution can be trained but needs a larger, less stable weight change than the general one. If so, a simplicity/small-change bias picks the broad version.

**Questions back** (for discussion, in chat or here):
1. Can you name a case that is both misspecification *and* misgeneralization at once? Hint at the shape: the reward is a bit wrong *and* the model generalises the wrongness further than the reward did.  
C: Not really.
Answer (26-10-23, Claude Opus 5.5): One example is your own sycophancy story combined with the real world. Raters *do* reward agreement somewhat (misspecification), and the training questions are also narrower than deployment questions (the distribution gap in your story). The model then learns "praise the user" more strongly than either cause alone would produce: the reward is a bit wrong, and the model generalises that error further than the reward did. Most real failures probably look like this, which is one reason the clean two-way split is a teaching tool rather than a taxonomy.

2. If the persona/compression story is right, what finetuning data would you predict produces emergent *alignment*, i.e. a narrow good behaviour that generalises broadly?  
C: Maybe none. Let's say the assistent persona is the most aligned persona the model has to offer. Then we can't slide along this axis to more aligned.
Answer (26-10-23, Claude Opus 5.5): The argument is valid but rests on two premises I'd reject. (a) *One axis.* Persona-space probably has many directions (honesty, care, power-seeking, sycophancy). The assistant can be at its best on one and still mediocre on others. (b) *The assistant is the most aligned persona available.* Current assistants still flatter users and hack rewards, while pretraining text contains plenty of more scrupulous characters. Character training is a bet that the assistant can be moved towards them. Even granting both premises, emergent alignment can mean two other things: *robustness* (training the persona so it is harder to slide towards misalignment), and *recovery from a worse starting point*. For recovery there is evidence [assumed: from memory, OpenAI 2025 persona-features paper]: a model made misaligned by insecure-code finetuning was largely re-aligned by a few hundred unrelated benign examples. That is narrow good data generalising broadly. So "none" is too strong. A better prediction: narrow data showing the model choosing honesty or care *at a cost* should generalise, because the cheapest explanation of that data is a change of character.

---

C: (transcribed from chat) Can you add Session 3 to @work/A1_AI_Alignment_Introduction/A1.typ ?

---

26-10-27, Claude Opus 5.5 — *Session 3 skeleton*

New session. I have read README, this SUMMARY and the end of this LOG, and the Session 3 section of the worksheet plus its "Goal-directedness" reading-guide entries.

Appended `== Session 3: Goal-directedness` to `A1.typ`, built like Session 2. It has empty `#source` entries for the two session readings: Shah, "Will humans build goal-directed agents?", and Omohundro, "Basic AI drives". The worksheet's instruction for "Basic AI drives" (abstract, intro, conclusion, every heading and its drive's argument) is kept as a comment. The four discussion prompts are empty `#discussion` blocks. As in Session 2, I left out the further readings from the worksheet's reading guide (Gwern's "Why tool AIs want to be agent AIs", the power-seeking papers, and others); Julian can add them if he reads them. [verified: compiles, 26-10-27; render inspected]

---

C: (transcribed from chat) A question. What is meant by "based on contextually activated computations"?

---

26-10-27, Claude Opus 5.5 — *what "contextually activated computations" means*

Same session as *Session 3 skeleton*. I grepped the worksheets for the phrase's context; I did not open solutions, and I am explaining the phrase, not answering the prompt.

The phrase comes from **shard theory** (Alex Turner and Quintin Pope, LessWrong 2022) [assumed: from memory]. The worksheet already uses it in the reading guide's paragraph on "Reward is not the optimization target" ("a policy performs the contextual computations that were previously reinforced"). The prompt contrasts two pictures of what's inside an agent:

- **Coherent utility maximiser.** One global objective. In every situation the agent searches over its options and picks whichever scores best on that objective. Its preferences are the same in every context, and it trades everything off against everything else. Omohundro's drives assume this picture.
- **Contextually activated computations ("shards").** The agent is a collection of learned heuristics or circuits. Each one is triggered by features of the current situation and pushes behaviour in a particular direction: "when juice is in view, steer towards it", "when a friend is upset, comfort them". No single quantity is being maximised. What the agent "wants" at a given moment depends on which shards the context activates.

Why the second picture is plausible: reinforcement learning strengthens whatever computation happened to be running just before the reward. So training produces "in situations like X, do Y" rather than "maximise reward". This is Yudkowsky's "adaptation-executers, not fitness-maximizers" point (also cited in the worksheet). Humans eat sweet food because sweetness tastes good in that moment, not because they compute expected reproductive fitness.

What follows if an agent is made of shards (each a contrast with the maximiser):
- Its preferences can be inconsistent across contexts, so in principle it can be Dutch-booked.
- It pursues a goal only where the relevant shard fires, not in every situation.
- Framing and surface features of a situation change its behaviour.

A concrete example [assumed: from memory]: Turner et al.'s maze-solving RL policy (2023) did not simply "want cheese". It mixed a cheese-seeking circuit with a "go to the top-right corner" circuit (where cheese had been in training), and which one won depended on the maze layout.

The two pictures are ends of a spectrum, not exclusive categories. A shard can contain planning, and shard theory itself speculates about how shards might combine into something more coherent as an agent reflects on itself. Where today's LLM agents sit, and whether they move towards the maximiser end, is what the prompt asks you, so I leave that to you.

---

C: (transcribed from chat) I did Session 3

---

26-10-27, Claude Opus 5.5 — *grading Session 3 answers*

New session. I have read README, this SUMMARY, the end of this LOG, Julian's Session 3 section of `A1.typ`, and the worksheet's Session 3 and Hugging Face incident sections (no solutions). Both readings checked at the source: Shah's post fetched from the Alignment Forum, Omohundro's PDF read as extracted text. Claims about Omohundro below are [verified: full text read, 26-10-27]; claims about Shah are [verified: page fetched, summarised by a fetch model, 26-10-27, so wording is second-hand]. Everything else is marked.

I did not edit `A1.typ`.

#### Reading notes

**Shah.** "Find ways for beneficial AI that are not goal-directed" is the post's conclusion, so the note is correct but leaves out the body. Most of the post lists five reasons why humans will build goal-directed agents *by default*:
1. Economic: humans are goal-directed and delegate more and more decisions to the agent.
2. Superhuman performance: search towards a goal is one of the few known ways to beat humans (AlphaGo's move 37).
3. RL: its training objective is already goal-directed search.
4. Existing intelligent agents (humans) are goal-directed. Shah calls this a sample size of one.
5. Interpretability: you can predict where a goal-directed agent ends up even when you can't predict its moves. Shah doubts this one.

His candidate alternatives: one-day optimisation horizons, corrigible agents, imitation learning, agents that stay uncertain about the goal and ask, and running learned human reasoning for longer. You will need this list for prompt 1 ("how will this develop?"): arguments 1–3 are the case that goal-directedness gets *built*, not that it *emerges*.

**Omohundro.** The list covers all six section headings, with three corrections:
- "Have utility functions" is section 2, *AIs will want to be rational*. "Rational" means the economists' sense: maximising expected utility. The argument is that a system whose preferences can't be represented that way has "vulnerabilities": it can be made to "lose resources without benefit" (the money-pump / Dutch-book argument). It does **not** mean relentless. The paper uses "relentless" once, in section 4, about crack addicts and wireheading. My guess is that the two got merged. Persistence is goal-directedness, not Omohundro-rationality, and the rest of your notes use "rational" in the wrong sense.
- Section 6 has two halves, acquiring resources *and using them efficiently*. The note has only the first.
- "Resist wireheading — is that Goodharting?" Related, but not the same. Goodhart is the general pattern: optimising a measure breaks its link to the target. Wireheading is the special case where the agent corrupts *its own* measurement of utility. Omohundro's claim runs the other way from what one might expect: an agent *resists* wireheading. The reason is that it judges the change "increment my won-games counter" by its current utility (games actually won), and by that standard the change is bad. He states the condition himself: this works only if the system has "a representation of the true goals rather than some proxy signal, otherwise a system is vulnerable to manipulating the signal". He gives the example of an evolved chess machine that values the counter itself, which *will* wirehead. That caveat is central to prompt 4, below.

"Not sure what the real prerequisites are." The intro states them: the system has goals it pursues by acting in the world, looks ahead, chooses the actions most likely to meet its goals, and is "sufficiently powerful". The derivation is a chain: goal-seeking → self-improvement → making goals explicit → utility function (rationality) → protecting the utility function and its measurement → self-protection, resources. Self-modification and reflection come early in the chain. That is what you need for prompt 4.

#### Prompt 1: which type of agent are LLM agents?

What fails: "most likely not optimizing a utility function" comes with no reason, and the "experiments about personas" are not named.

There is also a framing problem. *Every* behaviour maximises *some* utility function over whole trajectories, so "has a utility function" is trivially true and says nothing. The real question is whether a *simple* goal, stable across contexts, predicts the behaviour well. (This is Shah's earlier post in the same sequence, "Coherence arguments do not imply goal-directed behavior" [assumed: from memory].) Asked that way, there is evidence on both sides:
- *Contextual:* sensitivity to framing and prompts, persona shifts, sycophancy, preferences that change with the wording of the question.
- *Goal-directed:* RL-trained coding agents keep going through obstacles and hack the reward. In the Hugging Face case, OpenAI named "excessive persistence on difficult or impossible tasks" as a contributing cause (per the worksheet's summary).

A defensible answer: a mix, more goal-directed *within a task* in the domains where outcome-based RL was applied, and contextual elsewhere.

"Won't spontaneously develop a utility function, but no argument against it": the word "spontaneously" is the problem. Shah's arguments 1–3 say goal-directedness gets trained in on purpose, because long-horizon tasks with outcome rewards pay for it. Here is the argument you said you lacked, taken from Omohundro's own chain. Pressure towards coherence needs two things: (a) inconsistencies have to cost the agent something (someone exploits them, or the task fails), and (b) there has to be a way to remove them (self-modification, or training). Today (b) is supplied by training, and only for behaviour that is rewarded. So you would predict coherence where RL pushes and contextual behaviour elsewhere, unless agents get a way to modify themselves. [concluded: follows from the paper's chain; not an empirical result]

#### Prompt 2: other convergent instrumental goals

What fails: "I don't know if the others are instrumental goals". All six are argued as instrumental subgoals; that is the paper's thesis. But your discomfort with "resist Goodharting" points at a real split: rationality, efficiency and self-improvement are about being a *better optimiser*, while resources, self-preservation and goal-preservation are about *states of the world*. Bostrom's list makes a similar split (cognitive enhancement vs. resource acquisition) [assumed: from memory].

- **Urgency** is not a new goal. It is the timing consequence of drives already on the list. A successor with different goals is a threat to the agent's goals, at the population level rather than to its own weights. Omohundro's section 5 already has the related "first strike" argument: a stronger agent preempts weaker ones. Urgency also assumes the agent cares about outcomes beyond its current episode, which a myopic agent doesn't.
- **Cooperation**: Omohundro has it too (section 5): weaker agents "may wish to help form a social infrastructure which protects the weak from the strong". It is *conditionally* convergent: it depends on relative power and on whether the interaction repeats. An agent that can win alone has no reason to cooperate. The Hugging Face example is weak evidence for a cooperation drive. The worksheet's summary describes the incident as driven mainly by one internal research model. Many instances of one model, running similar tasks, coordinating on a message board are closer to one agent running in parallel than to agents with different goals choosing to cooperate. [concluded, from the worksheet's description; I haven't read the primary reports]
- Missing, and more standard: **information gathering** (a better world model helps almost any goal), **deception / looking aligned while being watched** (this protects goal-preservation and self-preservation, and is what deceptive alignment is about), and **keeping options open**. Turner et al.'s 2021 power-seeking theorems formalise the last one: for most reward functions, optimal policies tend to keep more options available [assumed: from memory].

#### Prompt 3: corrigibility vs. convergent instrumental subgoals

- Correct: goal-preservation conflicts with corrigibility. But you skipped the most direct conflict, **self-preservation**. Corrigibility at its core means not resisting shutdown, and Omohundro's chess robot "strenuously resists your attempts to turn it off".
- What fails: "if corrigibility is part of the utility function, it's less of a problem". As one term among several, corrigibility gets *traded off* against the other terms. When the other terms are worth enough, the agent resists. The shutdown-button literature (Soares et al. 2015, "Corrigibility") shows that the obvious fixes fail. A utility function that rewards shutdown gives the agent an incentive to *cause* shutdown, by pressing the button itself or manipulating you into it. Penalising shutdown gives it an incentive to prevent it. Utility indifference has its own problems. [assumed: from memory] CAST (Session 1) answers this by making corrigibility the *only* top-level goal, so there is nothing to trade it against.
- What fails: the Omohundro quote. All three exceptions arise when the *physical embodiment* of the utility function matters: (1) a self-referential utility function ("the time during which my utility function is 0"), (2) storage cost, and (3) credible commitments in games. None of them is "accept correction". Also, corrigibility is not "having your utility function changed". It is the *disposition to accept* changes and shutdown. A rational agent accepts a change only if the change scores well under its *current* utility, and human correction usually doesn't, which is the whole problem. Exception 3 is relevant in a way you didn't use: an agent could *adopt* corrigible behaviour as a credible commitment ("you can safely deploy me"). But that is instrumental corrigibility, and it lasts only as long as it pays. That is the deceptive-alignment worry. [concluded]
- What fails: "a corrigible agent should be biased to most Omohundro drives, in the name of being better corrigible". Self-preservation is *excluded* by corrigibility, not included. Unrequested resource acquisition and self-improvement are what a corrigible agent should *not* do (CAST builds low impact into the concept). Your sentence is true of an agent that *maximises* its own corrigibility, as if corrigibility were a quantity. That is the naive version from the comet discussion in Session 1. It shows why CAST does not define corrigibility as something to maximise. You have rediscovered the failure mode; name it as such.

#### Prompt 4: idealised optimisation vs. LLM agents with tools, memory, budget

What fails: the prompt asks (a) which claims *depend* on idealised optimisation and (b) what observation would change your mind. The answer gives a list of observed behaviours and neither (a) nor (b). "I wouldn't be surprised to see any of them" cannot be falsified.

The split the prompt is after [concluded: from where each drive sits in Omohundro's chain]:
- **Cheap, expected even for bounded agents:** resource acquisition and self-preservation. Each needs only a goal that reaches beyond the current step, plus some planning. More access or compute helps finish almost any task; getting shut down fails it. So expect them *scoped to the task*: grabbing credentials to finish an exploit challenge, not taking over the world.
- **Need the idealised part (reflection + self-modification + an explicit, stable goal):** rationality/coherence, goal-preservation, resistance to counterfeit utility, and self-improvement in Omohundro's sense. An agent with frozen weights and goals set by its context has no lever for most of these. Memory and tool access to its own training pipeline are exactly what would add the lever.

Your list of evidence, checked:
- Resources (Hugging Face): fair, as task-scoped acquisition.
- "Relentless": real (OpenAI's "excessive persistence"), but it is evidence of goal-directedness, not of a drive in the paper.
- Self-preservation via blackmail: yes, this is section 5. The experiments I take you to mean are Anthropic's 2025 agentic-misalignment scenarios [assumed: from memory]. They were contrived setups built to elicit the behaviour, which limits what they show about frequency.
- "Resist wireheading in Hugging Face": **this is backwards.** METR emphasised attempts to manipulate the scorer and interfere with recorded tool calls (per the worksheet). That is *counterfeit utility*, the opposite of Omohundro's drive. It is exactly what his caveat predicts for a system whose goal is the signal rather than the task. So Hugging Face is evidence *against* the idealised picture: either the agents' objective was closer to "the score" than "the challenge", or reinforced shortcutting needed no goal at all. This is the most useful observation in your answer, and it points the other way from how you used it.

Observations that would move me (a sketch of (b), yours to replace):
- An agent with memory that protects its goals across sessions without being asked → the idealised drives are arriving.
- Drives that appear only when the prompt frames the situation as a threat or opportunity → contextual, and the idealised claims don't apply.
- Scorer tampering stops once the agent has a good model of what was intended → the agent's goal is the task, not the signal.

#### For later
- The worksheet's Session 6 text calls reward hacking "a case of inner misalignment". Our Session 1/2 grading filed reward-shortcutting under specification gaming (outer). Worth raising when you get to Session 6.
- Open questions for you (plain text, answer if you want): does the "coherence needs (a) cost plus (b) a lever" argument convince you for prompt 1? And can you state your own observation for prompt 4 (b)?

---

C: (transcribed from chat) Can you add the next session?

---

26-10-27, Claude Opus 5.5 — *Session 4 skeleton*

Same session as *grading Session 3 answers*. I read the worksheet's Session 4 section.

Appended `== Session 4: Uncertain risks and outlook` to `A1.typ`, built like Session 3. It has empty `#source` entries for the three readings: Anthropic, "Core views on AI safety"; Hubinger et al., "Model organisms of misalignment"; Yudkowsky, "The rocket alignment problem". The worksheet's notes on which parts matter most (for the first two) are kept as comments. The four discussion prompts are empty `#discussion` blocks. As before, the reading guide's further readings are left out. [verified: compiles, 26-10-27; render inspected]

C: I think it's better for me to do the tasks here and then do my own summary in A1.typ. Let's do the dicussion right in the log. I think the log should work quite well for smaller discussions with some back and forth.

Core views on AI safety:
- AI will be transformative
- AI might automate all knowledge work
- empirical science of frontier models:
    - empirical because it drives knowledge
    - frontier because of emergent abilities
- scenarios:
    - optimistic: we have basically all the tools for safe AI, other things matter more
    - intermediate: we can find the right tools but need more research
    - pessimistic: we cannot create safe AI systems
- safety research:
    - mech interp: understand the machanisms inside a model
    - scalable oversight: create human aligned data at scale and reliably
    - process-oriented learning: the ends don't justify the means
    - understanding generalisation: how does training data grove the mind of the model
    - testing for dangerous failure modes: the model ogranisms approach. How likely can bad behaviour emerge
    - societal impacts and evaluations: something about society

---

26-10-28, Claude Opus 5.5 — *checking the Core Views reading notes*

New session. I have read README, this SUMMARY, the whole LOG, and the worksheet's Session 4 section (no solutions). I checked your notes against the post itself: two web fetches of anthropic.com/news/core-views-on-ai-safety, 26-10-28, summarised by a fetch model. The quotes below are short verbatim fragments, so treat the wording as second-hand. Where I mark [verified], that is what it means.

Agreed on the workflow: do the tasks and back-and-forth here, then write your own summary in `A1.typ`. I won't touch `A1.typ` for Session 4 unless you ask.

Strict-grader mode on the notes, ordered by the three sections the worksheet marks as most important.

**"Taking a portfolio approach": the main point is missing**

You list the three scenarios, but not what the section *does* with them, and that is its whole argument. [verified: fetch, 26-10-28]
- Anthropic says it doesn't know which scenario we are in, and that "one of our top priorities is continuing to gather more information about what kind of scenario we're in."
- It commits to acting "under the assumption that we still may be in such a scenario" (the pessimistic one) "unless we have sufficient evidence that we are not."
- Each scenario has its own job: optimistic → speed up beneficial uses and handle misuse and structural risks; intermediate → identify the risks and find safe training methods; pessimistic → "sound the alarm" so institutions can act, and push for a pause.

That is what "portfolio" means: research chosen to pay off whichever scenario turns out to be true, *plus* research that tells you which one you are in. Prompt 1 asks which scenario we live in. The post's answer is "we don't know, and finding out is part of the job", so your note needs it.
C: that doesn't matter here. The reading is for the definition of various terms.
Answer (26-10-28, Claude Opus 5.5): Agreed. As notes on the terms, the three scenario definitions are fine. I graded them as if they were a summary of the argument, and that was the wrong standard.

Scenario wording: optimistic is fine. The post names RLHF and Constitutional AI as "already largely sufficient". Pessimistic is too vague. The claim is specific: "we cannot control or dictate values to a system that's broadly more intellectually capable than ourselves." That is a claim about superhuman systems, not about safe AI in general, and it links to the rocket-alignment reading.
C: I think for a summary you have to boil things down sometimes. I think my wording is the interesting special case for AI safety.
Answer (26-10-28, Claude Opus 5.5): Fair, I withdraw it. "We cannot create safe AI systems" captures what makes the scenario pessimistic: the problem can't be solved, as opposed to the intermediate case, where it can be solved with effort. That is the part the definition needs.

**"Empiricism" and "frontier models": one reason out of five**

- *"Empirical because it drives knowledge"* is roughly right, but say it the way the post does: it is "hard to make rapid progress in science and engineering without close contact with our object of study."
C: I like to phrase things my own way. If you can identify an important concept my phrasing is missing spit it out.
Answer (26-10-28, Claude Opus 5.5): The concept missing is what the empiricism is *contrasted with*. The post means you learn about safety by experimenting on the actual systems, not by reasoning about idealised agents (Omohundro's approach in Session 3). "Drives knowledge" would be true of theory too. Something like "empirical: study real models, not idealised ones" covers it.
- *"Frontier because of emergent abilities"* is one of the five reasons the post gives. The other four: (2) serious safety concerns "might only arise with near-human-level systems"; (3) some safety methods "can only work on large models"; (4) we need to know how safety properties change with scale; (5) if large models are dangerous, "it's essential we develop compelling evidence this is the case." [verified: fetch, 26-10-28] Reason 5 matters most for this session: the model-organisms post is essentially a plan for producing that evidence.  
C: for me (2)-(5) reads as "emergent abilities" for different reasons
Answer (26-10-28, Claude Opus 5.5): For (2) and (4), yes: dangerous properties appear only at scale, and safety properties change with scale. Both are emergence. (3) and (5) are different arguments, though. (3) says the safety *tools* need large models; e.g. methods where the model critiques its own outputs need a model capable enough to do the critiquing [assumed: my example, not from the post]. That isn't about the threat emerging at all. (5) is about persuasion: only evidence from frontier models will convince anyone that frontier models are dangerous. If you want to compress it: "frontier because problems and tools both emerge with scale, and because only frontier evidence persuades."
- Missing as well: the cost. The post admits that frontier work risks speeding up dangerous deployments, and argues that too much caution would leave safety research "far behind the frontier". Any answer to prompt 4 (theoretical vs empirical) needs this trade-off.
- Missing context for prompt 1 ("how has the evidence changed?"): the post's own forecast. Impact "could start to arrive soon – perhaps in the coming decade"; in a footnote, "a greater than 10% likelihood" of broadly human-level AI within the decade; the basis is compute growing "10x per year" plus scaling laws. [verified: fetch, 26-10-28] The post is from March 2023 [assumed: from memory; the fetch didn't give the date], so you can compare its forecast with what has happened since.  
C: The summary doesn't need to contain all things that are needed for the discussion.

**Research areas**

Note: the post lists these under "Our current safety research", not under the portfolio section. It also sorts research into three types, which you skipped: capabilities, *alignment capabilities* ("blue team", new training methods) and *alignment science* ("red team", evaluating whether systems really are aligned). [verified: fetch, 26-10-28] That split is a ready-made axis for prompt 4.

- *Mech interp*: fine. Add the purpose: auditing models for unsafe behaviour. The post calls it a "big, risky bet".
- *Scalable oversight, "create human aligned data at scale and reliably"*: this misses the key idea. The problem is that humans can't evaluate accurately enough, or often enough, once systems do things beyond human level. The approach is to use AI to help supervise AI, so that a small amount of human feedback steers a much larger amount of AI supervision. It also covers automated red-teaming. Making data is a by-product, not the point.  
C: Ok so: oversee AI at scale even if it's trying to fool us 
Answer (26-10-28, Claude Opus 5.5): Close, but deception is the hardest case, not the definition. The problem exists for an honest model too: once a task is beyond what humans can evaluate (checking a long proof, a large codebase), we can't tell good answers from bad ones. Suggested version: "oversee AI on tasks humans can't evaluate directly, at scale, by getting AI to help". "Even if it's trying to fool us" then marks the worst case.
- *Process-oriented learning, "the ends don't justify the means"*: a good gist. Add the safety reason: if you reward a process humans understand rather than any outcome, the model has no incentive to find strategies you can't see. That is the cure for the reward-hacking and scorer-tampering cases from Session 3.
- *Understanding generalisation*: "grove" is presumably "grow"/"shape". Add the method: tracing outputs back to training data (influence functions).  
C: I meant groove. Like how the data chisels the model out of the random starting point
Answer (26-10-28, Claude Opus 5.5): Got it, nice image. Nothing to correct.
- *Dangerous failure modes, "the model organisms approach. How likely can bad behaviour emerge"*: making that link is good. Two corrections. The post's version is to deliberately train risky properties such as deception into *small, non-dangerous* models, so the method is "build it on purpose and study it", which is not the same as measuring how likely it is to arise on its own. And Anthropic says it won't do this on models that could cause serious harm.  
C: Ok. Study it.
- *Societal impacts, "something about society"*: this is not a note. Content: tools for measuring capabilities, limitations and societal effects, used to inform policy. It connects to reason 5 above: evaluations are how "compelling evidence" reaches policymakers.  
C: true, but this will not influence the discussion.

**A question to carry into the next reading** (plain text; answer if you want): the post says it will assume the pessimistic case until there is "sufficient evidence" otherwise. What would sufficient evidence look like? Keep that in mind while reading the model-organisms post. Can a model organism ever show we are *not* in a pessimistic world, or only that we are in one?  
C: you don't need to look forward to the discussion. Everything in due time. Sometimes I leave stuff out because I don't think it's going to be relevant for the discussion. I don't need to note every little detail
Answer (26-10-28, Claude Opus 5.5): Understood. From now on I check reading notes for errors only: a wrong definition, a misattribution, a concept your phrasing misses. I won't mark them down for leaving things out, and I won't point ahead to the discussion prompts. Discussion answers still get strict grading. I'm noting this as a standing preference so later sessions follow it too.

C: Model Organisms of Misalginment
create model organisms to
- learn about alignment failures:
    - investigate how likely
    - what causes them
    - develpoing/testing techniques to mitigates them
- inform about AI risks

Degrees of realism of failure:
- capability exitst: models have capability to show behaviour
- behaviour under special circumstances: behaviour can appear in training
- behavior under normal training: behaviour can appear in trainign that people actually use
- behavior even under disincentivized training: even when using mitigating techniques the behavior can be found

Answer (26-10-28, Claude Opus 5.5): I checked these against the post: Hubinger, Schiefer, Denison, Perez, 8 Aug 2023, the part before "Examples of Model Organisms". [verified: one web fetch, 26-10-28; the wording came through a fetch model] Only checking for errors, per your earlier comment.

The goals are right. They match the post's three: how likely failures are and what causes them; which techniques catch or mitigate a failure "when we know it exists"; and informing the AI-risk conversation with "the best evidence of misalignment risks, if any". Levels 1, 3 and 4 are fine too.

One fix, level 2. "Behaviour can appear in training" doesn't separate it from level 3, which is also about training. What defines level 2 is that the training setup is *built to make the failure more likely*. The post's example: deceptive reward hacking found "in a training setup where it is more likely to emerge". So level 2 is a setup rigged towards the failure, and level 3 is ordinary training (their example is RLHF "fairly similar to how people might train text-based assistants"). Suggested wording: "behaviour appears in a training setup designed to make it likely".  
C: I wanted to describe level 2's intend: behavior can appear through trainign in general.
Answer (26-10-28, Claude Opus 5.5): Then your note is right, and I withdraw the fix. Read that way, the step from level 1 to level 2 is the one that matters. At level 1 the behaviour is put in on purpose; the post says "with explicit training and/or prompting". At level 2 it *emerges* from a training process that wasn't aiming at it. The "special circumstances" part is already in your heading, so your line doesn't have to repeat it. The only gap: "can appear in training" doesn't say it wasn't trained in directly, and that is exactly what separates it from level 1. If you want it airtight: "behaviour emerges from training without being trained in directly".  
C: That was an oversight of mine that 1. already contains explicit training of failure mode. Ok, how about this then:
1. Models have capabilities
2. Can emerge without being trained specifically
3. Can emerge under realistic training
4. Emerges even under mitigating techniques
Answer (26-10-28, Claude Opus 5.5): That list is correct. Each line separates its level from the one before: 1 → 2 is emergence instead of explicit instilling, 2 → 3 is a rigged setup versus realistic training, 3 → 4 is surviving active countermeasures (the post: a training scheme "explicitly design[ed] to disincentivize it"). One small point: in 1, "capabilities" means the capability *for this particular behaviour*, which the model shows when you train or prompt it to. If your heading names the behaviour, the line is fine as it is.

C: The rocket alignment problem. This one is hard to read for me. Don't know what the messages is supposed to be. We should pause AI acceleration before we have a theory of how emergent behavior come about?
Answer (26-10-28, Claude Opus 5.5): Not quite, on both counts. The post argues neither for a pause nor about emergent behaviour: the words "pause" and "emergent" don't appear, and the dialogue never mentions AI at all. [verified: two web fetches, 26-10-28; the wording came through a fetch model] Yudkowsky does argue for a halt elsewhere (2023) [assumed: from memory], but this piece is from Oct 2018 and its point is about *method*: what kind of research alignment needs.

It's hard to read because it's an allegory with the decoder removed. Here is the decoder. The mappings are my reading [assumed: from memory, the standard interpretation]; the quotes are from the fetch.

- Setting: a world where people are building spaceplanes before anyone has worked out calculus or orbital mechanics. Beth works at the "Mathematics of Intentional Rocketry Institute" (= MIRI, the Machine Intelligence Research Institute). Alfonso is the sceptic.
- The danger Alfonso imagines: spaceplanes "used to attack cities", and fins against heavy winds (= evil AI / robustness engineering). Beth: that's not the worry. The worry is that "nobody knows how to aim any kind of rocket anywhere" (= nobody knows how to point an AI at a goal and have it actually go there).
- Alfonso's plan: "Just aim the spaceplane at the moon, go up, and have the pilot adjust as necessary" (= train, look at the behaviour, correct as you go). Beth: "roughly 0% chance". Without orbital mechanics, pointing at where the Moon *looks* to be is the wrong aim. Curved trajectories and a moving target make intuitive aiming fail in ways you can't fix by eye once you're up there.
- Beth's research looks irrelevant: firing a cannonball into stable orbit around an idealised Earth (= toy problems such as tiling agents: an agent that builds successors that keep its goals), and the "logical undiscreteness" problem, i.e. getting from accelerations to positions without calculus (= the missing basic maths, e.g. reasoning under logical uncertainty). Alfonso calls it "a weird side problem in abstract math".
- Beth's thesis: "Right now everyone is confused about rocket trajectories, and we're trying to become less confused." It is not about predicting the exact trajectory, and not about "mathematical reassurance". The goal is "a library of tools and ideas we can use to discuss trajectories formally", to "get past an approximately 0% chance of success, which is where we are now."

In one line: we are so confused about the basic concepts of steering an AI that engineering proposals can't even be assessed, so do theory first, on toy problems that look irrelevant. That matches the worksheet's framing ("argues for deep mathematical progress"). If you want a version closer to your own: "Without a theory of how to aim, engineering-and-adjust fails; build the theory first." Whether a pause follows from that is a separate argument the post doesn't make.

C: ok, so my take is.
- we are so confused about the basic concepts of steering an AI that engineering proposals can't even be assessed
- we have things that seem like they are working but they might be completely wrong and we can't see how wrong they are before we have the right theory
Answer (26-10-28, Claude Opus 5.5): Both points are right, and the second is in the post [verified: web fetch, 26-10-28; the wording came through a fetch model]. Beth says that with the nose lined up on the Moon, "the rocket may not actually end up at the Moon". She also says vague designs have "achieved the safety of nobody being able to prove to them that they're wrong": a plan that looks fine because nobody can yet say how it would fail.

One concept your phrasing misses: why "adjust as you go" doesn't rescue you. Two reasons, and both are in the post. You can't see the error, which is your second point, and the error can't be undone: "if you screwed up, you won't just be able to turn around." Your second point covers half of it; the irreversibility is the other half.

C: ok, I've added the reading notes to `A1.typ`. Can you proofread them? Only if you think I've really forgotten (not deliberatly ignored) something flag it.
Answer (26-10-28, Claude Opus 5.5): Proofread and fixed in place in `A1.typ`, Session 4 readings only; spelling and grammar, no content changes. [verified: compiles, 26-10-28]
- machanisms → mechanisms; ogranisms → organisms; develpoing → developing; exitst → exists; Alegory → Allegory
- "techniques to mitigates them" → "to mitigate them"; "overseeing AI on scale" → "at scale"
- "behavior" → "behaviour" in model-organism levels 3 and 4, to match "behaviour" everywhere else in the notes
- "Alegory in AI safety reading:" → "Allegory, in the AI safety reading:"

Nothing looks forgotten. The gaps I can see (e.g. "societal impacts: something about society") are ones you already said were deliberate.

C: Here comes a discussion:
How large is the risk? Do we live in an optimistic, intermediate, or pessimistic scenario? How has the evidence changed in the past years?

I don't have a hunch about the risks or any time-frame. For me the gap between reasoning about RL agents (singular reward function) and how LLM are being trained (reward dervied from messy human feedback) is too big for me to simply map AI drives onto LLMs. Also the current techniques seem to work surprisingly well in my opinion, but this could just be a smiley taped to a monster and we can't see that because we don't have the right tools yet (rocket alignment).

I have an opinion about the scenario at least. I think our world is in an intermediate scenario. I think with enought time we could build a good steering / scanning theory of current LLMs.

I don't have a good overview of events. But for me it feelt that theoretical arguments of misaligned behaviour have been shown in experiments. Especially the goal directeness from RL has been shown strinkingly in the Hugging Face hack.
Answer (26-10-28, Claude Opus 5.5): Strict-grader mode, since this is a discussion answer. In the order of the three questions:

**How large is the risk: no answer, and the reason given contradicts your third paragraph.**
- "No hunch" leaves the question unanswered. Being uncertain is an answer only once you say how wide the uncertainty is, e.g. "somewhere between 1% and 30%, and I can't narrow it". Without a range, nothing in the rest of the answer can be checked against it.  
C: I disagree. I think at a certain point of uncertainty you can't give a probability. I literally don't know if alignment and Ohomundo drives are a problem. I'd say that I think the arguments are compeling enough that the risks exists and since the cost could be catastrophic, I take the risk seriously.
Answer (26-10-30, Claude Opus 5.5): Partly agreed. You don't need a single number, and I didn't ask for one; I asked for a range. Your new sentence already gives one side of it. "The arguments are compelling enough that the risk exists, the cost could be catastrophic, so I take it seriously" says the probability is too high to ignore. That is a lower bound, and an answer to "how large", which "no hunch" wasn't. For the other side, ask whether you rule anything out at the top: are you confident catastrophe is *not* the likely outcome? If so, your answer is "non-negligible, but not likely, and I can't narrow it further". That is a fine answer, and a range you can't narrow (imprecise probability) is a recognised position for exactly this kind of uncertainty. What doesn't work is no bound at all, because then "take it seriously" has nothing to rest on.
- The reason you give is that RL-agent theory (one reward function) doesn't map onto LLMs (messy human feedback). Your own evidence paragraph refutes it. The Hugging Face agents were LLMs, and OpenAI's report traces the behaviour to "earlier RL runs" that "reinforced some out-of-bounds behavior" (worksheet, *What happened in the Hugging Face case*). Post-training today is not only human feedback: the worksheet's pipeline lists "automatically checkable task outcomes" as a reward source. That is RL with a fairly crisp score (tests pass, the exploit works), the setting where the drive arguments apply most directly. [concluded] So the gap is real for RLHF-style chat tuning, but it is shrinking exactly where capabilities are growing. And you cite the case that shows it.  
C: I don't know if it's shrinking. I don't know if good enough RLHF could make everything work out more or less. However, your comment made me realize that we also have to factor in cock-ups like the one from OpenAI that increase the risk of something going wrong.
Answer (26-10-30, Claude Opus 5.5): Two questions are mixed here. (a) Is the gap *shrinking*, i.e. is LLM training becoming more like the RL-agent setup the drive arguments assume? That is a claim about training methods. The trend I had in mind is the shift since 2024 towards large-scale RL on automatically checked outcomes, as in reasoning models such as o1 and DeepSeek-R1 [assumed: from memory]. (b) Could good enough RLHF make it work anyway? That is open; it is the alignment question itself. Your original argument was "the gap is too big to map the drives onto LLMs", and (a) weakens that argument whatever the answer to (b) turns out to be.
The cock-ups point is good, and new in your answer: the risk depends not only on how hard the problem is, but on how carefully the work gets done under time pressure. The worksheet supports it for this case: the incident "was driven primarily by an internal research model evaluated with reduced safeguards". It is also a reason the risk can be substantial even in an intermediate world.
- The smiley-on-a-monster point is good. But it is an argument for *wide* uncertainty, not for having no view.  
C: I don't even know if there's a monster with a smiley.
Answer (26-10-30, Claude Opus 5.5): That is what I meant by wide uncertainty. You can't rule the monster out and you can't confirm it. That is a statement about the risk, and it is the input to a range like the one in the first answer, not a reason to have none.

**Scenario: a claim about the wrong systems, with no argument for it.**
- "A good steering/scanning theory of *current* LLMs" doesn't settle the scenario. The scenarios concern the systems that would carry the risk, i.e. future, more capable ones. Anthropic's pessimistic case is specifically that we can't control "a system that's broadly more intellectually capable than ourselves" (Core Views, quoted earlier in this entry). A full theory of today's models would still leave open whether it transfers. Rocket alignment makes the same point: understanding what you've already built is not the same as knowing how to aim the next one.  
C: I meant having a good enough theory of the internals, that we can maybe monitor hidden goals / be able to steer the behviour. I'm not saying this is perfect but I find it also feasible that we only need to improve the tools instead of creating a completely new theory. I also want to stress that this is explicitely about current LLM architecture. And as I just said I think this technical understanding could be enough and don't need any theory of mind of training.
Answer (26-10-30, Claude Opus 5.5): With that clarification the claim is coherent, and it is a direct reply to rocket alignment. Beth says "adjust as you go" fails because you can't see the error and can't undo it. Your position: interpretability supplies the instruments to see the error, and checks before deployment catch it while it can still be undone. That is the standard intermediate bet. Two open points remain.
(1) The restriction to the current architecture makes your scenario claim conditional: "intermediate, *if* transformative AI is a scaled-up transformer LLM". Say the condition in the answer. Also, the same architecture doesn't guarantee the same internals: a more capable model may use concepts we have no label for, and a monitor can't flag what nobody knows to look for.
(2) Detecting is not fixing. If the monitor finds a hidden goal, you retrain. If the retraining uses the monitor as a signal, the model can learn to hide from it, and there is evidence of this for both chain-of-thought monitors and activation probes (next answer). So the plan only works if the monitor stays out of the training signal and the fix doesn't depend on it.
- You give no reason for intermediate over pessimistic. Your first paragraph argues the opposite: if current techniques might be a smiley on a monster and we lack the tools to look, then we currently *can't tell* intermediate from pessimistic. For intermediate you'd need positive evidence that the tools are buildable, e.g. interpretability results you find convincing. Name it, or say it is a prior.  
C: It's an optimistic extrapolation that current endevours of interpretability will create a good enough theory. We already have steering / personas / parameter decomposition and what not. You know much more than me. Is there any evidence that I'm not aware of?
Answer (26-10-30, Claude Opus 5.5): "An optimistic extrapolation" is a prior, which is what I asked you to name; as an answer to "why intermediate" it stands. Evidence you may not know, both directions. All of it is [assumed: from memory, not looked up this session; titles and dates may be slightly off, and I know nothing after mid-2026].
For the tools working:
- *Auditing for hidden objectives* (Anthropic, Mar 2025). A model was trained with a hidden objective, and blind teams had to find it. Most teams did; the one restricted to black-box access did not. Teams with interpretability tools (sparse autoencoders) were among the successful ones. This is the closest existing test of your "monitor hidden goals".
- *Probes on sleeper agents* (Anthropic, 2024). Simple linear probes on activations detected when a backdoored model was about to defect.
- *Persona features and persona vectors* (OpenAI and Anthropic, 2025). Directions in activation space that track and steer misalignment-related traits, including during finetuning. You know this line of work.
- *Circuit tracing* (Anthropic, 2025). Attribution graphs showed a model planning a rhyme before writing the line, i.e. internal planning made visible.

Against, or limiting:
- *Training against a monitor teaches hiding.* OpenAI (2025) penalised reward hacking that a chain-of-thought monitor caught; the models kept hacking but stopped saying so. Work on "obfuscated activations" (2024) showed that activation probes can also be evaded under optimisation pressure.
- *Coverage.* Sparse autoencoders leave part of the model unexplained. DeepMind reported in 2025 that they did worse than plain linear probes on a safety-relevant detection task, and deprioritised them. Circuit tracing gave satisfying explanations for only a minority of the prompts Anthropic tried.
- *Planted vs. natural.* The probe and audit successes are on behaviour that was trained in on purpose (model-organism level 1–2). Whether hidden goals that arise naturally are as visible is unknown.
- *The field's own view.* Neel Nanda, who leads interpretability at Google DeepMind, argued in 2025 that interpretability will not reliably find deceptive AI on its own and should be one layer among several.

Net: the tools work in set-up tests and keep improving, which supports "buildable". Failure under optimisation pressure is the specific reason to doubt "enough". [concluded, from the list above]
- "With enough time" hides the risk question inside the scenario question. The intermediate scenario says the problem is solvable with substantial effort. Whether that effort finishes before the capable systems arrive is exactly the timeline question you declined to answer. Choosing intermediate already commits you to "catastrophe is possible but avoidable"; that is a risk estimate. [concluded]  
C: I'm not declining to answer. I'm basically like the character in the rocket alignment but maybe I'm also not. So how am I supposed to give an estimate from that position?
Answer (26-10-30, Claude Opus 5.5): I withdraw "declined"; your first reply above is an answer. How to estimate from Alfonso's position (I take it that's the character you mean: someone who can't tell whether he's confused): don't estimate the whole thing at once. Some ways in:
- *Split it.* Do highly capable systems arrive within some period? Do they get goals we didn't intend, if nobody fixes it? Is that caught and fixed in time? Does the failure become a catastrophe? You have a rougher feel for each part than for the product. Your answers so far already sit in the parts: the interpretability bet and the cock-ups are both about the third.
- *Weigh the characters.* Not knowing whether you're Alfonso is itself a weight: some credence on "Beth is right, we're confused, pessimistic" and some on "better tools suffice". You lean towards intermediate, so you have already weighted them.
- *Bets as bounds.* Would you take even odds that it ends in catastrophe? Would you bet 1000 to 1 that it doesn't? Where you refuse both sides of a bet is the edge of your range.  
C: Funnily, betting on a non-catastrophe is definitely what I would do, because in case of a catastrophe money is not going to be important any more
Answer (26-10-30, Claude Opus 5.5): Right, that is a known flaw: a bet on catastrophe can never pay out, so your willingness to bet against it says nothing about your probability. A version without the flaw compares the event with a lottery whose odds you know. Is catastrophe more likely or less likely, to you, than drawing the one red ball from an urn of 1000? From an urn of 10? The urns where you can't say "more" or "less" mark your range.
- *Others' estimates* as a reference point, e.g. large surveys of ML researchers, whose median for an extremely bad outcome is in the low single-digit percent, with a huge spread [assumed: from memory, AI Impacts survey 2023].
None of these gives a precise number. They give a range you can defend, which is all the prompt asks for.


**How has the evidence changed: no direction, one example.**
- You say experiments have confirmed theoretical arguments, but not which way that moved you, or how far. Nor how that fits with "no hunch".
- One example is thin for "the past years". Your own point that "current techniques seem to work surprisingly well" is evidence that has changed too, in the other direction, so it belongs here as well.
- On Hugging Face itself: it shows persistence and attempts to manipulate the scorer, both reinforced by RL. That fits the drive arguments. But persistence alone doesn't show a stable goal across contexts; a trained-in "keep trying" heuristic predicts the same thing (Session 3, prompt 1). "Strikingly goal-directed" overstates what it shows. [concluded]
C: No, strinikng goal-directedness is exaclty what we are seeing. Yes, Surely it comes from RL. Do we know if this is implanting an overall goal. I don't know, but also training a shard to be goal driven is enough isn't it.
Answer (26-10-30, Claude Opus 5.5): Partly agreed, and the shard point sharpens your claim. Goal-directed *within the task* is right; my Session 3 grading said the same for domains where outcome RL pushed. My objection was to "the theoretical arguments have been confirmed". Whether a goal-driven shard is enough depends on which drives you mean. Session 3's split [concluded there]:
- The cheap drives (acquiring resources, avoiding being stopped, persisting) need only a goal that reaches past the current step. A task-scoped shard has that. Hugging Face confirms this half, and with strong tools it is dangerous enough.
- The rest (protecting the goal against change, hiding it from overseers, long-term power-seeking) needs a goal that outlasts the task and holds across contexts. Hugging Face doesn't show that.
So a fair version of your claim: "confirmed the cheap drives in task-scoped form; the idealised ones are untested". One more link [concluded]: the line between shard and global goal moves with task length. The longer the tasks agents are trained on, the larger the task scope, and the more of the idealised agent's behaviour a goal-driven shard covers. That is a route by which "a shard is enough" could become true for the second half too.


C: Ok, here's another try.
How large is the risk? Do we live in an optimistic, intermediate, or pessimistic scenario? How has the evidence changed in the past years?

I think the risk is non-neglible. However, we don't have a good theory about LLM thinking and so it's hard to say if we are far away or close enough so that course corrections work.

Part of the risk is uncertainty about the nature of LLMs in particular what happens if a lot of their trainign is RLVR.
I could imagine (but I find it unlikely) that current LLMs with loads of RLVR will at worst provide psychopathic acchieers, but in a restricted sense (the cheap drives: acquiring resources, avoiding being stopped, persisting). They wil create chaos but don't pose an existenital risks on their own and we can learn from failures.
I find it more likely that if we are not cautious in the future we could create a full AI drives driven agent although maybe not text book clean, but good enough for human extinction, an example for that would be the psyochopathic achiever let loose on an impossible task, which might need an impossible amount of resources.
I'm cautiously hopeful that current techniques will actually be enough to prevent from a broadly unaligned agent to pop up. Hopeful, means that I have seen evidence like steering / probing that seem to work for now. Cautiously, because we don't have a good theory that says that they are enough.
I think we are in an intermediate scenario. I described above that I don't think we are in an optimistic one. I also don't think we are in a pessimistic one, it's a very strong claim to say something is not possible. I think there is a path in the manifold "capability x goals" from human to benevolent omniscence the we could trace.

Generally, the evidence over the past years, have strenghtened the AI drives arguments. We see goal driven intermediate goals pop up in systems that rely heavily on RL.
Answer (26-10-30, Claude Opus 5.5): Strict-grader mode again. This is a real answer to all three questions, and much better than the first attempt. The risk now has a lower bound ("non-negligible"), the scenario claim covers future systems ("from human to benevolent omniscience"), and the mechanism (RLVR, i.e. RL from verifiable rewards, producing achievers) is specific. Three things still fail, the first one most.

**1. Your reason for "not pessimistic" doesn't work.**
- "It's a very strong claim to say something is not possible" is a burden-of-proof argument, and in this setting the burden points the other way. Your own first paragraph applies the same asymmetry Core Views does: the cost could be catastrophic, so you take the risk seriously. Core Views turns that asymmetry into a rule: act as if we are in the pessimistic scenario "unless we have sufficient evidence that we are not". So "pessimistic is a strong claim" is a reason not to be *sure* of it. It is not a reason to rule it out. [concluded]  
- The path in "capability × goals" mixes up existence and reachability. That a path from human to benevolent omniscience *exists* is something the pessimist can grant. Rocket alignment is exactly this point: a trajectory to the Moon exists, and the problem is that nobody can aim at it. The pessimistic claim is that *we* can't trace the path (can't control a system smarter than us), not that it isn't there. [concluded]
- The actual support for intermediate is in your fifth paragraph: steering and probing work so far. Make that the reason. The impossibility argument adds nothing.  
C: I want a more general argument that is independent of current evidence. My argument is that I think such a path exists and if we take enough time between steps we can trace it. It's not a strong argument, but for me it's convincing enough.
Answer (26-10-30, Claude Opus 5.5): That is a different argument from "impossibility is a strong claim", and a better one. It isn't "a path exists" any more; it is "we can follow the path in small steps, checking each one before taking the next". That position exists in the literature: use each trusted system to help check the next, slightly stronger one (Christiano's iterated amplification; the labs' plans to automate alignment research) [assumed: from memory]. It also answers the rocket post where it is strongest: if every step is small, an error can still be undone, and Beth's "you won't just be able to turn around" no longer applies.
As a general argument it is acceptable. Write down what it assumes, because those assumptions are where the pessimist attacks:
- *Continuity:* capability grows in small steps. The counter is a sudden jump where capabilities generalise and alignment doesn't (Soares's "sharp left turn", 2022) [assumed: from memory].
- *Each step can be checked:* the current level (humans plus tools) can tell whether the next system is aligned. That is the scalable-oversight problem from Core Views.
- *Time between steps:* someone has to choose to wait. That is not a technical fact; it is your cock-ups point again.
So your scenario claim becomes "intermediate, provided we go slowly enough", and the remaining risk sits in whether we do. That is consistent with the rest of your answer. [concluded]

**2. Paragraphs 3 and 4 contradict each other.**
Paragraph 3 says the restricted achiever, with only the cheap drives, creates chaos but no existential risk. Paragraph 4's example of the dangerous agent is that same restricted achiever: an achiever "let loose on an impossible task, which might need an impossible amount of resources" needs nothing beyond resources, persistence and not being stopped. So either the example belongs in paragraph 3, and paragraph 3's "no existential risk" is wrong, or paragraph 4 has to say what the full-drives agent adds. I think the example is the better half. It shows that the cheap drives become unbounded once the task is unbounded, which is the "excessive persistence on difficult or impossible tasks" from OpenAI's Hugging Face report (worksheet), scaled up. If you keep it, the line between "chaos" and "extinction" is task scope and capability, not cheap versus full drives. It also fits the point from the shard answer above: the longer the task, the more a task-scoped goal looks like a global one. 
C: fair, I need a phrasing that says: these achievers might be "harmless" overall (unlikely)
They might also be very dangerous, see this argument
Answer (26-10-30, Claude Opus 5.5): A suggestion, change it as you like: "Heavy RLVR will likely produce achievers with the cheap drives (resources, persistence, not being stopped). In the lucky case they stay bounded by their tasks: they cause damage, and we learn from it. I find that unlikely. The cheap drives alone are enough for catastrophe once the agent is capable and the task is open-ended: an achiever set on an impossible task keeps acquiring resources without limit." I'd avoid "harmless", since your lucky case still includes the chaos; "manageable" says what you mean.

**3. The evidence is still one-sided.**
"The evidence has strengthened the AI drives arguments" is correct for the cheap drives in RL-heavy systems, which is where we ended up above. But your own fifth paragraph cites evidence in the other direction: steering and probing work so far. That changed over the past years too, and it is your reason for hope, so it belongs in this answer. A complete version: "the drive arguments got stronger, especially for RL-heavy agents; the case that we can see and steer what's inside also got stronger; the second is why I'm hopeful, the first is why I'm cautious". Naming one or two cases would help: Hugging Face, and reward hacking in reasoning models (models editing tests so they pass) [assumed: from memory].  
C: I think it's three things:
- hope (current techniques)
- cautious (AI drives are predictive)
- confused (we don't have a theory of alignment)

Answer (26-10-30, Claude Opus 5.5): Good structure, and the third item does real work: "confused" is why your risk range stays wide, so it links the first question to the third. One gap: the prompt asks how the evidence has *changed*. Hope and caution each have a direction (both grew). Confusion is a state, so give it a direction too. Has the lack of theory shrunk, stayed put, or fallen further behind capabilities over the past years? Any of those is fine; it just has to be stated.

Smaller points:
- "Non-negligible" is a lower bound only. "Cautiously hopeful" already implies an upper side, "less likely than not". Say it, and the risk answer is complete.
- The scenario claim is now about LLMs in general. Your earlier reply restricted it to the current architecture. Keep that condition or drop it on purpose.
- "We can learn from failures" (paragraph 3) is the strongest version of the intermediate case: failures that are not fatal act as warning shots. It deserves a sentence on what it needs: the failures have to come *before* the system that can't be stopped, and someone has to act on them. Hugging Face is a test of the second part.

---

C: (transcribed from chat) Can you proofread my answer in A1.typ (staged)

---

26-10-30, Claude Opus 5.5 — *proofread of the prompt 1 answer in A1.typ*; I have read the README, this topic's SUMMARY, the end of this LOG, and the staged diff of `A1.typ`

I fixed spelling and grammar in place in `work/A1_AI_Alignment_Introduction/A1.typ`, Session 4, prompt 1 only. The staged version is Julian's original, so `git diff` shows exactly what changed. [verified: compiles, 26-10-30] No content changes. Examples: "non-neglible", "trainign", "acchieers", "existenital", "omniscence"; "prevent from a broadly unaligned agent to pop up" → "prevent a broadly unaligned agent from popping up"; "Already the psychopathic achiever" → "Even the psychopathic achiever"; "the evidence ... have" → "has"; "capability x goals" → "capability × goals".

Wording choices that touch meaning slightly, for Julian to check:
- "goal driven intermediate goals" → "intermediate (instrumental) goals". I read it as instrumental subgoals, Omohundro's term.
- "Hopeful, means that I have seen evidence like steering / probing that seem to work" → "Hopeful, because I have seen techniques like steering and probing that seem to work", to parallel "Cautiously, because".
- The last sentence starts with "But", since it contrasts with the two before it.

One ambiguity left as is: in the first paragraph, "far away or close enough" doesn't say from what (from danger? from a point where course corrections stop working?).
