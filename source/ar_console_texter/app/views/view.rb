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
		puts "*"*50
		puts "*"*50
		puts "Welcome to Console Texter!"
		puts "*"*50
		puts "*"*50
	end

	def self.login
		puts "Username: "
		@username = gets.chomp
		puts "Password: "
		@password = STDIN.noecho(&:gets).chomp
		return @username, @password
	end


end