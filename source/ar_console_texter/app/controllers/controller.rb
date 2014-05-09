require_relative 'twilio_logic'
require_relative '../models/contacts'
require_relative '../models/users'
require_relative '../views/view'

class Controller

	def initialize
		@finished = false
    @user = nil
	end

	def start
		Display.intro
		Display.welcome
	    validate(login)
		until finished?
	      execute_option(options)
	    end
	end

  private

	def login #gets user input for username/password
		Display.login
	end

	def finished? #
		@finished
	end

  def validate(login_info)
    #how do i look into the database and check username/password AND that they match
    if user_in_db?(login_info[0], login_info[1])
      @user = User.where(username: login_info[0], password: login_info[1]).first
      p @user
      @texter = Texter.new(@user.account_sid, @user.auth_token, @user.phone)
    else
      Display.failed_login
      validate(login)
    end
  end


  def options
    Display.show_options
  end

  def user_in_db?(username,password)
    User.where(username: username, password: password).exists?
  end

  def execute_option(option)
    case option
    when "1" then view_contacts
    when "2" then text
    when "3" then logout
    when "4" then finish
    else
      Display.invalid_option
    end
  end

  def view_contacts
    Display.view_contacts(@user.contacts) # shows contacts thats it
    
  end
  def text
    view_contacts # HERE ARE YOUR CONTACTS WHO WOULD YOU LIKE TO TEXT?
    to = Display.get_contact  #NOW ASKS YOU TO CHOOSE A NUMBER BY EXPECTING A RETURN OF THE PRIMARY KEY
    body = Display.get_text_body # ASKS USER TO TYPE IN A MESSAGE
    @texter.send_text(to, body)
    Display.sent_text
  end

  def logout
    Display.logout
    start
  end

  def finish
    exit
  end



end

session = Controller.new
session.start
