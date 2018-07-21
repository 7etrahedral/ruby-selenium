class LogoutPage < SitePrism::Page

  logout_page_addrs = "/download?logged_out=1&lang=en"
  set_url(ENV['BASE_URL'] + logout_page_addrs)

  element :download_app_text, :css, ".PageDownload-title"

  def verify_logged_out
    self.should be_visible(download_app_text)
  end

  def download_app_present
    download_app_text.text
  end

end
