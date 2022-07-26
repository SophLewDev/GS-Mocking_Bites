require "diary"

RSpec.describe Diary do
  it "returns the contents of diary" do
    diary = Diary.new("Contents")
    expect(diary.read).to eq "Contents"
  end
end