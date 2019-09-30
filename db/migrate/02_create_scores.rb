class CreateScores < ActiveRecord::Migration[5.2]

    def change
        create_table :scores do |t|
            t.integer :user_id
            t.integer :category_id
            t.integer :difficulty_id
            t.integer :type_id
            t.integer :last_score
        end
    end
end