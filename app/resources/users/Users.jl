module Users

using Genie, Genie.Renderer, Genie.Sessions
using SearchLight, SearchLight.Validation, UsersValidator
using GenieAuthentication
using SHA

export User
export update_login_to_nav_setting!

include("UsersUtils.jl")


Base.@kwdef mutable struct User <: AbstractModel
  ### FIELDS
  id::DbId = DbId()
  username::String = ""
  password::String = ""
  name::String = ""
  email::String = ""

  ### VALIDATION
  # validator::ModelValidator  = ModelValidator([
  #   ValidationRule(:username, UsersValidator.not_empty),
  #   ValidationRule(:username, UsersValidator.unique),
  #   ValidationRule(:password, UsersValidator.not_empty),
  #   ValidationRule(:email,    UsersValidator.not_empty),
  #   ValidationRule(:email,    UsersValidator.unique),
  #   ValidationRule(:name,     UsersValidator.not_empty)
  # ])
end

function hash_password(password::String)
  sha256(password) |> bytes2hex
end

end
