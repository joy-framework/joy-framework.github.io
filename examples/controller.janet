(use joy)


(route :get "/todos/new" :new)
(route :post "/todos" :create)


(def todo
  (body :todos
    (validates :name :required true)
    (permit :name :finished)))


(defn new [request &opt errors]
  (default errors {})

  (let [todo (todo request)]

    (form-for [request :create]
      (text-field todo :name)
      [:div (errors :name)]

      (label-for :finished
        # generates hidden input for false/zero values
        (checkbox-field todo :finished)
        [:span " Finished"])
      [:div (errors :finished)]

      (submit "Save"))))


(defn create [request]
  (let [todo (-> request todo db/save)]

    (if (saved? todo)
      (redirect-to :home)
      (new request (errors todo)))))
