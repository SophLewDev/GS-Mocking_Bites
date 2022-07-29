class InteractiveCalculator
  def initialize(io)
    @io = io
  end
  def run
    @io.puts "Hello. I will subtract two numbers."
    @io.puts "Please enter a number"
    number_1 = integer?(@io.gets.chomp)
    @io.puts "Please enter another number"
    number_2 = integer?(@io.gets.chomp)
    @io.puts "Here is your result:"
    @io.puts "#{number_1} - #{number_2} = #{number_1 - number_2}"
  end

  def integer?(number)
    p number
    return number.to_i if number.to_i.to_s == number
    fail "This is not a number"
  end
end

# interactive_calculator = InteractiveCalculator.new(Kernel)
# interactive_calculator.run