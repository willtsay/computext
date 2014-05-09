require_relative 'twilio_logic'
require_relative '../models/contacts'
require_relative '../models/users'

class Controller
	
	def initialize(db, view)
		@view = view 
		@db = db
		@finished = false
    @user = nil
	end
	
	def start
    validate(login)
		until finished?
      execute_option(options)
    end
  end

  private

	def login #gets user input for username/password
		@view.login
	end

	def finished? #
		@finished
	end

  def validate(login_info)
    #how do i look into the database and check username/password AND that they match 
    if login_info[0] != @db.user_name || login_info[1] != @db.password
      @view.failed_login
      validate(login)
    else
      @user = @db.match_user(user_name, password)
      @texter = Texter.new(@user.auth_token, @user.account_sid, @user.number)
    end
  end


  def options
    @view.show_options
  end

  def execute_option(option)
    case option 
    when "view" then view_contacts
    when "text" then text
    when "logout" then logout
    when "finish" then finish
    else
      @view.invalid_option
    end      
  end

  def view_contacts
    @view.viewcontacts(@valid_contacts) # shows contacts thats it 
  end
  def text
    view_contacts # HERE ARE YOUR CONTACTS WHO WOULD YOU LIKE TO TEXT?
    to = @view.get_contact  #NOW ASKS YOU TO CHOOSE A NUMBER
    body = @view.get_text_body # ASKS USER TO TYPE IN A MESSAGE
    @texter.send_text(to, body)
    @view.sent_text
  end

  def logout
    @view.logout
    start
  end

  def finish
    @finish = True
  end

end

session = Controller.new(GET_ME_MY_DATABASE, GET_ME_MY_VIEWER)
