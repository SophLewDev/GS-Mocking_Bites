require "track"

RSpec.describe Track do
  it "returns title and artist of track" do
    track = Track.new("title", "artist")
    expect(track.title).to eq "title"
    expect(track.artist).to eq "artist"
  end
  it "returns true if the keyword matches either the title or artist" do
    track = Track.new("title", "artist")
    expect(track.matches?("title")).to eq true
  end
  it "returns false if neither the title or artist include the keyword" do
    track = Track.new("title", "artist")
    expect(track.matches?("apple")).to eq false
  end
end