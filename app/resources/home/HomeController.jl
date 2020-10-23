
module HomeController

using Genie, Genie.Renderer, Genie.Renderer.Html, Genie.Router, Genie.Sessions
using SearchLight
using GenieAuthentication
using Users
using Logging

nav_setting = Dict(
  :home_active => "active",
  :new_active => ""
)



function home()

  if authenticated()
    update_login_to_nav_setting!(nav_setting, Genie.Router.@params)

    html(:home, :home, context = @__MODULE__, nav_setting = nav_setting)
  else
    redirect(:show_login)
  end
end

end
