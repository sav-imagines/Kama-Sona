#import "@preview/catppuccin:1.1.0": catppuccin, frappe
#import "@local/language_worksheet:0.0.1": notice, text_block, word_list, word_order_exercise, worksheet

#set page(columns: 2, margin: 2cm)
#set quote(block: true)

#let theme = frappe
#show: catppuccin.with(theme)
#let tsv(path) = csv(path, delimiter: "	")

#set text(font: ("NimbusSanL", "Nimbus Sans"))

#show quote: it => block(fill: theme.colors.surface1.rgb, inset: 1em, radius: 1em, it)
#let state = worksheet(theme: frappe)

#text_block(state)[
  == Introduction
  In toki pona, words have a very wide meaning. They span wider concepts than they do in other languages, because there are fewer words to work with. Most words can be both used as verbs, nouns or adjectives! The only way to tell whether `telo` means `water`, `liquid` or `to liquify` is its position in a sentence.

  Toki pona sentences are made up of distinct parts. These parts are seperated with special words, called particles.
]

#text_block(state)[
  == Li
  The first particle we'll learn is `li`. It separates the subject from the action. A simple sentence is structured like
  #align(center, box(inset: 1em, radius: 1em, fill: theme.colors.surface1.rgb)[
    *subject* `li` *action* *test*
  ])

  In Sitelen Pona (the writing system we'll be learning), `li` looks like an arrow:

  #align(center, quote[
    #show: it => align(horizon + center, it)
    #set text(size: 15pt)
    subject
    #text(font: "Fairfax Pona HD")[
      li
    ]
    action
  ])

  #notice(state)[
    While `li` is often in the same place as English `is` would be in a sentence, it does not mean the same thing.
  ]
]

#word_list(tsv("words.tsv"), state)
#word_order_exercise(tsv("./sentences.tsv"), state)
