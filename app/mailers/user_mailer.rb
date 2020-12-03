class UserMailer < ApplicationMailer
default from: 'contact.talentconnect100@gmail.com'

  def welcome_email(user)
    @user = user
    @urlHomePage = root_url
    @urlLogin = new_user_session_url
    
    mail(to: @user.email, subject: 'Bienvenue sur TalentConnect !')
  end

end
