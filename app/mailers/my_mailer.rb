class MyMailer < ApplicationMailer
	default from: 'sender@gmail.com'
	def send_mail
		mail(to: 'receiver@gmail.com', subject: 'Hello_2m')
	end
end
