# Software development plan

## T1A2-1, 2, 3, 4

---

### Statement of Purpose and Scope

1. This app is designed to help the user plan a weekly budget and monitor their savings. The program will receive user input of their monetary income along with how much they’re spending per week on categorised necessities and wants. The program will then output strategies and solutions that aim to help the user sort out their spendings and increase saving where needed.
2. The ever-present problem for the modern day person, particularly those studying with hefty workloads, is juggling their finances and housing situations. Many people struggle with finding the right balance of spending/saving and this can be largely attributed to not having the right resources/long term goals. The app aims to be a useful resource for the user to solve the issue of over-spending and provide an incentive for saving. I’m developing this application because I personally could use something like this each day and although it isn’t revolutionary it’s a simple concept that can be very practical.
3. The target audience is the vast majority of our cohort, along with the general populace. The flexibility of the application is that it doesn’t cater to a specific financial demographic. The app can be used by anyone with a cash flow who plans to save, with short/long term goals accounted for.
4. A member of the target audience will be asked by the program to enter various details on their spending. They will also have the option to enter a “goal” of theirs, for example a new phone ($800). The application will output a trajectory of their spending and give the user a realistic idea of how long it would take for them to save up and purchase this “goal” taking into account all their spending and intended savings. The app isn’t designed for a singular use either, and it can always be revisited if the users financial situation/saving goals change.

### Key features

## Feature 1: View budget history 

The user will be able to, provided they've used the application before, see their budget history. They will be able to see the income and expenditure of previous weeks along with their accompanied dates. These past results will be stored in a JSON file, saved as previousbudget.JSON *(,)* ----- *(class.rb, line 18)*

To display these features the program will parse information from previousbudget.JSON, converting these to a variable. This is then looped through, displaying them as neatly-formatted strings. *(,)*) -----*(index.rb, line 138)*

If these Json files are either corrupted or empty they will be re-initialized for use. *(,)* ------ *(class.rb, lines 20 & 37)*

## Feature 2: Operational information

This feature is in plce to accomadate any confusion the user might be having with the application. This feature will include information such as instructions on how to operate the application and the general purpose of the application for the user. It will also include how the application deals with error handling, empty input, and backup data storage.

The user can access the operational information by typing the following into the terminal:
ruby weekly_budget_planner.rb -info

There's an if statement located in weekly_budget_planner.rb that asks if ARGV is equal to "-info", and if so it will print out the assistance messages to the screen. Following this the application is terminated, and if the user wishes to access the application again they must call it in the terminal without the -info argument (the user will be informed of this within the "-info" message).

## Feature 3: Budget information questions

This feature will print two questions to the screen, asking the user for their weekly income and weekly expenditure. The application will recieve the user's input and pass it through a loop to ensure the input was valid. As the questions can only be answered with a numerical response, anything other than a number will print a simple error message for the user and ask for the question to be answered again.


## Feature 4: The user can calculate their goal trajectory. ------------COME BACK TO DIS ONE 

very simple feature-uses x, y and z to calc user input = $, figure out weekly saving, then divide by 7 to get days, then figure out how many days of saving till you reach your goal. ez gg go next pepega kappa clap

### User Interaction and Experience

The user interacts in a smooth and simple fashion with the application. Once the application has been called there is an option for the user to pass the "-info" argument (ruby weekly_budget_planner.rb -info).

As previously mentioned, this will print the instructions on how to operate the application along with the applications purpose for the user. The messages will help the user understand the order of the questions they're being asked, how the application handles errors, and how the user will make their way through the application.

When the application is passed normally the user will be asked to enter their full name and greeted with a welcoming message. The message is a brief description of the application and instructions on how to use it correctly.

"Hi user_full_name, welcome to your weekly budgeting planner! The aim of this application is to assist you in being the best saver you can be."

"Please enter an accurate numerical answer to all the following questions and press enter to progress. Are you ready to begin? (Please press enter to continue"

Once this is printed the user will be prompted to press enter which will display the first question. This will be a text string asking the user to enter their response. The user will only have to enter a number and not any hashes or symbols ($). The process is simple and the first question is displayed below.

    Please enter your weekly income.

    Users answer: numerical_input

Once the user enters this number they can press enter and the application will pass them their next question.

Like with any application, there will be confusion amongst the users and in turn there will be incorrectly entered answers. As the user can freely type any characters into the termonal, and if/elsif/else statement has been included to ensure the corret answer is entered. The if and elsif statements will correspond with input that is valid. As it is a financial budgeter it is important to note that 0, as in $0, is a valid answer to the questions. Any input that contains any character other than a number will be deemed invalid and handled by the else statement, which will print a statement detailed that the answer was invalid and that they need to enter a number that corresponds accordingly to the question. The previous question will then be displayed again and the user will have the opportunity to re-enter an answer.

The error message for incorrectly entered input will remain consistent throughout the application, and is displayed below:

    "Sorry, but the application does not recognise that answer as a valid number. Please enter a new number without any accompanying symbols or characters."

Once the user enters a valid number the response will be saved and the next question will be printed to the screen. This if/elsif/else statement will continually loop until every question has been answered correctly.


This is the end of the application.  ??????????????????????????? <==== not the end of app

COME BACK TO THIS  WITH HOW TO USE THE GOAL OPTION ALONG WITH VIEWING THEIR HISTORY.



#### _Error Handling - Backup Data Storage & Empty-Input checks_
- All input fields outside of the quiz section require a text input - If none is found, the application will loop back and request again.
### User Interaction and Experience


test





FAQ file

Hello and welcome to the help file. This information aims to help you operate the application to its' maximum potential. The program is very simple and the initial questions will only require a numerical input without any symbols or characters.

Errors will be handled by the program in the form of ErrorMessage prompts, and these will only appear when the user enters an invalid input. These are usually in the form of non-numerical inputs. The program will inform the user that their answer was invalid, and will prompt them to answer the question once again. This loop will continue until until the user input is valid.

The program will initally take your weekly income. This is for the purpose of calculating how much money you're brin ging in each week. The program will then take your expenditure to calculate whether you were in a surplus or a deficit that week. 

Provided you've never used the application before, it will then direct you to the main menu (It is important to note that if you've previously used the application and there is a file present, you can go straight to the main menu). From here you can choose to create a goal trajectory. That is to enter the price of a certain goal you had in mind (for example, a $1000 phone). If you were in a surplus that week, the program will take your figure and print out the amount of full days (rounded up) that it will take to save up for your goal.

There is a view budget history option that allows you to check previous budget entries along with their time slot entries.

There is also an option to enter a new weekly budget, which will run you through the two inital questions again. This can be done if you wanted to enter a new set of data or create a hypothetical saving plan.

The final option will be to exit the application, which will quit the terminal. If you wish to re-use the application you will have to run it from the terminal again.






## first status update- change from multi-expenditure options to just single expenditure options. grossly underestimated how much work would go into the coding and displaying of a multi-faceted data entrry to be considered in the application. re-writing the code to make it much more clean and specific.

## second status update-write 100 words prior to testing nd 100 words post testing