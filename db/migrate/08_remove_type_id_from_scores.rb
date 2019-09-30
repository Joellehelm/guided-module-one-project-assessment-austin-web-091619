class RemoveTypeIdFromScores < ActiveRecord::Migration[5.2]
    def change
        remove_column :scores, :type_id, :integer
    end
end