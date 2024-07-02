json.extract! account_user, :id, :first_name, :last_name, :email, :date_of_birth, :photo, :created_at, :updated_at
json.url account_user_url(account_user, format: :json)
json.photo url_for(account_user.photo)
