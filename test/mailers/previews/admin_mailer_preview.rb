class AdminMailerPreview < ActionMailer::Preview
  def update_mail
    AdminMailer.update_email(Admin.first, Admin.last)
  end
end