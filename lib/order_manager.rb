# require_relative "./customer.rb"
require "twilio-ruby"
require "time"

class Order_manager
  # In order to apply security when using the twilo library for sending
  # messages to customers, we save the NUMBER, SID and TOKEN of Twilio
  # as environment variables.
  TWILIO_NUMBER = ENV['TWILIO_NUMBER']
  TWILIO_TOKEN = ENV['TWILIO_TOKEN']
  TWILIO_SID = ENV['TWILIO_SID']

  def initialize
  end

  def ask_order(restaurant, customer, twilio_class = Twilio::REST::Client)
    client = twilio_class.new(TWILIO_SID, TWILIO_TOKEN)
    client.messages.create(from: TWILIO_NUMBER, to: customer.phone_number(),
    body: order_taking_message(restaurant)
    )
  end

  def check_order(order_string)
    order_split = order_splitting(order_string)
    order_numbers = order_number_array(order_split)
    correct_sum?(order_numbers)
  end

  def confirmation_sending(customer, order_string, twilio_class = Twilio::REST::Client)
    check_order(order_string)
    client = twilio_class.new(TWILIO_SID, TWILIO_TOKEN)
    client.messages.create(from: TWILIO_NUMBER, to: customer.phone_number(),
    body: confirmation_message
    )
  end

  def order_taking_message(restaurant)
    "Please submit your order from the menu below.#{restaurant.menue}
    Please write your order in the following format:
    Quanitity of the dish, name of the dish, sum of dishes.
    e.g. 1, meat dish, 2, pesceterian dish, 3 "
  end
  private
  def order_splitting(order_string)
    order_string.split(",")
  end

  def order_number_array(order_array)
    ar = []
    i = 0
    while i <= order_array.length
      ar.push(order_array[i].to_i)if (i%2).zero?
      i += 1
    end
    return ar
  end

  def confirmation_message(time_class = Time)
    "Thank you! Your order was placed and will be delivered before #{time_class.new().hour+1}:#{time_class.new().min} "
  end

  def correct_sum?(order_numbers)
    raise "Sum of dishes is not correct" if order_numbers[0..(order_numbers.length - 2)].sum != order_numbers.last
  end
end
