class CreateDifficultys < ActiveRecord::Migration[5.2]

    def change
        create_table :difficultys do |t|
            t.string :name
        end
    end
end