module PCCAuthentication

import Genie, SearchLight
using Dates
using Users

# TODO

isdefined(UserApp, :AUTH_CODES) || @eval(PolyChromeGenie, AUTH_SESSIONS = Dict{String, Tuple{String,String}}()) # Session id => (username, user)

function pcc_authenticate(username::String, password::String)

	input_validation(username) || return nothing

	try
		user = SearchLight.findone(User, username = username, password = Users.hash_password(password))
		
	catch
		return nothing
	end
end

function input_validation(input::String)
	occursin(UserApp.VALIDATION_REGEX, input)
end



end