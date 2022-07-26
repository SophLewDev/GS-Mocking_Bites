require "diary"
require "secret_diary"

RSpec.describe "integration test" do
  it "returns the diary contents if diary is unlocked" do
    diary = Diary.new("Contents")
    secret_diary = SecretDiary.new(diary)
    secret_diary.unlock
    expect(secret_diary.read).to eq "Contents"
  end
  
  it "fails if the diary contents are locked" do
    diary = Diary.new("Contents")
    secret_diary = SecretDiary.new(diary)
    expect { secret_diary.read }.to raise_error "Go away!"
  end
    
  context "unlocks and then locks again" do
    it "cannot read and return contents" do
      diary = Diary.new("Contents")
      secret_diary = SecretDiary.new(diary)
      secret_diary.unlock
      secret_diary.lock
      expect { secret_diary.read }.to raise_error "Go away!"
    end
  end
end