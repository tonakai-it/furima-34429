class Room < ApplicationRecord
  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users, validate: false
  has_one :ex_price, dependent: :destroy
  has_many :chats, dependent: :destroy
end
