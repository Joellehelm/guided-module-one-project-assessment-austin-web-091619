$logged_in = nil


def greeting
    puts 'Welcome to Quiz Show!!!'
end


def create_user_acc
    puts "Please enter a username for your account."
    puts "Your username cannot exceede 10 chracters."
    ui_username = gets.chomp
    ui_username = ui_username.to_s
    if User.find_by(user_name: ui_username)
        puts "That account name already exists. Please try again."
        create_user_acc
    elsif ui_username.length > 10
        puts "Your username is too long. Please try again."
        create_user_acc
    else
        puts "Please enter a password for your account."
        ui_password = gets.chomp
        User.create(user_name: ui_username, password: ui_password) 
        puts "#{ui_username} your account has been created."

        end
end


def first_screen
    puts "Please log in or create an account."
    puts "Select a number below."
    puts "1. Log in"
    puts "2. Create a new account"
    choice = gets.chomp
    if choice == "1"
        log_in
    elsif choice == "2"
        create_user_acc
        first_screen
    else
        "Please choose 1 or 2."
        first_screen
    end
end


def log_in
    puts "Please enter your account name."
    acc_name = gets.chomp.to_s
    if User.find_by(user_name: acc_name)
        current = User.find_by(user_name: acc_name)
        correct = current.password
        puts "Please enter your password."
        entered_password = gets.chomp
        if entered_password == correct
            $logged_in = current.id                   #This grabs the users id if they log in correctly
            #method to do what comes after logging in goes here
            after_logging_in
        end
    else
        puts "That username does not exist."
        first_screen
    end

end


def step_one_to_delete_acc
    this_user = User.find_by(id: $logged_in)
    puts "Are you sure you want to delete your account?"
    puts "1. Yes"
    puts "2. No"
    final = gets.chomp
    if final == "1"
        this_user.delete_account
        puts "Your account has been deleted."
        first_screen
    elsif final == "2"
        after_logging_in
    else
        puts "Please enter 1 or 2."
        step_one_to_delete_acc
    end
end


def selecting_quiz
    puts "Please choose a category."
    
end

def after_logging_in
 this_user = User.find_by(id: $logged_in)
    puts "What would you like to do?"
    puts "Select a number below."
    puts "1. Play a quiz."
    puts "2. View your past scores."
    puts "3. Change password."
    puts "4. Delete your account."
user_choice = gets.chomp
    if user_choice == "1"
        #method to select category for quiz
    elsif user_choice == "2"
        #view past scores method
    elsif user_choice == "3"
        10.times {puts}
        puts "Please enter a new password."
        change_to = gets.chomp
        this_user.password = change_to 
        this_user.save
        after_logging_in
    elsif user_choice == "4"
       step_one_to_delete_acc
    else
        20.times {puts}
        puts "========================="
        puts "Please choose 1, 2, or 3."
        puts "========================="

        after_logging_in
    end




end