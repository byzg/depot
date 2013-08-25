class PayType < ActiveRecord::Base
  attr_accessible :name
  validate :name, presents: true, uniqueness: true
  has_many :orders
end
