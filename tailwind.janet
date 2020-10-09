(import ./html)

(def classes (->> (all-bindings (curenv) true)
                  (filter |(string/has-prefix? "html/" $))
                  (map eval)
                  (filter keyword?)
                  (mapcat |(->> (string/split "." $) (drop 1)))
                  (distinct)
                  (sort)
                  (reverse)
                  (map |(string/replace-all `/` `\/` $))
                  (map |(string/replace-all `:` `\:` $))))


(defn css-class-peg [classes]
  (peg/compile ~{:main (% (any (+ (<- :class) 1)))
                 :class (* "." (+ ,;classes) (+ "{" ">") (thru "}"))}))

(let [tw (slurp "tailwind.min.css")
      normalize-css (string/slice tw 0 (inc (string/find "}.container" tw)))]
  (as-> (css-class-peg classes) ?
        (peg/match ? tw)
        (first ?)
        (string normalize-css ?)
        (spit "css/tailwind.min.css" ?)))
