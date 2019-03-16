require "restaurant"
require "customer"

describe Restaurant do

  it "We are able to make a restaurant" do
    restaurant = Restaurant.new()
  end
  describe "# ask_order" do
    it "We can ask order from the customers." do
      restaurant_double = double(menue: "abc")
      customer_double = double()
      messages_double = double()
      client_double = double(messages: messages_double)
      twilio_class_double = double(new: client_double)
      expect(messages_double).to receive(:create)
      expect(customer_double).to receive(:phone_number)
      subject.ask_order(restaurant_double,customer_double, twilio_class_double)
    end
  end

  describe "#check order" do
    it "An error is raised when the sum of dishes is not equal to the sum of dishes ordered." do
      expect { subject.check_order("1,meat dish,2,vegeterian dish,4") }.to raise_error("Sum of dishes is not correct")
    end

    it "Does not show an error when the sum of the dishes is equal to the sum of dishes ordered" do
      expect { subject.check_order("1,meat dish,2,vegeterian dish,3") }.not_to raise_error
    end
  end

  describe "#confirmation_sending" do
    it "Sends a message to me when I make a correct order" do
      order_string_double = double()
      customer_double = double()
      message_double = double()
      client_double = double(messages: message_double)
      twilio_class_double = double(new: client_double)
      expect(message_double).to receive(:create)
      expect(customer_double).to receive(:phone_number)
      expect(subject).to receive(:check_order).with(order_string_double)
      subject.confirmation_sending(customer_double, order_string_double, twilio_class_double)
    end
  end
  describe "We can take the order message from a restaurant" do
    it "We can take the order message from a restaurant" do
      message_double = double()
      restaurant_double = double(menue: message_double)
      restaurant = Restaurant.new()
     a ="Please submit your order from the menu below.#{message_double}
    Please write your order in the following format:
    Quanitity of the dish, name of the dish, sum of dishes.
    e.g. 1, meat dish, 2, pesceterian dish, 3 "
      expect(restaurant.order_taking_message(restaurant_double)).to eq a
    end
  end
end
