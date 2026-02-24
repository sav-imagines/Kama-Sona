#import "@preview/catppuccin:1.1.0": catppuccin, frappe, latte
#import "@local/language_worksheet:0.0.1": (
  conjugation_table, notice, questions, text_block, word_list, word_order_exercise, word_symbol_list, worksheet,
)

#set page(columns: 2, margin: 1.2cm)
#set quote(block: true)

#let theme = frappe
#show: catppuccin.with(theme)
#let tsv(path) = csv(path, delimiter: "	")

#show heading.where(level: 1): set text(size: 20pt)
#show text.where(lang: "en"): set text(font: "Atkinson Hyperlegible")
#show text.where(lang: "tok"): set text(font: "Fairfax Pona HD", size: 10.8pt)
// #set text(lang: "tok")

#show raw.where(block: false): it => box(pad(left: 2pt, right: 2pt, box(
  fill: theme.colors.surface2.rgb.transparentize(10%),
  outset: (top: .3em, bottom: .3em, left: .2em, right: .2em),
  radius: .2em,
  it,
)))

#show quote: it => block(fill: theme.colors.surface1.rgb, inset: 1em, radius: 1em, it)

#let state = worksheet(theme: theme)
#let tp(body) = {
  set text(lang: "tok")
  body
}
#let en(body) = {
  set text(lang: "en")
  body
}

#set page(header: [
  #set heading(bookmarked: false)
  #grid(columns: (1fr, 1fr, 1fr), align: (left, center, right))[= o kama sona!
  ][ #tp[= o kama sona!] ][ #tp[= lipu tu] ]
])

#notice(state)[ Simpler #tp[li] (`li`)][When `mi` or `sina` is the full subject, it is unnecessary to use `li`.]

#text_block(state)[
  == Objects with #tp[e] (`e`)
  Now that we know how to construct a simple sentence:

  #quote[
    #set text(size: 15pt)
    [Subject] #tp[li] [Action]
  ]

  We can learn how to talk about objects.

  Objects are the thing that is impacted in a sentence, like "apple" in "I eat an apple."

  The particle that goes between the action and the object is `e`.
  That looks like this:

  #quote[
    #set text(size: 12pt)
    [Subject] #tp[li] [Action] #tp[e] [Object]
  ]
]

#word_symbol_list(tsv("old-words.tsv").map(x => (en(x.at(0)), tp[#x.at(0)], en(x.at(1)))), state)
#colbreak()
#word_symbol_list(tsv("words.tsv").map(x => (en(x.at(0)), tp[#x.at(0)], en(x.at(1)))), state)
#let sentences = tsv("sentences.tsv").map(x => (tp(x.at(0)), [#x.at(0)]))
#questions(state, [Translation exercise], sentences)
