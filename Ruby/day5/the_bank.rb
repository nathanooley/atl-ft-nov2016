class Account
	attr_accessor :name, :acct_num, :balance

	def initialize(name, acct_num, balance)
		@name =  name
		@acct_num = acct_num
		@balance = balance
	end
	

	def deposit(amount)
		@balance 	+= amount
	end
	
	def withdrawal(amount)
		@balance -= amount
	end		

end



count = 0


number_of_accounts = 0 #this will help assign account numbers
accounts = [] #This will be where our users are stored

def main(number_of_accounts, accounts, count)

	
	puts "Welcome to My Bank. Please choose an option:"
	puts "---------------------"
	puts "1. Create an account"
	puts "2. View an existng account"
	puts "3. Exit the system"

	choice = gets.chomp.to_i

	if choice == 1 
		create_account(number_of_accounts, accounts)

	elsif choice == 2
		account_menu(number_of_accounts, accounts) 
	elsif choice == 3
		puts "Thank you for stopping by!"		
	else
		if count < 3
			puts "Not a valid entry, please try again."	
			count +=1
			main(number_of_accounts, accounts, count)
		else
			puts "You seem to be having trouble.  Please contact customer service."
		end

	end	



end


def create_account(number_of_accounts, accounts)
	count = 0

	puts "Please enter your name:"
	name = gets.chomp.upcase
	puts "Please enter your initial amount:"
	amount = gets.chomp.to_f

	number_of_accounts +=1

	new_account = Account.new(name, number_of_accounts, amount)

	accounts.push(new_account)

	puts "Your account has been created!"
	puts "Name: #{new_account.name}, Account #{new_account.acct_num}, Balance #{new_account.balance}"

	main(number_of_accounts, accounts, count)

end



def account_menu(number_of_accounts, accounts)
	count = 0
	puts "Please log in to you account."
	puts "Name:"
	name = gets.chomp.upcase
	puts "Account number: "
	account_number = gets.chomp.to_i


	found = false

	current_user = ""
	accounts.each do |a|
		if a.name == name && a.acct_num == account_number
			current_user = a 
			# puts "#{current_user.name}, #{current_user.balance}"
			found = true
		else
			puts "Record not found!"
			main(number_of_accounts, accounts, count)	
		end	

	end 	


			puts "Choose from the following"
			puts "*********************************"
			puts "1: Check balance"
			puts "2: Make a deposit"
			puts "3: Make a withdrawal"
			puts "4: Exit to main"
			user = gets.chomp.to_i

				case user
				when 1
					check_balance(current_user,number_of_accounts,accounts)
				when 2 
						make_deposit(current_user, accounts)
				when 3
					make_withdrawal(current_user, accounts)			

				else
					puts "Invalid entry"
					main(number_of_accounts, accounts, count)	
				end	


end	

def check_balance(current_user, number_of_accounts, accounts)

	puts "Your current balance is #{current_user.balance}"
	account_menu(number_of_accounts, accounts)
end


def make_deposit
end


def make_withdrawal
end	




system "clear"
main(number_of_accounts, accounts, count)