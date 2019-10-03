class Score < ActiveRecord::Base
    belongs_to :user
    belongs_to :category
    belongs_to :difficulty
        

    #   def self.my_scores
    #     my_score = Score.where(["user_id = ?", "#{$logged_in}"])
    #     table = Text::Table.new
    #     table.head = ['USERNAME', 'CATEGORIES PLAYED', 'DIFFICULTY', 'FINAL SCORE']
    #     my_score.each do |score|
            
    #         table.rows << [score.user.user_name, score.category.name, score.difficulty.name, score.last_score]
    #     end
    #     puts table
    # end
end
