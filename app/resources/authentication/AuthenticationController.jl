module AuthenticationController

using Genie, Genie.Renderer, Genie.Renderer.Html, Genie.Router
using SearchLight
using GenieAuthentication
using Users
using Logging
using ViewHelper

# include("PCCAuthentication.jl")

nav_setting = Dict(
  :home_active => "",
  :new_active => ""
)

function show_login()
  html(:authentication, :login, context = @__MODULE__, nav_setting = nav_setting)
end

function login()
  Genie.WebChannels.unsubscribe_disconnected_clients()
  try
    hashed_password = Users.hash_password(Genie.Router.@params(:password))
    user = SearchLight.findone(User, username = Genie.Router.@params(:username), password = hashed_password)
    GenieAuthentication.authenticate(user.id, Genie.Sessions.session(Genie.Router.@params))

    @show Genie.Router.@params

    Genie.Renderer.redirect(:home)
  catch ex
    Genie.Flash.flash("Authentication failed")

    Genie.Renderer.redirect(:show_login)
  end
end

function logout()
  GenieAuthentication.deauthenticate(Genie.Sessions.session(Genie.Router.@params))

  Genie.Flash.flash("Good bye! ")

  Genie.Renderer.redirect(:show_login)
end

function show_register()
  Genie.Renderer.Html.html(:authentication, :register, context = @__MODULE__)
end

function register()
  try
    user = SearchLight.save!!(User( username  = Genie.Router.@params(:username),
                                    password  = Genie.Router.@params(:password) |> Users.hash_password,
                                    name      = Genie.Router.@params(:name),
                                    email     = Genie.Router.@params(:email)))

    GenieAuthentication.authenticate(user.id, Genie.Sessions.session(Genie.Router.@params))

    Genie.Renderer.redirect(:home)
  catch ex
    if hasfield(typeof(ex), :msg)
      Genie.Flash.flash(ex.msg)
    else
      rethrow(ex)
    end
    Genie.Renderer.redirect(:show_register)
  end
end

end
