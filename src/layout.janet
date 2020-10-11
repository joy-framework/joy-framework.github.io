(defn layout [& args]
  (let [[options body] (if (-> args first dictionary?)
                         [(first args) (drop 1 args)]
                         [@{} args])]
    [(doctype :html5)
     [:html {:lang "en" :dir "ltr"}
      [:head
       [:meta {:charset "utf-8"}]
       [:meta {:name "viewport" :content "width=device-width, initial-scale=1"}]
       [:title (get options :title "Joy Framework")]
       [:link {:href "css/atom-one-light.css" :rel "stylesheet"}]
       [:link {:href "css/tailwind.min.css" :rel "stylesheet"}]
       [:link {:href "css/app.css" :rel "stylesheet"}]
       [:link {:href "favicon.ico" :rel "shortcut icon" :type "image/x-icon"}]]
      [:body body
       [:script {:data-goatcounter "https://joyframework.goatcounter.com/count"
                 :async ""
                 :src "//gc.zgo.at/count.js"}]
       [:script {:src "js/highlight.pack.js"}]
       [:script "hljs.initHighlightingOnLoad();"]]]]))
