class Track
  def initialize(title, artist)
    @title = title
    @artist = artist
  end

  def title
    @title
  end
  
  def artist
    @artist
  end

  def matches?(keyword)
    @title.include?(keyword) || @artist.include?(keyword)
  end
end