require "string_repeater"

RSpec.describe StringRepeater do
  it "repeat a given string a given many times" do
    io = double :io
    expect(io).to receive(:puts).with("Hello. I will repeat a string many times.").ordered
    expect(io).to receive(:puts).with("Please enter a string").ordered
    expect(io).to receive(:gets).and_return("TWIX")
    expect(io).to receive(:puts).with("Please enter a number of repeats").ordered
    expect(io).to receive(:gets).and_return("10")
    expect(io).to receive(:puts).with("Here is your result:").ordered
    expect(io).to receive(:puts).with("TWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIXTWIX")
    string_repeater = StringRepeater.new(io)
    string_repeater.run
  end

  it "fails if user provides word instead of number for 'enter a number'" do
    io = double :io
    expect(io).to receive(:puts).with("Hello. I will repeat a string many times.").ordered
    expect(io).to receive(:puts).with("Please enter a string").ordered
    expect(io).to receive(:gets).and_return("TWIX")
    expect(io).to receive(:puts).with("Please enter a number of repeats").ordered
    expect(io).to receive(:gets).and_return("chocolate")
    string_repeater = StringRepeater.new(io)
    expect {  string_repeater.run }.to raise_error "This is not a number"
  end
end