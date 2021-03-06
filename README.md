# In this project, we will try to write a program for handling the takeaway order for a restaurant.

<img src="./Model.png" />



The procedure is that we receive a message from the restaurant which shows us the dishes and their price of the restaurant.

we will send back a message to the restaurant which includes the number of each dish we want, the dish name and a number at the end of the order showing the sum of the dishes we have ordered.(eg "1, burger, 2, fish, 3")

The message sent as the order, is first tested to check if the sum number at the end is equal to the sum of the number of dishes.

If it is not equal, an error will be raised, otherwise a message will be sent to the customer saying that your order was confirmed and you will get the food in an hour from the ordering time.

The Feature tests of our modelling will be written in irb:

At first, we should be able to create a customer with a phone number.

```irb ```

```require "./lib/customer.rb"```

```customer = Customer.new(1234)```

In the next step, we must be able to make a restaurant.

```require "./lib/restaurent.rb"```

```restaurant = Restaurent.new()```

In the next step, we should be able to add a food with its price to the
restaurant's object and we can  see the restaurant's list of foods.

```require "./lib/restaurent.rb"```

```restaurant = Restaurent.new()```

```restaurant.add("green dish","20")```

```restaurant.list() ```

In the next step, we should be able to define an order_manager.

```require "./lib/order_manager.rb" ```

```order_manager = Order_manager.new()```

In the next step, the order_manager should send a message to the customer and send
the list of restaurant menu to the customer.

```order_manager.ask_order(restaurant, customer)```


1. My twilio phone number, my phone number, my twilio account_sid and my twilio auth_token are saved as environment variables to be secure for github publishing.
2. I am making a free Twilio account, so I am able to send message to myself only, so my phone number which is already saved as an instance variable is used to make a new customer.

so the next feature test will be the below thing:

```require "./lib/customer.rb"```

```customer = Customer.new(ENV['MY_NUMBER'])```

```require "./lib/restaurent.rb"```

```restaurant = Restaurent.new()```

```restaurant.add("green dish","20")```

```require "./lib/order_manager.rb"```

```order_manager = Order_manager.new()```

```order_manager.ask_order(restaurant, customer)```

After using the above commands in irb, I am supposed to receive a message on my phone, Asking me about the order I want to make. so, we command the code in "irb" to see what happens.

After the previous steps, we suppose we have the order of a customer in a string including the number of each dish, name of dish, and finally the sum of the number of all dishes e.g. 1, meat dish, 2, pesceterian, 3. at first, we want an error when the sum of the dishes is not correct. so, as a feature test in irb, we will have the following:

```require "./lib/customer.rb"```

```customer = Customer.new(ENV['MY_NUMBER'])```

```require "./lib/restaurent.rb"```

```restaurant = Restaurent.new()```

```restaurant.add("green dish","20")```

```restaurant.add("meat dish","25")```

```restaurant.add("red dish", "30")```

```require "./lib/order_manager.rb"```

```order_manager = Order_manager.new()```

```order_manager.confirmation_sending(restaurant,"1,green dish,2,meat dish,5")```


Now, we want to send a message to a customer and say the order was placed and the food will be delivered in 1 hour from now.

```require "./lib/customer.rb"```

```customer = Customer.new(ENV['MY_NUMBER'])```

```require "./lib/order_manager.rb"```

```restaurant = Order_manager.new()```

```require "./lib/restaurent.rb"```

```restaurant = Restaurant.new()```

```restaurant.add("green dish","20")```

```restaurant.add("meat dish","25")```

```restaurant.add("red dish", "30")```

```order_manager.confirmation_sending(customer,  "1, meat dish, 4, pesceterian, 5")```

After the above commands done on the irb, I should receive a message telling that my order was placed and it will be delivered in an hour.

Challenge
==================
```
                            _________
              r==           |       |
           _  //            |  M.A. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

Instructions
-------

* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Task
-----

* Fork this repo
* Run the command 'bundle' in the project directory to ensure you have all the gems
* Write a Takeaway program with the following user stories:

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```

* Hints on functionality to implement:
  * Ensure you have a list of dishes with prices
  * Place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
  * The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
  * Use the twilio-ruby gem to access the API
  * Use the Gemfile to manage your gems
  * Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
  * However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent
  * Note that you can only send texts in the same country as you have your account. I.e. if you have a UK account you can only send to UK numbers.

* Advanced! (have a go if you're feeling adventurous):
  * Implement the ability to place orders via text message.

* A free account on Twilio will only allow you to send texts to "verified" numbers. Use your mobile phone number, don't worry about the customer's mobile phone.

* **WARNING** think twice before you push your mobile number or any private details to a public space like Github. Now is a great time to think about security and how you can keep your private information secret. You might want to explore environment variables.

* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am


In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.

Notes on Test Coverage
------------------

You can see your [test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) when you run your tests.
