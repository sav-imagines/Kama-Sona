#import "@preview/catppuccin:1.1.0": catppuccin, frappe, latte
#import "@local/language_worksheet:0.0.1": (
  conjugation_table, notice, text_block, word_order_exercise, word_symbol_list, worksheet,
)

#set page(columns: 2, margin: 1.2cm)
#set quote(block: true)

#let theme = frappe
#show: catppuccin.with(theme)
#let tsv(path) = csv(path, delimiter: "	")

#set text(font: "Atkinson Hyperlegible")
#show text.where(lang: "tok"): set text(font: "Fairfax Pona HD", size: 10.8pt)
#show raw.where(block: false): it => box(pad(left: 1pt, right: 1pt, box(
  fill: theme.colors.surface2.rgb.transparentize(10%),
  outset: (top: .3em, bottom: .3em, left: .2em, right: .2em),
  radius: .2em,
  it,
)))

#show quote: it => block(fill: theme.colors.surface1.rgb, inset: 1em, radius: 1em, it)

#let state = worksheet(theme: theme)

#let top = [
  #show text: strong
  #set text(size: 20pt)
  #grid(columns: (1fr, 1fr, 1fr), align: (left, center, right))[
    o kama sona!
  ][
    #text(font: "Fairfax Pona HD")[ o kama sona! ]
  ][
    #text(font: "Fairfax Pona HD")[ lipu tu ]
  ]
]

#set page(header: top)

#let tp(body) = {
  set text(lang: "tok")
  body
}

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
    subject #tp[li] #h(.2em) action
  ])

  #notice(
    state,
  )[`Li` compared to `is`][ While `li` is often in the same place as `is` would be in an English sentence, it does not mean the same thing.]
]

#let sentences = tsv("words.tsv").map(x => (x.at(0), tp(x.at(0)), x.at(1)))
#word_symbol_list(sentences, state)
#word_order_exercise(tsv("sentences.tsv"), state)
