while true
  puts "========================="
  puts "Welcome to the main menu"
  puts "========================="
  sleep(1)
  puts
  puts "There are four options within this menu. Please select one of the following:"
  puts
  sleep(1)
  puts "-New data entry- To enter a new budget entry please type 'new' or 'n' into the terminal"
  puts
  puts "-View goal trajectory- To calculate the amount of time to reach a savings goal please type 'goal' or 'g' into the terminal"
  puts
  puts "-View budget history- To view your previous data entries please type 'view' or 'v' into the terminal"
  puts
  puts "Enter 'E' or 'exit' at any time to quit the application."
  print    "● "

  menu_input = gets.chomp.downcase

  if menu_input == 'n' || menu_input == 'new'

    while true
      puts
      puts "Enter your weekly income"
      income = gets.chomp()
      income_float = income.to_f
      puts "Enter your weekly expenditure"
      expenditure = gets.chomp()
      expenditure_float = expenditure.to_f

      begin
        if  income_float == 0.0 || expenditure_float == 0.0
          system 'clear'
          raise ArgumentError, '"Please enter a numerical value only. Try again!"'
        end
        saving = income_float - expenditure_float
        puts "Your weekly deficit/surplus was #{saving}"
        break
      rescue ArgumentError => e
        puts "#{e.message}"
      end
    end

    
  elsif menu_input == 'g' || menu_input == 'goal'

    while true
      puts
      puts "How much does the goal you're saving for cost?"
      cost = gets.chomp
      cost_float = cost.to_f
      puts "How much was your weekly saving?"
      saving = gets.chomp
      saving_float = saving.to_f

      begin
        if cost_float == 0.0 || saving_float == 0.0
          system 'clear'
          raise ArgumentError, '"Please enter a numerical value only. Try again!"'
        end
        goal = (cost_float / (saving_float / 7.0)).to_i
        print "It will take you #{goal} days to save for this goal!"
        break
      rescue ArgumentError => e
        puts "#{e.message}"
      end
    end

  elsif menu_input == 'v' || menu_input == 'view'
    puts "boog"
  

  elsif menu_input == 'e' || menu_input == 'exit'
    exit
  end
end