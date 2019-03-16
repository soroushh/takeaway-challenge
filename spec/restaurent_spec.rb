require "restaurent.rb"

describe Restaurent do
  before(:each) do
    @restaurent = Restaurent.new()
  end
  it "we can make a restaurent and its menue is empty by default" do
    a = {}
    expect(@restaurent.list).to eq a
  end
  it "We can add a food with its price to the menue" do
    @restaurent.add("green dish","20")
    list = {"green dish"=>"20"}
    expect(@restaurent.list).to eq list
  end

  it "We can delete a food from menue" do
    @restaurent.add("green dish","20")
    @restaurent.deleting("green dish")
    a= {}
    expect(@restaurent.list).to eq a
  end
end
