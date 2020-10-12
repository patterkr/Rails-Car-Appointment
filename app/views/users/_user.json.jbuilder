json.extract! user, :id, :email, :fname, :lname, :phonenum, :caryear, :carmake, :carmodel, :repairs, :appt, :ip, :created_at, :updated_at
json.url user_url(user, format: :json)
