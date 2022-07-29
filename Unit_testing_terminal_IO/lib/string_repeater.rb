class StringRepeater
  def initialize(io)
    @io = io
  end

  def run
    @io.puts "Hello. I will repeat a string many times."
    @io.puts "Please enter a string"
    word = @io.gets.chomp
    @io.puts "Please enter a number of repeats"
    number = integer?(@io.gets.chomp)
    @io.puts "Here is your result:"
    @io.puts "#{word * number.to_i}"
  end

  def integer?(number)
    return number.to_i if number.to_i.to_s == number
    fail "This is not a number"
  end

end

# string_repeater = StringRepeater.new(Kernel)
# string_repeater.run