### Some Genie full-stack features not compatible with StippleUI

I copy most of the code from Stipple Buttons Demo to a full-stack Genie app, and it is used to test the functionality of StippleUI and Genie features. I found some minor issues are to be solved.

The web site of the demo is http://127.0.0.1:9800/stipple_buttons

The controller and views are in `app/resources/stipple_demos/StippleController.jl`.

The routers are in `./routers.jl`.

List of issues and feature requests:

- `StippleUI.dashboard` is not compatible with the layout keyword in `html()`: 

  ```julia
  # app/resources/stipple_demos/StippleController.jl:69
  html(ui_stipple_buttons(sb_model), layout=read("app/layouts/app.jl.html", String), nav_setting=nav_setting)
  ```

  The layout contains Julia code wrapped in `<% %>`, but not parsed.

- In the demo, **Value** changes when I click "less" or "more" buttons, but **Clicks** remains to be 0. I am not sure why it happens.

- It seems Stipple have a multi user mode and can set `Stipple.set_multi_user_mode(true)`. However, when I open the web page in different web browsers at the same time, the values are synchronized. Is there a way to initiate different instances for different sessions?

