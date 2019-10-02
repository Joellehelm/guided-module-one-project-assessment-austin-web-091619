class User < ActiveRecord::Base
    has_many :scores 

    def my_scores
        my_score = Score.all.select{|score| score.user.id == 3}
        table = Text::Table.new
        table.head = ['USERNAME', 'CATEGORIES PLAYED', 'DIFFICULTY', 'FINAL SCORE']
        my_score.each do |score|
            table.rows << [score.user.user_name, score.category.name, score.difficulty.name, score.last_score]
        end
        puts table
    end
end
