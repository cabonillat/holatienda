class Store < ActiveRecord::Base
	validates_presence_of :address

	has_many :products

	after_create :notify_users
	
	def notify_users
		User.all.each do |user|
			user.notify_new_store(self)
		end
	end
end
