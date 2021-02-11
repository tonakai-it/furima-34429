class Item < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_one_attached :item_image

  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :category, dependent: :destroy
  has_one :status, dependent: :destroy
  has_one :shipping_fee, dependent: :destroy
  has_one :send_from,  dependent: :destroy
  has_one :shipping_days, dependent: :destroy

  with_options presence: true do
    validates :name, length:{ maximum: 40 }
    validates :item_image
    validates :introduction, length: { maximum: 1000 }
    validates :price, format: { with: /\A[0-9]+\z/, message: "Half-width number" }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Is in incorrect range"} 
    with_options numericality: { other_than: 1, message: "Should be selected" } do
      validates :category_id
      validates :status_id
      validates :shipping_fee_id
      validates :send_from_id
      validates :shipping_days_id
    end
  end
end