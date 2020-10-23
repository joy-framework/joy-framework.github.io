(defn class [el & args]
  (keyword el ;(map |(string "." $) args)))

(def container :div.container.p-4.mx-auto)

(def h1 :h1.text-5xl.text-gray-800)
(def h2 :h2.text-3xl.tracking-tight.text-gray-800)
(def h3 :h3.text-2xl.text-gray-800)
(def h4 :h4.text-l.text-gray-800)

(def list :div.divide-y-2.divide-gray-200)
(def hstack :div.self-stretch.flex-row.lg:flex.sm:block.md:block)
(def hstack:md (class hstack :lg:space-x-4))
(def vstack :div.flex.flex-col.self-stretch.flex-auto)
(def vstack:sm (class vstack :space-y-2))
(def vstack:md (class vstack :space-y-4))
(def vstack:lg (class vstack :space-y-16))
(def spacer :div.flex-1)
(def col:1/2 :div.lg:grid.lg:grid-flow-col.lg:grid-cols-2.gap-10)

(def cta :a.inline-block.my-6.px-5.py-3.rounded-lg.bg-indigo-500.text-white.shadow-lg.hover:bg-indigo-700)

(def mt-4 :div.mt-4)
(def mt-10 :div.lg:mt-10)
(def mt-16 :div.lg:mt-16)
(def space-y-4 :div.space-y-4)

(def pre :pre)
(def code :code.rounded-lg.p-6)

(def install-container :div.bg-gray-100.py-4.mt-6)
(def install-instruction :div.mt-2.inline-block.rounded-lg.border.border-gray-500.p-2)

(def text:light :div.text-gray-600)
(def text :div.text-gray-800)

(def link :a.text-indigo-500.underline)

(def logo :img.w-32)
