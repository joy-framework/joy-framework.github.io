(import joy :prefix "")

(route :get "/" :home)

(defn home [request]
  (text/plain "You found joy!"))

(def app (app))

(server app 9001)