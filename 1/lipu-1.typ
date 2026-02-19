#import "@preview/catppuccin:1.1.0": catppuccin, frappe
#import "@local/language_worksheet:0.0.1": (
  conjugation_table, notice, text_block, word_list, word_order_exercise, worksheet,
)

#set page(columns: 2, margin: 2cm)
#set quote(block: true)

#let theme = frappe
#show: catppuccin.with(theme)
#let tsv(path) = csv(path, delimiter: "	")

#set text(font: "NimbusSanL", size: 10.8pt)
#show raw.where(block: false): it => box(
  fill: theme.colors.surface2.rgb.transparentize(10%),
  outset: (top: .3em, bottom: .3em, left: .2em, right: .2em),
  radius: .2em,
  it,
)

#show quote: it => block(fill: theme.colors.surface1.rgb, inset: 1em, radius: 1em, it)

#let state = worksheet(theme: frappe)
#let tp(body) = {
  set text(font: "Fairfax Pona HD")
  body
}

#set page(header: [
  #set heading(bookmarked: false)
  #grid(columns: (1fr, 1fr, 1fr), align: (left, center, right))[= o kama sona!
  ][ #tp[= o kama sona!] ][ #tp[= lipu wan] ]
])
#text_block(state)[
  == Introduction
  In toki pona, words have a very wide meaning. They span wider concepts than they do in other languages, because there are fewer words to work with. Most words can be both used as verbs, nouns or adjectives! The only way to tell whether `telo` means `water`, `liquid` or `to liquify` is its position in a sentence.

  Toki pona sentences are made up of distinct parts. These parts are seperated with special words, called particles.

  Adjectives go after the nouns they modify. For example, `bird water small` might be a duck.
]

#text_block(state)[
  == Li
  The first particle we'll learn is `li`. It separates the subject from the action. A simple sentence is structured like
  #align(center, box(inset: 1em, radius: 1em, fill: theme.colors.surface1.rgb)[
    subject `li` action
  ])

  In Sitelen Pona (the writing system we'll be learning), `li` looks like an arrow:

  #align(center, quote[
    #set text(size: 15pt)
    subject
    #tp[li]
    #h(.2em)
    action
  ])

  #notice(state)[
    While `li` is often in the same place as English `is` would be in a sentence, it does not mean the same thing.
  ]
]

#word_list(tsv("words.tsv"), state)
#word_order_exercise(tsv("./sentences.tsv"), state)
#conjugation_table(("Test", "Test2"), state, "Testing")
