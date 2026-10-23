#import "../template.typ": *
#show: writeup.with(day: "A.1", title: "AI Alignment Introduction")

// My notes and answers for course/worksheets/ai-alignment-intro.mdx.
// Headings follow the worksheet's sessions.
//
// Readings:            #source("Title", url: "https://...")[ notes ]
// Discussion prompts:  #discussion[ prompt text ][ answer ]
// Compile from the repo root: typst compile --root . work/A1_AI_Alignment_Introduction/A1.typ

== Session 1: Alignment targets

=== Readings

#source("Coherent extrapolated volition", url: "https://intelligence.org/files/CEV.pdf")[
  A is trying to do what an idealised distilled version of H wants.
]

#source("Intent alignment", url: "https://ai-alignment.com/clarifying-ai-alignment-cec47cd69dd6")[
  A is trying to do what H wants (direct).
]

#source("Claude's constitution overview", url: "https://www.anthropic.com/news/claude-new-constitution")[
  Skipped.
]

#source("Corrigibility", url: "https://www.lesswrong.com/w/corrigibility-1")[
  A wants H to be able to change it.
]

=== Discussion

#discussion[Which alignment targets imply which others? Where this is not the case, think through counter examples.][
  - Intent alignment can imply corrigibility as long as H wants it.
  - Coherent extrapolated volition $arrow.r.double.not$ corrigibility
  - Corrigibility doesn't imply any other
  - Intent alignment $arrow.l.r.double.not$ coherent extrapolated volition
]

#discussion[Which alignment targets seem sufficient for safety? E.g., a corrigible system might cause harm before we change its values. Can it cause catastrophic harm? What about the other notions?][
  My opinion is that the outcome can heavily depend on the details.

  I suppose intent alignment can cause catastrophic harm. The general setup is: H wants something and A helps even though this will harm H.

  A corrigible agent can also cause catastrophic harm, at least as stated in the resource. It's a bit muddy and they admit problems themselves. There's another notion of corrigibility as a single target, which says A wants to be as corrigible as possible (#link("https://arxiv.org/abs/2506.03056")[arXiv:2506.03056]). I think they have an example where a comet is going to hit H and the only way is to disable A, but A does not allow that because then it's not corrigible anymore.
]

#discussion[What other ideas for alignment targets do you have? Does your target have a benefit?][
  Maximising the possible, eventually achievable human goals. Basically empowering humans. This again can backfire in the details, of course, like delaying goals (not forever, of course) to maximise the number of goals a human can achieve at the moment.
]

== Session 2: Alignment problem decompositions

=== Readings

// Worksheet: read everything before the section "How mechanistic does [...]".
#source("Training stories", url: "https://www.alignmentforum.org/posts/FDJnZt8Ks2djouQTZ/how-do-we-become-confident-in-the-safety-of-a-machine")[
  A training story is an argument for why a given training setup produces an algorithm from a certain mechanistic class (and why an algorithm in this class is desirable).
]

#source("Reward misspecification", url: "https://deepmind.google/blog/specification-gaming-the-flip-side-of-ai-ingenuity/")[
  I think this is the outer alignment problem.

  Specification gaming: doing a task in an unintended way. The cause lies in the task specification. Learning from human feedback can also be gamed.

  Task specifications can be wrong due to:
  - missing constraints
  - poor generalisation of the objective
  - incorrect assumptions
]

#source("Goal misgeneralization", url: "https://deepmind.google/blog/how-undesired-goals-can-arise-with-correct-rewards/")[
  I think this is the inner alignment problem.

  Goal misgeneralization:
  - capabilities generalise
  - goal doesn't
]

#source("On soft inductive biases", url: "https://arxiv.org/abs/2503.02113")[
  A soft inductive bias is a soft preference for certain kinds of solutions.
]

// Listed under "On soft inductive biases" in the worksheet.
#source("Emergent misalignment", url: "https://arxiv.org/abs/2502.17424")[
  Finetuning LLMs to behave misaligned in a narrow domain can cause them to behave misaligned broadly.
]

=== Discussion

#discussion[Think of well-known or imagined misalignment scenarios: Can you think of some that clearly fall into the reward misspecification or goal misgeneralization category? Are some not clearly in either of them?][
  Reward misspecification: the paperclip maximiser.

  Goal misgeneralization: I don't know of any natural example, only ones from academic papers that set out to showcase it.

  Not sure: LLM sycophancy. I lean towards goal misgeneralization: the LLM learns a shortcut for getting good human feedback. But maybe the "human feedback function" also isn't giving the right signal.
]

#discussion[What problem with "outer" and "inner" misalignment is the terminology of "training stories" trying to solve? Construct examples where training stories seem more appropriate than inner/outer alignment as a framework.][
  In the example of training stories, it seems that they want to avoid the outer and inner misalignment problems by arguing that the learned algorithm falls within a certain class, which is then harmless.

  I don't know a concrete example. Maybe something along the lines of: we want a model to use an algorithm from a certain class, because we suspect that algorithms from this class generalise well (so this would be about capabilities).
]

#discussion[Think of concrete ways in which modern deep learning systems generalize beyond their explicit training examples. What inductive biases may underlie these examples? Is it always possible to come up with a "clean description" of those biases? Is the inductive bias you come up with enforced in the architecture, or more implicit? Perhaps: discuss this explicitly for the case of "emergent misalignment".][
  Small: LLMs can do in-context learning. Big: LLMs have found proofs of open mathematical conjectures.

  I have no idea though what inductive biases could be responsible for this.

  Let's discuss emergent misalignment as an example. Here we have the paper showing that finetuning on "bad code" generalises to other domains. Still, I don't know anything about inductive biases for LLMs. Maybe "Deep Learning is Not So Mysterious or Different" (the soft inductive biases paper) has something about this (I suspect compression). I do have my own theory of why LLMs generalise this way: maybe the LLMs are learning to take on a different role. Not the assistant role, but another, evil role.
]
