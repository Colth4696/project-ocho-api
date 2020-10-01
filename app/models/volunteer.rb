class Volunteer < ApplicationRecord
    belongs_to :users, class_name: "User"
end
