using Genie, Genie.Router, Genie.Assets
using Stipple

import HomeController
import NewAnalysisController

import StippleController
# import HelloStippleController

Genie.config.websockets_server = true
Stipple.set_multi_user_mode(true)


route("/") do
  serve_static_file("welcome.html")
end

route("/home", HomeController.home, named = :home)

# route("/new_analysis", NewAnalysisController.new_analysis, named = :new_analysis)

route("/stipple_buttons", StippleController.stipple_buttons)
route("/hello_stipple", StippleController.hello_stipple)









### route stipple files needed by pages without `using Stipple`
const STIPPLE_DIR = dirname(dirname(pathof(Stipple)))

Genie.Router.route("/css/stipple/stipplecore.min.css") do
  Genie.Renderer.WebRenderable(
    read(joinpath(STIPPLE_DIR, "files", "css", "stipplecore.min.css"), String),
    :css) |> Genie.Renderer.respond
end
# Genie.Router.route("/js/stipple/vue.js") do
#   Genie.Renderer.WebRenderable(
#     read(joinpath(STIPPLE_DIR, "files", "js", "vue.js"), String),
#     :javascript) |> Genie.Renderer.respond
# end
# Genie.Router.route("/js/stipple/vue_filters.js") do
#   Genie.Renderer.WebRenderable(
#     read(joinpath(STIPPLE_DIR, "files", "js", "vue_filters.js"), String),
#     :javascript) |> Genie.Renderer.respond
# end
# Genie.Router.route("/js/stipple/stipplecore.js") do
#   Genie.Renderer.WebRenderable(
#     read(joinpath(STIPPLE_DIR, "files", "js", "stipplecore.js"), String),
#     :javascript) |> Genie.Renderer.respond
# end
# Genie.Router.route("/js/stipple/underscore-min.js") do
#   Genie.Renderer.WebRenderable(
#     read(joinpath(STIPPLE_DIR, "files", "js", "underscore-min.js"), String),
#     :javascript) |> Genie.Renderer.respond
# end
