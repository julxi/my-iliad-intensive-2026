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

#let accent = rgb("#1f4e79")

#let writeup(day: none, title: none, body) = {
  set document(title: if day != none { day + " " + title } else { title })
  set page(paper: "a4", margin: 2.2cm, numbering: "1")
  set text(size: 11pt)
  set par(justify: true)
  set math.equation(numbering: "(1)")
  set list(indent: 0.4em)
  show link: set text(fill: accent)
  // == is a worksheet section (e.g. "Session 1"), === a part of it ("Readings").
  show heading.where(level: 2): it => block(above: 2em, below: 1em, width: 100%)[
    #set text(fill: accent)
    #it.body
    #v(-0.6em)
    #line(length: 100%, stroke: 0.6pt + accent)
  ]
  show heading.where(level: 3): it => block(above: 1.6em, below: 0.8em)[
    #set text(size: 0.85em, fill: luma(90), tracking: 0.06em)
    #upper(it.body)
  ]
  show heading.where(level: 1): set align(center)
  show heading.where(level: 1): set text(size: 1.4em)
  show heading.where(level: 1): set block(below: 1.5em)
  heading(level: 1, numbering: none)[#if day != none [#day: ] #title]
  body
}

// One exercise answer; `id` is the worksheet's own exercise number, so a write-up
// can be matched against the worksheet line by line.
#let exercise(id, body) = block(above: 1.4em, below: 1em, width: 100%)[
  #text(weight: "bold")[Exercise #id.] #body
]

// One source from a reading list, followed by notes on it. `star: true` marks the
// worksheet's ★ items (the ones it flags as particularly important).
#let source(title, author: none, url: none, star: false, body) = block(above: 1.4em, below: 1em, width: 100%)[
  #block(below: 0.6em, sticky: true)[
    #text(weight: "bold")[#if star [★ ]#if url != none { link(url, title) } else { title }]#if author != none [ #text(fill: luma(90))[(#author)]]
  ]
  #pad(left: 0.8em, body)
]

// One discussion prompt from a worksheet session (unnumbered, unlike exercises),
// followed by the answer.
#let discussion(question, body) = block(above: 1.6em, below: 1em, width: 100%)[
  #block(
    width: 100%, below: 0.9em, sticky: true, inset: (x: 0.8em, y: 0.6em), radius: 2pt,
    fill: accent.lighten(92%), stroke: (left: 2pt + accent),
  )[_#question _]
  #pad(left: 0.8em, body)
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
