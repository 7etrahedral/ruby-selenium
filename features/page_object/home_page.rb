class HomePage < SitePrism::Page

  set_url(ENV["BASE_URL"])

  element :account_name, :css, ".u-textInheritColor"
  element :download_app_text, :css, ".PageDownload-title"
  element :account_icon, :css, "#user-dropdown-toggle"
  element :logout_link_txt, :xpath, ".//*[@id='signout-button']/button"
  element :name, :css, ".u-textInheritColor"

  def verifiy_home_screen
    self.should be_visible(account_name)
  end

  def click_account_icon
    self.account_icon.click
  end

  def click_logout
    self.logout_link_txt.click
  end

  def name_present
    name.text
  end

end
