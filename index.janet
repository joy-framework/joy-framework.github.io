(smuggle ./layout)
(smuggle ./html)

(defn example [name]
  (-> (string "./examples/" name) slurp string))

(layout
  [mt-10
   [container
    [hstack:md
     [spacer
      [vstack:sm
       [h1 "Joy"]
       [h2 "A maximalist web framework for lisp aficionados"]
       [h4
        "Use the "
        [link {:href "https://janet-lang.org"} "janet"]
        " programming language to build web apps faster with less code and very low memory usage."]

       [mt-4
        [cta {:href "https://github.com/joy-framework/joy/blob/master/docs/introduction.md"}
         "Read the docs"]]]]

     [spacer
      [:pre
       [code {:class "clojure"}
        (example :app.janet)]]]]]]

  [install-container
   [container
    [h3 "Installation on macOS"]
    [mt-4
     [vstack:md
      [:div
       [text:light "Janet can be installed with homebrew:"]
       [install-instruction "brew install janet"]]
      [:div
        [text:light "Then to install joy:"]
        [install-instruction "jpm install joy"]]
      [text:light "More installation options for janet "
       [link {:href "https://janet-lang.org/docs/index.html"} "here"]]]]]]

  [mt-16
   [container
    [vstack:lg
     [col:1/2
      [vstack:md
       [h3 "HTML is data"]
       [text
        "Joy uses "
        [link {:href "https://github.com/weavejester/hiccup"}
         "hiccup"]
        " to render html. There is no separate template language to learn! You have all of janet's power when writing html!"]]
      [vstack:md
       [pre
        [code {:class "clojure"}
         (example :form.janet)]]

       [pre
        [code {:class "html"}
         (example :form.html)]]]]

     [col:1/2
      [text "Use html inside of janet, not the other way around"]
      [vstack:md
       [pre
        [code {:class "clojure"}
          (example :loop.janet)]]
       [pre
        [code {:class "html"}
          (example :loop.html)]]]]

     [col:1/2
      [text "There is a shorthand for css classes too! Great for atomic css!"]
      [vstack:md
       [pre
        [code {:class "clojure"}
          (example :css.janet)]]
       [pre
        [code {:class "html"}
          (example :css.html)]]]]

     [col:1/2
      [text "The real beauty of having a regular old data structure represent your html is that you can assign it to a variable and create your own names without changing the rendered html!"]
      [vstack:md
       [pre
        [code {:class "clojure"}
          (example :css1.janet)]]
       [pre
        [code {:class "html"}
          (example :css.html)]]]]]]]

  [mt-16
   [container
    [vstack:lg
     [col:1/2
      [spacer
       [vstack:md
        [h3 "Everything is a function"]
        [text "Joy doesn't uses objects or classes. Everything is a function that takes a request and outputs a response"]]]
      [spacer
       [vstack:md
        [pre
         [code {:class "clojure"}
          (example :controller.janet)]]]]]]]])
