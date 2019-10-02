class User < ActiveRecord::Base
    has_many :scores
    
    def delete_account
        self.destroy
    end
  
end

