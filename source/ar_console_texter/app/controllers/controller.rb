require_relative 'twilio_logic'
require_relative '../models/contacts'
require_relative '../models/users'
require_relative '../views/view'

class Controller
	
	def initialize(db)
		@db = db
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
    if login_info[0] != @db.user_name || login_info[1] != @db.password
      Display.failed_login
      validate(login)
    else
      @user = @db.match_user(user_name, password)
      @texter = Texter.new(@user.auth_token, @user.account_sid, @user.number)
    end
  end


  def options
    Display.show_options
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
    @view.view_contacts(@valid_contacts) # shows contacts thats it 
  end
  def text
    view_contacts # HERE ARE YOUR CONTACTS WHO WOULD YOU LIKE TO TEXT?
    to = @view.get_contact  #NOW ASKS YOU TO CHOOSE A NUMBER
    body = @view.get_text_body # ASKS USER TO TYPE IN A MESSAGE
    @texter.send_text(to, body)
    @view.sent_text
  end

  def logout
    Display.logout
    start
  end

  def finish
    @finish = true
  end

end

session = Controller.new(GET_ME_MY_DATABASE, GET_ME_MY_VIEWER)
