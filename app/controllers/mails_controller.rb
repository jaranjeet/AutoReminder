require 'gmail'

class MailsController < ApplicationController
	def send_it
		#binding.pry
		gmail = Gmail.connect('sender@gmail.com', 'password')
		loop do
			MyMailer.send_mail.deliver_now!
			sleep 2.minutes
			mail = gmail.inbox.find(:unread, :from => 'receiver@gmail.com').first.message
			if mail.subject.eql?("Re: Hello_2m")
				render 'show'
				return
			end
			redo
		end
 		gmail.logout

		redirect_to root_path

	end
	def show

	end
end
