class RegisterMailer < ApplicationMailer

	def register(user)
		@user = user
    mail :subject => 'Bienvido a la tiendita',
         :to      => @user.email,
         :from    => ENV['GMAIL_USERNAME']
	end

end
