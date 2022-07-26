require "music_library"
require "track"

RSpec.describe "Integration tests" do
  it "returns all of the tracks added" do
    library = MusicLibrary.new
    track_1 = Track.new("title_1", "artist_1")
    track_2 = Track.new("title_2", "artist_2")
    library.add(track_1)
    library.add(track_2)
    expect(library.all).to eq [track_1, track_2]
  end
  it "returns tracks that include the dearched keyword" do
    library = MusicLibrary.new
    track_1 = Track.new("title_1", "artist_1")
    track_2 = Track.new("title_2", "artist_2")
    library.add(track_1)
    library.add(track_2)
    expect(library.search("title_2")).to eq [track_2]
  end
end