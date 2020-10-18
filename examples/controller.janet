(use joy)


(route :get "/posts" :index)
(route :get "/posts/new" :new)
(route :post "/posts" :create)


(def body
  (body :posts
    (validates [:title :body] :required true)
    (permit :title :body)))


(defn index [request]
  (let [posts (db/from :posts)]

    [:ul
     (foreach [p posts]
      [:li
       [:h1 (p :title)]
       [:p (p :body)]])]))


(defn new [request &opt errors]
  (let [post (body request)]

    [:form {:method :post :action "/posts"}
      [:input {:type "text" :name "name" :value (post :name)}]
      [:div
       (errors :name)]

      [:textarea {:name "body"}
        (post :body)]
      [:div
       (errors :body)]

      [:input {:type "submit" :value "Save"}]]))


(defn create [request]
  (let [post (-> (body request)
                 (db/save))]

    (if (saved? post)
      (redirect-to :home)
      (new request (errors post)))))
