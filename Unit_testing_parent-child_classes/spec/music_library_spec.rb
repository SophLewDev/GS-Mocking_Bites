require "music_library"

RSpec.describe MusicLibrary do
  it "returns a list of all tracks" do
    library = MusicLibrary.new
    fake_track_1 = double :track
    fake_track_2 = double :track
    library.add(fake_track_1)
    library.add(fake_track_2)
    expect(library.all).to eq [fake_track_1, fake_track_2]
  end
  it "returns the tracks that include the given keyword" do
    library = MusicLibrary.new
    fake_track_1 = double :track, matches?: nil #Track.new("title_1", "artist_1")
    fake_track_2 = double :track, matches?: self #Track.new("title_2", "artist_2")
    library.add(fake_track_1)
    library.add(fake_track_2) 
    expect(library.search("There")).to eq [fake_track_2]
  end
end


# class FakeTrackSearchKeywordTrack2
#   def matches?(keyword)
#     return self #[fake_track_2]
#   end
# end

# class FakeTrackSearchKeywordTracknil
#   def matches?(keyword)
#     return nil
#   end
# end