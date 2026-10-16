// Shared setup for Julian's worksheet write-ups in work/<day>_<slug>/<slug>.typ.
// Deliberately minimal: extend it as real needs show up, not in advance.
//
// Usage at the top of a write-up:
//   #import "../template.typ": *
//   #show: writeup.with(day: "D.3", title: "AIXI")
//   #exercise("2.1")[ ...your answer... ]
// Compile from the repo root: typst compile --root . work/D3_aixi/aixi.typ
// (--root is required: typst refuses imports above the compiled file's folder.
// The PDF is gitignored.)

#let writeup(day: none, title: none, body) = {
  set document(title: if day != none { day + " " + title } else { title })
  set page(paper: "a4", margin: 2.2cm, numbering: "1")
  set text(size: 11pt)
  set par(justify: true)
  set math.equation(numbering: "(1)")
  heading(level: 1, numbering: none)[#if day != none [#day: ] #title]
  body
}

// One exercise answer; `id` is the worksheet's own exercise number, so a write-up
// can be matched against the worksheet line by line.
#let exercise(id, body) = block(above: 1.4em, below: 1em, width: 100%)[
  #text(weight: "bold")[Exercise #id.] #body
]

#let proof(body) = block(above: 0.6em)[
  _Proof._ #body #h(1fr) $square$
]

// Notation used across the worksheets (they define these as KaTeX macros).
#let Ex = $bb(E)$
#let Prob = $bb(P)$
#let argmax = math.op("arg max", limits: true)
#let argmin = math.op("arg min", limits: true)
#let TV = math.op("TV")
#let KL = math.op("KL")
