class Order < ActiveRecord::Base
  PAYMENT_TYPES = [ "Check", "Credit card", "Purchase order" ]

  attr_accessible :address, :email, :name, :pay_type_id

  has_many :line_items, dependent: :destroy
  belongs_to :pay_type
  delegate :name, to: :pay_type, prefix: true

  validates :name, :address, :email, presence: true
  #validates :pay_type_id, inclusion: PayType.pluck(:id)

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

end
