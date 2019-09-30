class DropDifficultys < ActiveRecord::Migration[5.2]
    def change
        drop_table :difficultys
    end
end