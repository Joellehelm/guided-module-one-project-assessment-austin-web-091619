require_relative '../config/environment'

user_my_scores = User.find_by(user_id = "3")
user_my_scores.last_score_game