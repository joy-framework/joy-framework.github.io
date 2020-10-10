(import ./html)

(def sm? (partial string/has-prefix? `.sm\:`))
(def md? (partial string/has-prefix? `.md\:`))
(def lg? (partial string/has-prefix? `.lg\:`))
(def xl? (partial string/has-prefix? `.xl\:`))


(defn media-queries [class-strings]
  (let [sm (filter sm? class-strings)
        md (filter md? class-strings)
        lg (filter lg? class-strings)
        xl (filter xl? class-strings)
        other (filter |(and (not (sm? $))
                            (not (md? $))
                            (not (lg? $))
                            (not (xl? $)))
                      class-strings)
        mq [(string "@media (min-width: 640px) {" (string/join sm "") "}")
            (string "@media (min-width: 768px) {" (string/join md "") "}")
            (string "@media (min-width: 1024px) {" (string/join lg "") "}")
            (string "@media (min-width: 1280px) {" (string/join xl "") "}")]]
     (string/join (array/concat other mq))))


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
  (peg/compile ~{:main (any (+ (<- :class) 1))
                 :class (* "." (+ ,;classes) (+ "{" ">") (thru "}"))}))

(let [tw (slurp "tailwind.min.css")
      normalize-css (string/slice tw 0 (inc (string/find "}.container" tw)))]
  (as-> (css-class-peg classes) ?
        (peg/match ? tw)
        (media-queries ?)
        (string normalize-css ?)
        (spit "css/tailwind.min.css" ?)))
