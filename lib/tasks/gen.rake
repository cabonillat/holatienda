require 'csv'

namespace :gen do

  desc "genera un lista de usuarios"
  task users: :environment do
	CSV.open('/Users/Coffey/Desktop/prueba_class/users.csv', 'w') do |csv|
		User.all.each do |user|
			csv << [user.email, user.name]
		end
	end
  end

end
