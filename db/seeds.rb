# saul = User.create(user_name: "Saul", password: "1")
# joelle = User.create(user_name: "Joelle", password: "2")
# ashley = User.create(user_name: "Ashley", password: "123")
# george = User.create(user_name: "George", password: "password")




easy = Difficulty.create("Easy")
medium = Difficulty.create("Medium")
hard = Difficulty.create("Hard")


science = Category.create("Science")
general_knowledge = Category.create("General Knowledge")
music = Category.create("Music")
mythology = Category.create("Mythology")
tv = Category.create("T.V")
food = Category.create("Food")


first = Score.create(:user_id => 1, :category_id => 2, :difficulty_id => 3)
second = Score.create(:user_id => 2, :category_id => 4, :difficulty_id => 1)
third = Score.create(:user_id => 3, :category_id => 3, :difficulty_id => 2)
fourth = Score.create(:user_id => 4, :category_id => 6, :difficulty_id => 1)
fifth = Score.create(:user_id => 3, :category_id => 1, :difficulty_id => 3)

# user_id
# category_id
# difficulty_id

