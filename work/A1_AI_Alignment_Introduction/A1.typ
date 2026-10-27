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

== Session 3: Goal-directedness

=== Readings

#source("Will humans build goal-directed agents?", url: "https://www.alignmentforum.org/posts/9zpT9dikrrebdq3Jf/will-humans-build-goal-directed-agents")[Try to find ways for beneficial AI systems that are not goal directed. I must say thet article is pretty vague and besides this idea I couldn't get more out of it.
]

// Worksheet: most important are the abstract, intro, conclusion, and understanding
// every heading and a basic argument for its underlying AI drive.
#source("Basic AI drives", url: "https://selfawaresystems.com/wp-content/uploads/2008/01/ai_drives_final.pdf")[
Omohundro drives:
  - self-improvement
  - have utility functions
  - preserve utility function
  - resist wire-heading (is that goodharting?)
  - self-preservation
  - aquire resources

I agree mostly with these arguments. However, I'm not sure what the realy prerequisites are for them to follow. I also read something about being rational, which I can see in current LLMs as being relentless. Being relentless is something that I associate with rl agents / llm agents naturally. I won't mention it again because I don't really understand it.
]

=== Discussion

#discussion[Clearly we can imagine _different types_ of agents, e.g. some that coherently optimize a utility function, and others that are based on contextually activated computations, etc. What type do we see in today's LLM agents? How will this development continue in the future?][
I don't know what kind of agent today's LLM agents are. Most likely they are not optimizing a utility function. There are experiments about personas that point to contextually activated computations.

I don't know where this is going. I don't think that if they have contextually activated computations they will spontaneously develope a utility function, but actually I don't have a good argument againts it.
]

#discussion[Can you think of other convergent instrumental goals than the ones mentioned in basic AI drives?][
So basic AI drives mentioned: preserve utility function, self-improvement, self-preservation, and resources. I don't know if the others are instrumental goals. The part about resisting goodharting is something I don't know if it's too specific, in the sense that this is more about intelligent action taking.

One thing that comes to mind (though I haven't thought it) is maybe urgency: if AI systems know that other AI systems are being trained with the other urges they might feel pressured to act before the newer, potentially more capable systems start acting. Is that a drive of it self or just behaviour related to aquiring resources in an effective way? On the other hand, the basic drives are also just behaviours derived from goal seeking.

Another one could be the desire for cooperation. I'm not sure if there's an argument why agents would drive towards this. It just happened in the hugging face hack.
]

#discussion[What is the relationship between corrigibility and convergent instrumental subgoals?][
At least presever utility functino seems to be in contradiction with corrigibility. However, when corrigibility is part of the utility function this seems superficially be less of a problem.

Omohundro says:
> While it is true that most rational systems will act to preserve their utility functions,
there are at least three situations in which they will try to change them. These arise when
the physical embodiment of the utility function itself becomes an important part of the
assessment of preference. 

This seems to be relevant for corrigibility: corrigibility means something along the line of "having your utility function be more aligned" (that is changed)

A corrigible agent should be biased to most of the omohundro drives even just in the name of being better corrigible, except preserving utiliy function as said above.
]

#discussion[Which instrumental-convergence claims depend on idealized optimization, and which would you expect from a language-model agent with tools, memory and a limited budget? What observation would make you change your answer?][
As I said, I don't have a good model of how LLMs tick. I wouldn't be surprised to see all of the drives (exccept for having single utility function).
We've seen:
- aquiring resources (hacking hugging face for info)
- being relentless (I said I wasn't going to mention rationality again, but I actually think it was very relevant here)
- self-preservation (tests where LLMs blackmail to keep set goal) (is this stated in AI drives?)
- I think in Hugging face we could also see resist wire-heading, but I'm quite unsure about this.

The only one left is self-improvement but it wouldn't surprise me at all.
]

== Session 4: Uncertain risks and outlook

=== Readings

// Worksheet: most important sections are "Our Approach: Empiricism in AI Safety",
// "The role of frontier models in AI safety" and "Taking a portfolio approach to AI safety".
#source("Core views on AI safety", url: "https://www.anthropic.com/news/core-views-on-ai-safety")[
]

// Worksheet: most important is everything before "Examples of Model Organisms [...]".
#source("Model organisms of misalignment", url: "https://www.lesswrong.com/posts/ChDH335ckdvpxXaXX/model-organisms-of-misalignment-the-case-for-a-new-pillar-of-1")[
]

#source("The rocket alignment problem", url: "https://www.alignmentforum.org/posts/Gg9a4y8reWKtLe3Tn/the-rocket-alignment-problem")[
]

=== Discussion

#discussion[How large is the risk? Do we live in an optimistic, intermediate, or pessimistic scenario? How has the evidence changed in the past years?][
]

#discussion[Can you think of model organisms for misalignment that were published after the post came out in 2023? Does this change our understanding of the risks?][
]

#discussion[Does the analogy between the AI alignment and rocket alignment problems feel accurate? In what ways does it or does it not?][
]

#discussion[What safety approaches (e.g., on a spectrum from theoretical to empirical) feel most appealing to you, and why? Does this depend on details of the problem you are trying to solve?][
]
