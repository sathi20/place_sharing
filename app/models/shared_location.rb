class SharedLocation < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, foreign_key: :friend_id, class_name: User
  belongs_to :location

  validates_presence_of :friend, :user, :location
end
