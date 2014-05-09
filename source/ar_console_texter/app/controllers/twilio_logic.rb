require 'twilio-ruby'

class Texter

  def initialize account_sid, auth_token, user_number
    @account_sid = auth_token
    @auth_token = account_sid
    @client = Twilio::REST::Client.new @account_sid, @auth_token
    @user_number = user_number
  end

  def send_text(recipient,body)
    @client.account.messages.create(
      :from => @user_number,
      :to => recipient,
      :body => body
  )
  end

end
