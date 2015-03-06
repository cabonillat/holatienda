module GeneralHelpers

	def stub_user
		allow_any_instance_of(User).to receive(:send_email).and_return(nil)
	end

	def create_user
		User.create(name: 'demo', password: '123')
	end

end