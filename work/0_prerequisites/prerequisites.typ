#import "../template.typ": *
#show: writeup.with(day: "0", title: "Prerequisites")

// The sources from course/worksheets/prerequisites.mdx, with my thoughts on each.
// Headings follow the worksheet's sections (== for its ##, === for its ###).
//
// One entry:
//   #source("Title", author: "Name", url: "https://...", star: true)[ thoughts ]
// author, url and star are optional; star: true prints the worksheet's ★.
// Compile from the repo root: typst compile --root . work/0_prerequisites/prerequisites.typ

== Background worldview and assumptions

=== Why AI matters

#source(
  "Cognitive Superpowers",
  author: "Nick Bostrom",
  url: "https://publicism.info/philosophy/superintelligence/7.html",
)[
  - discusses capability differences between seed AI (I assume first AI that can create and improve other AIs) and humans
  - argues that AI that can "exerting optimization power to amplify a system’s intelligence: a skill which is presumably closely related to doing well in mathematics, programming, engineering, computer science research, and other such “nerdy” pursuits" can reach all other important skills 
  - says we don't know how to measure cognitive capacities and even if we don't know what a measurment entails
  - lists "srategically relevant tasks":
    - intelligence amplification: this is what AI labs are training for right now and from my current perspective the most convincing dangerous superpower.
    - stategizing: Are labs training agents to "overcome intelligent opposition"? I'm on the fence weather current agents can get to "Achieving distant goals". Training data for that is very hard to come by, but maybe this is also an emergent skill
    - social manipulation: this sounds a bit like sci-fi to me.
    - hacking: we already have superhuman AI hackers already. I don't have the feeling though that they in their current form are a threat to humanity
    - techonlogy research
    - economic productivity
  - basically just a plausible: SI can take over the world scenario
  - overall it's hard for me to map these predictions to current real-life AI
]

#source(
  "Machines of Loving Grace",
  author: "Dario Amodei",
  url: "https://www.darioamodei.com/essay/machines-of-loving-grace",
)[
  - a quite detailed/concrete list of stuff that an aligned AI could make better
  - seems reasonable but the sheer volume of stuff looks suspicious (they think they know it all?)
  - I don't know what I should think about this quote of the author "Many human societal structures are inefficient or even actively harmful, but are hard to change while respecting constraints like legal requirements on clinical trials, people’s willingness to change their habits, or the behavior of governments.". This has a bit of an elitist feel to me.
]

#source(
  "Task-Completion Time Horizons of Frontier AI Models",
  author: "METR",
  url: "https://metr.org/time-horizons/",
)[
 
]
