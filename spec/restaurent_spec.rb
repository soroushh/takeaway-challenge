require "restaurent.rb"

describe Restaurent do
  before(:each) do
    @restaurent = Restaurent.new()
  end
  it "we can make a restaurent and its menue is empty by default" do
    a = {}
    expect(@restaurent.list).to eq a
  end
end
