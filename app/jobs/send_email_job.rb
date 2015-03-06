class SendEmailJob < ActiveJob::Base
  queue_as :default

  def perform(user)
    RegisterMailer.register(user).deliver_later
  end
end
