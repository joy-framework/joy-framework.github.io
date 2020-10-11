(declare-project
  :name "joy-framework.github.io"
  :description "The web framework website"
  :dependencies []
  :author "Sean Walker"
  :license "MIT"
  :url "https://joyframework.com"
  :repo "https://github.com/joy-framework/joy-framework.github.io")

(phony "watch" []
  (os/shell "find . -name '*.janet' | entr -r speakeasy"))

(phony "tailwind" []
  (os/shell "find . -name 'src/html.janet' | entr -r gust -o css"))

