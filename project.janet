(declare-project
  :name "joy-framework.github.io"
  :description "The web framework website"
  :dependencies []
  :author "Sean Walker"
  :license "MIT"
  :url "https://joyframework.com"
  :repo "https://github.com/joy-framework/joy-framework.github.io")

(phony "rebuild" []
  (os/shell "find . -name '*.janet' | entr -r speakeasy"))

(phony "gust" []
  (os/shell "find . -name '*.html' | entr -r gust -o css"))

