class Diary < Struct.new(:contents)
  def read
    @contents = contents
  end
end