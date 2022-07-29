require "interactive_calculator"

RSpec.describe InteractiveCalculator do
  it "substract one number from another" do
    io = double :io
    expect(io).to receive(:puts).with("Hello. I will subtract two numbers.").ordered
    expect(io).to receive(:puts).with("Please enter a number").ordered
    expect(io).to receive(:gets).and_return("4")
    expect(io).to receive(:puts).with("Please enter another number").ordered
    expect(io).to receive(:gets).and_return("3")
    expect(io).to receive(:puts).with("Here is your result:").ordered
    expect(io).to receive(:puts).with("4 - 3 = 1").ordered
    interactive_calculator = InteractiveCalculator.new(io)
    interactive_calculator.run 
  end
  it "fails if user doesn't give a number for number_1" do
    io = double :io
    expect(io).to receive(:puts).with("Hello. I will subtract two numbers.").ordered
    expect(io).to receive(:puts).with("Please enter a number").ordered
    expect(io).to receive(:gets).and_return("chocolate")
    interactive_calculator = InteractiveCalculator.new(io) 
    expect { interactive_calculator.run }.to raise_error "This is not a number"
  end
  it "fails if user doesn't give a number for number_2" do
    io = double :io
    expect(io).to receive(:puts).with("Hello. I will subtract two numbers.").ordered
    expect(io).to receive(:puts).with("Please enter a number").ordered
    expect(io).to receive(:gets).and_return("4")
    expect(io).to receive(:puts).with("Please enter another number").ordered
    expect(io).to receive(:gets).and_return("chocolate")
    interactive_calculator = InteractiveCalculator.new(io) 
    expect { interactive_calculator.run }.to raise_error "This is not a number"
  end
end