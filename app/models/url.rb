class Url < ApplicationRecord
  validates_presence_of :long, message: "URL can't be blank"
  validates :short, presence: true
  validates :user_id, presence: true
  validates :visits, presence: true
end
