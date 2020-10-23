  cd(@__DIR__)
  import Pkg
  Pkg.activate(".")

  function main()
    include(joinpath("src", "PolyChromeGenie.jl"))
  end; main()
