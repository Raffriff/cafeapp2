class Order < ActiveRecord::Base
  belongs_to :profile
  has_many :order_items
end
