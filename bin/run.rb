require_relative '../config/environment'
require_relative 'cli'



first_screen


# def first_score
#     score =  Score.where(["user_id = ?", "3"]).first
#     table = Text::Table.new
#     table.head = ['USERNAME', 'CATEGORIES PLAYED', 'DIFFICULTY','FINAL SCORE']
#     table.rows << [score.user.user_name, score.category.name, score.difficulty.name, score.last_score]
#     puts table
#  end