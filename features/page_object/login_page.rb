class LoginPage < SitePrism::Page

  set_url(ENV["BASE_URL"])

  element :home_login_button,         ".EdgeButton.EdgeButton--transparent.EdgeButton--medium.StreamsLogin.js-login"
  element :email,                     ".text-input.email-input.js-signin-email"
  # element :pwd, :css, ".text-input"
  element :pwd, :xpath, ".//*[@id='login-dialog-dialog']/div[2]/div[2]/div[2]/form/div[2]/input"
  element :login_button, :css, ".submit.btn.primary-btn.js-submit"
  element :avatar, :css, ".DashboardProfileCard-avatarImage.js-action-profile-avatar"
  element :log_in_text, :css, "#login-dialog-header"

  # def login(email_txt, pwd_txt)
  #   self.wait_until_login_button_visible(5)
  #   self.email.set(email_txt)
  #   self.pwd.set(pwd_txt)
  #   self.login_button.click
  #   self.wait_until_avatar_visible(5)
  # end
  #
  def log_in_text_present
    self.log_in_text.text
  end

end
