class DropCategorys < ActiveRecord::Migration[5.2]
    def change
        drop_table :categorys
    end
end