require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Trixie") }
  let(:blondie) { Dessert.new("blondie", 5, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(blondie.type).to eq("blondie")
    end


    it "sets a quantity" do
      expect(blondie.quantity).to eq (5)
    end

    it "starts ingredients as an empty array" do
      expect(blondie.ingredients).to eq ([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect {Dessert.new("potato candy", "oodles", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      blondie.add_ingredient("blueberries")
      expect(blondie.ingredients).to include("blueberries")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
    #     blondie.mix!
    #     expect(blondie.ingredients)to eq(blondie.ingredients.shuffle)   #nope nope nope
      ingredients = ["eggs", "vanilla", "chocolate chips", "butter", "flour", "sugar"]

      ingredients.each do |ingredient|
        blondie.add_ingredient(ingredient)
      end

      expect(blondie.ingredients).to eq(ingredients)
      blondie.mix!
      expect(blondie.ingredients).not_to eq(ingredients)
      expect(blondie.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      blondie.eat(1)
      expect(blondie.quantity).to eq(4)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { blondie.eat(6)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Trixie the Great Baker")
      expect(blondie.serve).to eq("Chef Trixie the Great Baker has made 5 blondies!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do  #does not even remotely feel intuitive
      expect(chef).to receive(:bake).with(blondie)
      blondie.make_more
    end
  end
end
