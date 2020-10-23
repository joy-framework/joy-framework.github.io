(declare-project
  :name "joy-framework.github.io"
  :description "The web framework website"
  :dependencies []
  :author "Sean Walker"
  :license "MIT"
  :url "https://joyframework.com"
  :repo "https://github.com/joy-framework/joy-framework.github.io")

(phony "build" []
  (os/shell "find . -name '*.janet' | entr -s 'speakeasy && gust -o css'"))

