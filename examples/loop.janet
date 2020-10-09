(let [groceries [{:name "eggs"}
                 {:name "milk"}
                 {:name "tomatoes"}]]
  [:ul
    (foreach [g groceries]
      [:li (g :name)])])
