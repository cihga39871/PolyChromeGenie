module StippleController

using Stipple
using StippleUI

using Genie, Genie.Renderer, Genie.Renderer.Html, Genie.Router, Genie.Sessions
using GenieAuthentication
using Users

Stipple.set_multi_user_mode(true)

nav_setting = Dict(
  :home_active => "",
  :new_active => ""
)

Base.@kwdef mutable struct SBModel <: ReactiveModel
  name::R{String} = "Stipple!"

  clicks::R{Int} = 0
  value::R{Int} = 0
end

sb_model = SBModel()

function __init__()
  sb_model = Stipple.init(SBModel(), debounce = 0)
end

on(sb_model.value) do (_...)
  sb_model.clicks[] += 1
end

function ui_stipple_buttons(sb_model)
  [
  dashboard(
    vm(sb_model), class="container", title="Buttons demo", partial = true,
    [
      heading("Buttons")

      row([
        cell([
          btn("Less! ", @click("value -= 1"))
        ])
        cell([
          p([
              "Clicks: "
              span(sb_model.clicks, @text(:clicks))
          ])
          p([
            "Value: "
            span(sb_model.value, @text(:value))
          ])
        ])
        cell([
          btn("More! ", @click("value += 1"))
        ])
      ])
    ]
  )
  ]
end

function stipple_buttons()

  if true # authenticated()
    update_login_to_nav_setting!(nav_setting, Genie.Router.@params)

    # html(ui_stipple_buttons(sb_model), layout=read("app/layouts/app.jl.html", String), nav_setting=nav_setting)
    html(ui_stipple_buttons(sb_model))


  else
    redirect(:show_login)
  end
end

function ui_hello_stipple()
  page(
    vm(sb_model), class="container", title="Hello Stipple", partial = true,
    [
      h1([
        "Hello, "
        span("", @text(:name))
      ])

      p([
        "What is your name? "
        input("", placeholder="Type your name", @bind(:name))
      ])
    ]
  )
end
function hello_stipple()

  if true # authenticated()
    update_login_to_nav_setting!(nav_setting, Genie.Router.@params)

    html(ui_hello_stipple(), layout=read("app/layouts/app.jl.html", String),
        nav_setting=nav_setting)
  else
    redirect(:show_login)
  end
end


end
