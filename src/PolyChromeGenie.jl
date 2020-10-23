module PolyChromeGenie

using Logging, LoggingExtras

function main()
  isdefined(Main, :UserApp) || Base.eval(Main, :(const UserApp = PolyChromeGenie))

  include(joinpath("..", "genie.jl"))

  isdefined(Main, :Genie) || Base.eval(Main, :(const Genie = PolyChromeGenie.Genie))
  Base.eval(Main, :(using Genie))
end; main()

end
