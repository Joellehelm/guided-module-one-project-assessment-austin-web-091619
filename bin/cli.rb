$logged_in = nil


# def greeting
#   welcome = File.ready()
# print "__       __  ________  __        ______    ______   __       __  ________        ________   ______"        
# print "|  \  _  |  \|        \|  \      /      \  /      \ |  \     /  \|        \      |        \ /      \"       
# print "| $$ / \ | $$| $$$$$$$$| $$     |  $$$$$$\|  $$$$$$\| $$\   /  $$| $$$$$$$$       \$$$$$$$$|  $$$$$$\"      
# print "| $$/  $\| $$| $$__    | $$     | $$   \$$| $$  | $$| $$$\ /  $$$| $$__             | $$   | $$  | $$ "     
# print "| $$  $$$\ $$| $$  \   | $$     | $$      | $$  | $$| $$$$\  $$$$| $$  \            | $$   | $$  | $$ "     
# print "| $$ $$\$$\$$| $$$$$   | $$     | $$   __ | $$  | $$| $$\$$ $$ $$| $$$$$            | $$   | $$  | $$ "     
# print "| $$$$  \$$$$| $$_____ | $$_____| $$__/  \| $$__/ $$| $$ \$$$| $$| $$_____          | $$   | $$__/ $$ "     
# puts "| $$$    \$$$| $$     \| $$     \\$$    $$ \$$    $$| $$  \$ | $$| $$     \         | $$    \$$    $$ "     
# puts " \$$      \$$ \$$$$$$$$ \$$$$$$$$ \$$$$$$   \$$$$$$  \$$      \$$ \$$$$$$$$          \$$     \$$$$$$ "     
# puts                                                                                                           
# puts                                                                                                           
# puts                                                                                                           
# puts "  ______   __    __  ______  ________         ______   __    __   ______   __       __  __"                 
# puts " /      \ |  \  |  \|      \|        \       /      \ |  \  |  \ /      \ |  \  _  |  \|  \"                
# puts "|  $$$$$$\| $$  | $$ \$$$$$$ \$$$$$$$$      |  $$$$$$\| $$  | $$|  $$$$$$\| $$ / \ | $$| $$"                
# puts "| $$  | $$| $$  | $$  | $$      /  $$       | $$___\$$| $$__| $$| $$  | $$| $$/  $\| $$| $$"                
# puts "| $$  | $$| $$  | $$  | $$     /  $$         \$$    \ | $$    $$| $$  | $$| $$  $$$\ $$| $$"                
# puts "| $$ _| $$| $$  | $$  | $$    /  $$          _\$$$$$$\| $$$$$$$$| $$  | $$| $$ $$\$$\$$ \$$"                
# puts "| $$/ \ $$| $$__/ $$ _| $$_  /  $$___       |  \__| $$| $$  | $$| $$__/ $$| $$$$  \$$$$ __ "                
# puts  "\$$ $$ $$ \$$    $$|   $$ \|  $$    \       \$$    $$| $$  | $$ \$$    $$| $$$    \$$$|  \"                
# puts   "\$$$$$$\  \$$$$$$  \$$$$$$ \$$$$$$$$        \$$$$$$  \$$   \$$  \$$$$$$  \$$      \$$ \$$"   
# end


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
        else
            puts "The password is incorrect."
            puts "Please try again."
            log_in
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

def create_url(category,difficulty)
    categories = {
    'General Knowledge': 9,
    'Music': 12,
    'Television': 14,
    'Science & Nature': 17,
    'Computers': 18,
    'Mythology': 20,
    'Sports': 21,
    'Geography': 22,
    'History': 23,
    'Animals': 27
}

############ URL API 


    base_url = 'https://opentdb.com/api.php?amount=5&category=9&difficulty=easy&type=multiple'
    quiz_url = base_url[0...46] << category << '&difficulty=' << difficulty << '&type=multiple'
    quiz_url
end



def selecting_category
  category = nil
    puts "Please choose a category."
    puts "Select a number below."
    puts "1. General Knowledge"
    puts "2. Music"
    puts "3. Television"
    puts "4. Science & Nature"
    puts "5. Computers"
    puts "6. Mythology"
    puts "7. Sports"
    puts "8. Geography"
    puts "9. History"
    puts "10. Animals"
   selection = gets.chomp
   if selection == "1"
    category = "9"
    selecting_difficulty(category)
   elsif selection == "2"
    category = "12"
    selecting_difficulty(category)
   elsif selection == "3"
    category = "14"
    selecting_difficulty(category)
   elsif selection == "4"
    category = "17"
    selecting_difficulty(category)
   elsif selection == "5"
    category = "18"
    selecting_difficulty(category)
   elsif selection == "6"
    category = "20"
    selecting_difficulty(category)
   elsif selection == "7"
    category = "21"
    selecting_difficulty(category)
   elsif selection == "8"
    category = "22"
    selecting_difficulty(category)
   elsif selection == "9"
    category = "23"
    selecting_difficulty(category)
   elsif selection == "10"
    category = "27"
    selecting_difficulty(category)
   else
    puts "Please select 1-10."
    selecting_category
   end
    
end

def selecting_difficulty(category)
    category = category
    puts "Please choose a difficulty."
    puts "Select a number below."
    puts "1. Easy"
    puts "2. Medium"
    puts "3. Hard"
    difficulty_selection = gets.chomp
    if difficulty_selection == "1"
        difficulty = "easy"
        puts "You got it, Easy Peasy."
        create_url(category,difficulty)
    elsif difficulty_selection == "2"
        difficulty = "medium"
        puts "Middle of the Road."
        create_url(category,difficulty)
    elsif difficulty_selection == "3"
        difficulty = "hard"
        puts "Woah. Big Brains Over Here!"
        create_url(category,difficulty)
    else
        puts "Please select 1, 2, or 3."
        selecting_difficulty
    end

    #play quiz method goes here
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
        selecting_category
    elsif user_choice == "2"
        #view past scores method
    elsif user_choice == "3"
        10.times {puts}
        puts "Please enter a new password."
        change_to = gets.chomp
        this_user.password = change_to 
        this_user.save
        puts "Your password has been changed."
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


    def play_quiz
        correct_answers = []
        incorrect_answers = []
        questions = []

        
    end




end