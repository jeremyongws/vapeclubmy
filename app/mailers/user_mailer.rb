class UserMailer < ApplicationMailer
	default from: 'vaper@vapeclubmy.com'
 
  def welcome_email(user, password)
    @user = user
    @url  = 'http://store.vapeclubmy.com/login'
    @password = password
    mail(to: @user.email, subject: 'Welcome to VapeClubMY')
  end
end
