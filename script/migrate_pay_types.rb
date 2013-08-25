PayType.transaction do
  Order::PAYMENT_TYPES.map {|pt| PayType.create(name: pt) unless PayType.where(name: pt).exists?}
  #Order.select(:pay_type_id).update_all(pay_type_id: PayType.first.id)
end