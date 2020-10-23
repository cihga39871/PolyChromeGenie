### Errors found in http://127.0.0.1:9800/new_analysis

The controller file is `app/resources/new_analysis/NewAnalysisController.jl`.

The router file is `routers.jl`.

#### 1 Plain text
In the web page (http://127.0.0.1:9800/new_analysis), the following text were shown:

```
"active")" hs_model="NewAnalysisController.Name(Observable{String} with 1 listeners. Value: "Stipple!")" layout="app/layouts/app.jl.html" context="NewAnalysisController">
```

It is part of julia code `html(ui2(); nav_setting=nav_setting, hs_model=hs_model, layout="app/layouts/app.jl.html", context=@__MODULE__)` in the controller file. I am not sure why it is shown.

#### 2. Web socket error
When going to http://127.0.0.1:9800/new_analysis, error message were shown in web console and julia REPL:

Web Consol:

```
Queuing subscription channels.js:104:13
Download the Vue Devtools extension for a better development experience:
https://github.com/vuejs/vue-devtools vue.js:9055:49
You are running Vue in development mode.
Make sure to turn on production mode when deploying for production.
See more tips at https://vuejs.org/guide/deployment.html vue.js:9064:47
Subscription ready channels.js:102:13
Server closed WebSocket connection channels.js:91:11
```

Julia REPL:

```julia
[ Info: 2020-10-22 15:08:12 __
[ Info: 2020-10-22 15:08:13 /new_analysis 200
[ Info: 2020-10-22 15:08:13 /css/stipple/stipplecore.min.css 200
[ Info: 2020-10-22 15:08:13 /__/channels.js?v=1.7.1 200
[ Info: 2020-10-22 15:08:13 /js/stipple/underscore-min.js 200
[ Info: 2020-10-22 15:08:13 /js/stipple/vue.js 200
[ Info: 2020-10-22 15:08:13 /js/stipple/stipplecore.js 200
[ Info: 2020-10-22 15:08:13 /js/stipple/vue_filters.js 200
┌ Error: 2020-10-22 15:08:15 error handling request
│   exception =
│    MethodError: no method matching start(::HTTP.Messages.Request, ::String, ::Dict{Symbol,Any})
│    Closest candidates are:
│      start(::HTTP.Messages.Request, ::HTTP.Messages.Response, ::Dict{Symbol,Any}; options) at /home/jc/.julia/packages/Genie/iL6x9/src/Sessions.jl:131
│      start(::HTTP.Messages.Request, ::HTTP.Messages.Response) at /home/jc/.julia/packages/Genie/iL6x9/src/Sessions.jl:131
│    route_ws_request(::HTTP.Messages.Request, ::String, ::HTTP.WebSockets.WebSocket{HTTP.ConnectionPool.Transaction{Sockets.TCPSocket}}, ::Sockets.IPv4) at /home/jc/.julia/packages/Genie/iL6x9/src/Router.jl:185
│    handle_ws_request at /home/jc/.julia/packages/Genie/iL6x9/src/AppServer.jl:227 [inlined]
│    handle_ws_request at /home/jc/.julia/packages/Genie/iL6x9/src/AppServer.jl:226 [inlined]
│    #24 at /buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.4/Distributed/src/macros.jl:127 [inlined]
│    run_work_thunk(::Genie.AppServer.var"#24#25"{HTTP.Messages.Request,HTTP.WebSockets.WebSocket{HTTP.ConnectionPool.Transaction{Sockets.TCPSocket}}}, ::Bool) at /buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.4/Distributed/src/process_messages.jl:79
│    remotecall_fetch(::Function, ::Distributed.LocalProcess; kwargs::Base.Iterators.Pairs{Union{},Union{},Tuple{},NamedTuple{(),Tuple{}}}) at /buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.4/Distributed/src/remotecall.jl:375
│    remotecall_fetch(::Function, ::Distributed.LocalProcess) at /buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.4/Distributed/src/remotecall.jl:375
│    remotecall_fetch(::Function, ::Int64; kwargs::Base.Iterators.Pairs{Union{},Union{},Tuple{},NamedTuple{(),Tuple{}}}) at /buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.4/Distributed/src/remotecall.jl:417
│    remotecall_fetch(::Function, ::Int64) at /buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.4/Distributed/src/remotecall.jl:417
│    setup_ws_handler(::HTTP.Messages.Request, ::HTTP.WebSockets.WebSocket{HTTP.ConnectionPool.Transaction{Sockets.TCPSocket}}) at /home/jc/.julia/packages/Genie/iL6x9/src/AppServer.jl:213
│    #7 at /home/jc/.julia/packages/Genie/iL6x9/src/AppServer.jl:75 [inlined]
│    upgrade(::Genie.AppServer.var"#7#14"{HTTP.Streams.Stream{HTTP.Messages.Request,HTTP.ConnectionPool.Transaction{Sockets.TCPSocket}}}, ::HTTP.Streams.Stream{HTTP.Messages.Request,HTTP.ConnectionPool.Transaction{Sockets.TCPSocket}}; binary::Bool) at /home/jc/.julia/packages/HTTP/IAI92/src/WebSockets.jl:160
│    upgrade at /home/jc/.julia/packages/HTTP/IAI92/src/WebSockets.jl:142 [inlined]
│    (::Genie.AppServer.var"#6#13"{Int64,Int64})(::HTTP.Streams.Stream{HTTP.Messages.Request,HTTP.ConnectionPool.Transaction{Sockets.TCPSocket}}) at /home/jc/.julia/packages/Genie/iL6x9/src/AppServer.jl:74
│    macro expansion at /home/jc/.julia/packages/HTTP/IAI92/src/Servers.jl:367 [inlined]
│    (::HTTP.Servers.var"#13#14"{Genie.AppServer.var"#6#13"{Int64,Int64},HTTP.ConnectionPool.Transaction{Sockets.TCPSocket},HTTP.Streams.Stream{HTTP.Messages.Request,HTTP.ConnectionPool.Transaction{Sockets.TCPSocket}}})() at ./task.jl:358
│    Stacktrace:
│     [1] remotecall_fetch(::Function, ::Distributed.LocalProcess; kwargs::Base.Iterators.Pairs{Union{},Union{},Tuple{},NamedTuple{(),Tuple{}}}) at /buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.4/Distributed/src/remotecall.jl:376
│     [2] remotecall_fetch(::Function, ::Distributed.LocalProcess) at /buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.4/Distributed/src/remotecall.jl:375
│     [3] remotecall_fetch(::Function, ::Int64; kwargs::Base.Iterators.Pairs{Union{},Union{},Tuple{},NamedTuple{(),Tuple{}}}) at /buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.4/Distributed/src/remotecall.jl:417
│     [4] remotecall_fetch(::Function, ::Int64) at /buildworker/worker/package_linux64/build/usr/share/julia/stdlib/v1.4/Distributed/src/remotecall.jl:417
│     [5] setup_ws_handler(::HTTP.Messages.Request, ::HTTP.WebSockets.WebSocket{HTTP.ConnectionPool.Transaction{Sockets.TCPSocket}}) at /home/jc/.julia/packages/Genie/iL6x9/src/AppServer.jl:213
│     [6] #7 at /home/jc/.julia/packages/Genie/iL6x9/src/AppServer.jl:75 [inlined]
│     [7] upgrade(::Genie.AppServer.var"#7#14"{HTTP.Streams.Stream{HTTP.Messages.Request,HTTP.ConnectionPool.Transaction{Sockets.TCPSocket}}}, ::HTTP.Streams.Stream{HTTP.Messages.Request,HTTP.ConnectionPool.Transaction{Sockets.TCPSocket}}; binary::Bool) at /home/jc/.julia/packages/HTTP/IAI92/src/WebSockets.jl:160
│     [8] upgrade at /home/jc/.julia/packages/HTTP/IAI92/src/WebSockets.jl:142 [inlined]
│     [9] (::Genie.AppServer.var"#6#13"{Int64,Int64})(::HTTP.Streams.Stream{HTTP.Messages.Request,HTTP.ConnectionPool.Transaction{Sockets.TCPSocket}}) at /home/jc/.julia/packages/Genie/iL6x9/src/AppServer.jl:74
│     [10] macro expansion at /home/jc/.julia/packages/HTTP/IAI92/src/Servers.jl:367 [inlined]
│     [11] (::HTTP.Servers.var"#13#14"{Genie.AppServer.var"#6#13"{Int64,Int64},HTTP.ConnectionPool.Transaction{Sockets.TCPSocket},HTTP.Streams.Stream{HTTP.Messages.Request,HTTP.ConnectionPool.Transaction{Sockets.TCPSocket}}})() at ./task.jl:358
└ @ HTTP.Servers ~/.julia/packages/HTTP/IAI92/src/Servers.jl:373

```
