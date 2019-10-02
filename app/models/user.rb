class User < ActiveRecord::Base
    has_many :scores 

    # def my_scores
    #     my_score = Score.all.select{|score| score.user.id == $logged_in}
    #     table = Text::Table.new
    #     table.head = ['USERNAME', 'CATEGORIES PLAYED', 'DIFFICULTY', 'FINAL SCORE']
    #     my_score.each do |score|
    #         table.rows << [score.user.user_name, score.category.name, score.difficulty.name, score.last_score]
    #     end
    #     puts table
    # end
    
    def delete_account
        self.destroy
    end

    # def self.last_game_score(newscore)
    #     lastscore = newscore
    #     my_score = Score.all.select{|score| score.user.id == $logged_in}
    #     lastscore[-1]
    #     table = Text::Table.new
    #     table.head = ['USERNAME', 'CATEGORIES PLAYED', 'DIFFICULTY','FINAL SCORE']
    
    #     table.rows << [lastscore.user.user_name, lastscore.category.name,lastscore.difficulty.name, lastscore.last_score]
    #     puts table
    # end
    # def self.last_game_score
    #     last_score = []
    #     my_score = Score.all.select{|score| score.user.id == $logged_in}
    #     last_score << my_score[-1]
    #     table = Text::Table.new
    #     table.head = ['USERNAME', 'CATEGORIES PLAYED', 'DIFFICULTY','FINAL SCORE']
    #     table.rows << [last_score[0].user.user_name, last_score[0].category.name,last_score[0].difficulty.name, last_score[0].last_score]
    #     puts table
    # end

    # def final_score
    #     current =  Score.where(["user_id = ?", "3"]).last
    #     table = Text::Table.new
    #     table.head = ['USERNAME', 'CATEGORIES PLAYED', 'DIFFICULTY','FINAL SCORE']
    #     table.rows << [current.user.user_name, current.category.name, current.difficulty.name, current.last_score]
    #     puts table
    # end 

    def final_score
        score =  Score.where(["user_id = ?", $logged_in.to_s]).last
        table = Text::Table.new
        table.head = ['USERNAME', 'CATEGORIES PLAYED', 'DIFFICULTY','FINAL SCORE']
        user_name = score.user.user_name
        category = score.category.name
        table.rows << [user_name, category, score.difficulty.name, score.last_score]
        puts table
    end 
  
end

