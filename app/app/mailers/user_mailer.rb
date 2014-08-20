class UserMailer < ActionMailer::Base
   default from: "ghoshdeepankar49@gmail.com"
  def welcome_email(user)
     @user = user
     @url = 'http://gmail.com/login'
     #attachments['index.jpeg'] = File.read('/home/lakshmi/Desktop/sample-rails-app/mail/mail/public/index.jpeg')
     mail(to: @user.email, subject: 'welcome to my awesome site')
     
end
end
