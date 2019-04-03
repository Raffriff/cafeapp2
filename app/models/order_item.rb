class OrderItem < ActiveRecord::Base
  belongs_to :order
  has_many :menu_items
end
