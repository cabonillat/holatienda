class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
    #     :recoverable, :rememberable, :trackable, :validatable
	# validates :password, presence: true
	validates :name, presence: true
	validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, allow_blank: true
	has_many :sells

  #for carrierwave
  mount_uploader :avatar, AvatarUploader

	after_create :send_email

  def self.create_with_omniauth(auth)
    self.create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.name = auth['info']['name']
      user.token = auth['credentials']['token']
      user.secret = auth['credentials']['secret']
      user.url_photo = auth['info']['image']
    end
  end

	def login
		User.where(email: self.email, password: self.password).first
	end

	def send_email
		SendEmailJob.set(wait: 5.seconds).perform_later(self)
	end

	def self.newsletter
		User.all.each do |user|
			user.send_email
		end
	end

end
