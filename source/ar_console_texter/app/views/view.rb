require 'io/console'

class Display

	def self.intro
	    self.clear_screen
	    self.move_to_home
	end

  	def self.clear_screen
    	print "\e[2J"
  	end

  	def self.move_to_home
    	print "\e[H"
  	end


	def self.welcome
		puts "*"*100
		puts "*"*100
		puts "
 ____                                         ______                __
/\\  _`\\                                      /\\__  _\\              /\\ \\__
\\ \\ \\/\\_\\    ___     ___ ___   _____   __  __\\/_/\\ \\/    __   __  _\\ \\ ,_\\
 \\ \\ \\/_/_  / __`\\ /' __` __`\\/\\ '__`\\/\\ \\/\\ \\  \\ \\ \\  /'__`\\/\\ \\/'\\\\ \\ \\/
  \\ \\ \\L\\ \\/\\ \\L\\ \\/\\ \\/\\ \\/\\ \\ \\ \\L\\ \\ \\ \\_\\ \\  \\ \\ \\/\\  __/\\/>  </ \\ \\ \\_
   \\ \\____/\\ \\____/\\ \\_\\ \\_\\ \\_\\ \\ ,__/\\ \\____/   \\ \\_\\ \\____\\/\\_/\\_\\ \\ \\__\\
    \\/___/  \\/___/  \\/_/\\/_/\\/_/\\ \\ \\/  \\/___/     \\/_/\\/____/\\//\\/_/  \\/__/
                                 \\ \\_\\
                                  \\/_/
    "

		puts "*"*100
		puts "*"*100
	end

	def self.login
		puts "Username: "
		@username = gets.chomp
		puts "Password: "
		@password = STDIN.noecho(&:gets).chomp
		return @username, @password
	end

	def self.failed_login
		puts "Incorrect Username and/or Password. Try again"
	end

	def self.show_options
		puts "1. See Contact List"
		puts "2. Text a Buddy"
		puts "3. Log Out"
		puts "4. Finish"
		@choice = gets.chomp
		return @choice
	end

	def self.invalid_option
		puts "Not a valid option"
	end

	def self.view_contacts(user)
		puts "Here is your contact list:"
		puts "-"*50
	  	user.each {|contact|
	  		puts contact.id.to_s.ljust(3) +contact.name.to_s.ljust(7) +"|  " +contact.number.to_s.ljust(7)
	  	}
		# return organized_users
	end


	def self.sent_text
		puts "Text was successfully sent!"
	end

	def self.logout
		puts "You have officially logged out of your account"
	end

	def self.get_contact
		puts "Who do you want to text?"
		@receiver = gets.chomp
		return @receiver
	end


	def get_text_body
		puts "Message: "
		@message = gets.chomp
		return @message
	end

	def organize_contacts(objects)

  	end



end