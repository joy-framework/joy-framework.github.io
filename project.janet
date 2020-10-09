(declare-project
  :name "joyframework.com"
  :description "The joy web framework website"
  :dependencies []
  :author "Sean Walker"
  :license "MIT"
  :url "https://github.com/joy-framework/joy-framework.github.io"
  :repo "https://github.com/joy-framework/joy-framework.github.io")

(phony "watch" []
  (os/shell "find . -name '*.janet' | entr -r speakeasy"))

(phony "tailwind" []
  (os/shell "find . -name 'html.janet' | entr -r janet tailwind.janet"))

