class Restaurent
  attr_reader :list
  def initialize(list = {})
    @list = list
  end

  def add(food,price)
    @list[food] = price
  end

  def deleting(food)
    @list.delete(food)
  end
end
