json.array!(@users) do |user|
  json.extract! user, :id, :username, :email, :encrypted_password, :salt, :remember_token
  json.url user_url(user, format: :json)
end
