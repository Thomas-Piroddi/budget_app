#!/usr/bin/env ruby
require 'argv'
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
    puts "Please re-enter your name"
    name = gets.chomp
    hash = {name: "#{name}", saving: "#{saving}"}
    puts 'Account created! Please log in.'
   
    file = File.read('filehistory.json')

    working = JSON.parse(file)

    working.push(hash)

    File.open('filehistory.json', "w") do |f|
        f.write(working.to_json)
    end

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
    puts element
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

argv_info = ARGV.map{|i| i}
ARGV.clear
if argv_info.include? "-info"
  print " Hello and welcome to the help file. This information aims to help you operate the application to its' maximum potential. The program is very simple and the initial questions will only require a numerical input without any symbols or characters.

   Errors will be handled by the program in the form of ErrorMessage prompts, and these will only appear when the user enters an invalid input. These are usually in the form of non-numerical inputs. The program will inform the user that their answer was invalid, and will prompt them to answer the question once again. This loop will continue until until the user input is valid.
  
   The program will initally take your weekly income. This is for the purpose of calculating how much money you're brin ging in each week. The program will then take your expenditure to calculate whether you were in a surplus or a deficit that week. 
  
   Provided you've never used the application before, it will then direct you to the main menu (It is important to note that if you've previously used the application and there is a file present, you can go straight to the main menu). From here you can choose to create a goal trajectory. That is to enter the price of a certain goal you had in mind (for example, a $1000 phone). If you were in a surplus that week, the program will take your figure and print out the amount of full days (rounded up) that it will take to save up for your goal.
  
   There is a view budget history option that allows you to check previous budget entries along with their time slot entries.
  
   There is also an option to enter a new weekly budget, which will run you through the two inital questions again. This can be done if you wanted to enter a new set of data or create a hypothetical saving plan.
  
   The final option will be to exit the application, which will quit the terminal. If you wish to re-use the application you will have to run it from the terminal again."
end