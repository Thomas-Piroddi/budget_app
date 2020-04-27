puts "Please enter your name"
name = gets.chomp.capitalize
puts "Hello #{name} and welcome to your weekly budgeting planner! The aim of this application is to assist you in being the best saver you can be. Please enter an accurate numerical answer to all the following questions and press enter to progress."

while true
  puts "Enter your weekly income"
  i = gets
  i = i.to_f
  puts "Enter your weekly expenditure"
  e = gets
  e = e.to_f
  begin
    if	i == 0.0
      system 'clear'
      raise ArgumentError, '"Please enter a numerical value only. Try again!"'
    end
    if	e == 0.0
      system 'clear'
      raise ArgumentError, '"Please enter a numerical value only. Try again!"'
    end
    break

  rescue ArgumentError => e
    puts "#{e.class}: #{e.message}"
  end   
end

s = i - e
puts "Your weekly deficit/surplus was #{s}"

##trajectory beneath
puts "How much does the @goal you're saving for cost?"
c = gets
c = c.to_f
g = c / (s / 7)
g = g.round(0)
print "It will take you #{g} days to save for this goal!"