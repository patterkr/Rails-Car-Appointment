class User < ApplicationRecord
	validates :email, :fname, :lname, :phonenum, :caryear, :carmake, :carmodel, :repairs, :appt, presence: true
end
