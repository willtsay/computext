require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid = 'ACe031767d584b6e1828f26021ef460105'
auth_token = 'b6671160c8e47e88e1573cfbc2e9a258'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

@client.account.messages.create({
  :from => '+16094548575',
  :to => gets.chomp,
  :body => 'Hi'
})