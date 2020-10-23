
function update_login_to_nav_setting!(nav_setting::Dict{Symbol, T}, params) where T
    try
        user_id = Genie.Sessions.get(Genie.Sessions.session(params), :__auth_user_id)
        user = SearchLight.findone(User, id = user_id)
        nav_setting[:user] = user.name
    catch
        nav_setting[:user] = ""
    end
    nav_setting
end
