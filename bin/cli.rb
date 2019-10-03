require 'json'
require 'rest-client'

$logged_in = nil
$newscore = nil


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


  def final_score
        current =  Score.where(["user_id = ?", "#{$logged_in}"]).last
        table = Text::Table.new
        table.head = ['USERNAME', 'CATEGORIES PLAYED', 'DIFFICULTY','FINAL SCORE']
        table.rows << [current.user.user_name, current.category.name, current.difficulty.name, current.last_score]
        puts table
    end 



def play_quiz(quizapi)
    correct_answers = []
    incorrect_answers = []
    questions = []
    all_answers = []
    i = 0
    points = 0

    quiz_data = RestClient.get("#{quizapi}")
    quiz_hash = JSON.parse(quiz_data)
    questions = quiz_hash["results"].map { |data| data["question"]}  
    correct_answers = quiz_hash["results"].map { |data| data["correct_answer"]}
    wrong_answers = quiz_hash["results"].map { |data| data["incorrect_answers"]}
    all_answers = wrong_answers

    correct_answers.each do |ans|
        all_answers[i] << ans
        all_answers[i].shuffle!
        i += 1   
    end



    questions.each_with_index do |question, i|
        puts question
        a = all_answers[i][0]
        b = all_answers[i][1]
        c = all_answers[i][2]
        d = all_answers[i][3]
        puts "a. #{all_answers[i][0]}"
        puts "b. #{all_answers[i][1]}"
        puts "c. #{all_answers[i][2]}"
        puts "d. #{all_answers[i][3]}"

        user_answer = gets.chomp
        if user_answer == "a"
            current = a
        elsif user_answer == "b"
            current = b
        elsif user_answer == "c"
            current = c
        elsif user_answer == "d"
            current = d
        else
            puts "Please choose a, b, c, or d"
            redo
        end

        if current == correct_answers[i]
            puts "CORRECT! You have earned 1 point."
            points += 1
            puts "You have #{points} points!"
        else
            puts "INCORRECT! The correct answer was #{correct_answers[i]}"
        end
    end
    #add thanks for playing and final score here
    puts "Thanks for playing!!!"
   
    newscore = $newscore
    newscore.last_score = points
    newscore.save
    # puts "You just got a score of #{newscore}!"
     final_score

end

def create_url(urlcategory, difficulty)
    
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
    cat_name = categories.key(urlcategory)
    this_cat = Category.find_by(name: cat_name).id
   
    

    base_url = 'https://opentdb.com/api.php?amount=5&category=12&difficulty=easy&type=multiple'
    quiz_url = base_url[0...46] << urlcategory.to_s << '&difficulty=' << difficulty << '&type=multiple'
    create_score(quiz_url, this_cat)
    play_quiz(quiz_url)
end

def create_score(quiz_url, cat_id)
    category = cat_id
  
    quiz_url = 'https://opentdb.com/api.php?amount=5&category2=&difficulty=easy&type=multiple'
    cat_start = "category="
    cat_end = "&"
    dif_start = "difficulty="
    dif_end = "&"
 
    
    difficulty = quiz_url[/#{dif_start}(.*?)#{dif_end}/m, 1]
        if difficulty == 'easy'
            difficulty = 1
        elsif difficulty == 'medium'
            difficulty = 2
        else difficulty = 3
        end
   newscore = Score.create(:user_id => $logged_in, :category_id => category, :difficulty_id => difficulty, :last_score => 0)
   newscore.save
   $newscore = newscore
end


def selecting_category
  urlcategory = nil
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
    urlcategory = 9
    selecting_difficulty(urlcategory)
   elsif selection == "2"
    urlcategory = 12
    selecting_difficulty(urlcategory)
   elsif selection == "3"
    urlcategory = 14
    selecting_difficulty(urlcategory)
   elsif selection == "4"
    urlcategory = 17
    selecting_difficulty(urlcategory)
   elsif selection == "5"
    urlcategory = 18
    selecting_difficulty(urlcategory)
   elsif selection == "6"
    urlcategory = 20
    selecting_difficulty(urlcategory)
   elsif selection == "7"
    urlcategory = 21
    selecting_difficulty(urlcategory)
   elsif selection == "8"
    urlcategory = 22
    selecting_difficulty(urlcategory)
   elsif selection == "9"
    urlcategory = 23
    selecting_difficulty(urlcategory)
   elsif selection == "10"
    urlcategory = 27
    selecting_difficulty(urlcategory)
   else
    puts "Please select 1-10."
    selecting_category
   end
    
end

def selecting_difficulty(category)
    1.times do
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
        create_url(category, difficulty)
    elsif difficulty_selection == "2"
        difficulty = "medium"
        puts "Middle of the Road."
        create_url(category, difficulty)
    elsif difficulty_selection == "3"
        difficulty = "hard"
        puts "Woah. Big Brains Over Here!"
        create_url(category, difficulty)
    else
        puts "Please select 1, 2, or 3."
        redo
    end
end
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
        User.my_scores #THIS USED TO WORK AS User.my_scores
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







end