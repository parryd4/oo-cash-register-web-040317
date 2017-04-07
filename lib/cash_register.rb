class CashRegister
  attr_accessor :total, :discount, :items

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quant=1)
    @total += (price*quant)
    @most_recent = [title, price*quant]
    quant.times {@items << title }
  end

  def apply_discount
    if discount == 0
      "There is no discount to apply."
    else
      @total = @total * (100 - discount)/100
      "After the discount, the total comes to $#{@total}."
    end
  end

  def void_last_transaction
    @total -= @most_recent[1]
    @items = @items.slice(0..@items.length-1)
  end
end
