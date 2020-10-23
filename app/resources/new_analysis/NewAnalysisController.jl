module NewAnalysisController

using Stipple
using Genie, Genie.Renderer, Genie.Renderer.Html, Genie.Router, Genie.Sessions
using GenieAuthentication
using Users


# Base.@kwdef mutable struct Name <: ReactiveModel
#   name::R{String} = "Stipple!"
# end

# hs_model = Name()

# function __init__()
#   hs_model = Stipple.init(Name())
# end

# nav_setting = Dict(
#   :home_active => "",
#   :new_active => "active"
# )

# function ui()
#   page(
#     vm(hs_model), class="container", title="Hello Stipple", partial = true,
#     [
#       h1([
#         "Hello, "
#         span("", @text(:name))
#       ])

#       p([
#         "What is your name? "
#         input("", placeholder="Type your name", @bind(:name))
#       ])
#     ]
#   )
# end

# function new_analysis()

#   if authenticated()
#     update_login_to_nav_setting!(nav_setting, Genie.Router.@params)

#     html(ui(), layout=read("app/layouts/app.jl.html", String),
#         nav_setting=nav_setting)
#   else
#     redirect(:show_login)
#   end


# end

end
