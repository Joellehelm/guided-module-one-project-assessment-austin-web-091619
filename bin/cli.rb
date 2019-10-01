$logged_in = nil
$this_user = nil

def greeting
    puts 'Welcome to Quiz Show!!!'
end


def create_user_acc
    puts "Please enter a username for your account."
    ui_username = gets.chomp
    ui_username = ui_username.to_s
    if User.find_by(user_name: ui_username)
        puts "That account name already exists. Please try again."
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
    puts "1. Log in"
    puts "2. Create a new account"
    choice = gets.chomp
    if choice == "1"
        log_in
    elsif choice == "2"
        create_user_acc
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
    end

end

def after_logging_in
 this_user = User.find_by(id: $logged_in)
    puts "What would you like to do?"
    puts "1. Play a quiz."
    puts "2. View your past scores."
    puts "3. Change password."
user_choice = gets.chomp
    if user_choice == "1"
        #method to select category for quiz
    elsif user_choice == "2"
        #view past scores method
    elsif user_choice == "3"
        10.times {puts}
        puts "Please enter a new password."
        change_to = gets.chomp
        this_user.password = "123" 
        this_user.save
    else
        20.times {puts}
        puts "========================="
        puts "Please choose 1, 2, or 3."
        puts "========================="

        after_logging_in
    end
end


