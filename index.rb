require 'colorize'
require 'json' #gem install json

#=======================
def print_welcome()
  puts "=========================".colorize(:color => :light_blue)
  puts "Welcome to the main menu".colorize(:color => :light_blue)
  puts "=========================".colorize(:color => :light_blue)
  sleep(2)
  puts
  puts "There are four options within this menu. Please select one of the following:".colorize(:color => :green)
  puts
  sleep(2)
  puts "-New data entry- To enter a new budget entry please type 'new' or 'n' into the terminal".colorize(:color => :green)
  puts
  puts "-View goal trajectory- To calculate the amount of time to reach a savings goal please type 'goal' or 'g' into the terminal".colorize(:color => :green)
  puts
  puts "-View budget history- To view your previous data entries please type 'view' or 'v' into the terminal".colorize(:color => :green)
  puts
  puts "Enter 'E' or 'exit' at any time to quit the application.".colorize(:color => :green)
  print    "● ".colorize(:color => :red)
end

def create_new_account
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

def create_new_entry
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
end

def view_history()
  file = File.read('filehistory.json')
  data_array=JSON.parse(file)
  data_array.each do |element|
  end
end

def calculate_goal()
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
end

def login()
  puts "Welcome to the budgeting planner application. What is your name"
  name = STDIN.gets.chomp
  file = File.read('filehistory.json')
  data_array=JSON.parse(file)
  data_array.each do |element|
    if element['name'] == name
      puts "Welcome back".colorize(:color => :yellow)
      return true
    end
  end
  return false
end
#=======================
while true
  logged_in = login()
  puts logged_in

  if logged_in
    print_welcome()

    menu_input = gets.chomp.downcase

    if menu_input == 'n' || menu_input == 'new'
      create_new_entry()
      
    elsif menu_input == 'g' || menu_input == 'goal'
      calculate_goal()

    elsif menu_input == 'v' || menu_input == 'view'
      view_history()

    elsif menu_input == 'e' || menu_input == 'exit'
      exit
    end
  else
    create_new_account()
  end
end