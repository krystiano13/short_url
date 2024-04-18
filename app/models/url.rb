class Url < ApplicationRecord
  validates :long, presence: true
  validates :short, presence: true
  validates :user_id, presence: true
  validates :visits, presence: true
end
