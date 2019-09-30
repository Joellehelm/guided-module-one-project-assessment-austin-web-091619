class Score < ActiveRecord::Base
    has_one :users
    has_one :categorys
    has_one :difficultys
end