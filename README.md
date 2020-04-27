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

Like with any application, there will be confusion amongst the users and in turn there will be incorrectly entered answers. As the user can freely type any characters into the termonal, and if/elsif/else statement has been included to ensure the corret answer is entered. The if and elsif statements will correspond with input that is valid. It is important to note that 0, as in $0, is not a valid answer to the questions. Any input that contains any character other than a number will be deemed invalid and handled by the else statement, which will print a statement detailed that the answer was invalid and that they need to enter a number that corresponds accordingly to the question. The previous question will then be displayed again and the user will have the opportunity to re-enter an answer.

The error message for incorrectly entered input will remain consistent throughout the application, and is displayed below:

    "Sorry, but the application does not recognise that answer as a valid number. Please enter a new number without any accompanying symbols or characters."

Once the user enters a valid number the response will be saved and the next question will be printed to the screen. This if/elsif/else statement will continually loop until every question has been answered correctly.


This is the end of the application.  ??????????????????????????? <==== not the end of app

COME BACK TO THIS  WITH HOW TO USE THE GOAL OPTION ALONG WITH VIEWING THEIR HISTORY.



#### _Error Handling - Backup Data Storage & Empty-Input checks_
- All input fields outside of the quiz section require a text input - If none is found, the application will loop back and request again.
### User Interaction and Experience


test



## Status update 1

This status update really bugged me because I actually felt like my code regressed heavily. I was probably far too ambitious with my original concept and when I tried to implement all the questions (about 7 different expenditure questions) I realised that this would take me far more than a week to perfect and keep tidy. I also grossly under-estimated how much focused and quality work would go into the program, as I found myself unsure of what feature to start with. Once I simplified the concept and kept the code reasonably black and white I felt like I made reasonable progress in terms of the quantity I was writing each day. This was very encouraging as it allowed me to write comfortably instead of being over-awed with errors and mistakes within my code.


## Status update 2

Prior to testing: This was a pretty obvious outcome for me that the code was going to have a multitude of errors. Basically every feature had a small hiccup or indentation error that needed ironing out. I found that sitting with a pen and paper and hand writing the code helped immensely, and fixed about half of these instantly. I felt that this is because I was logically walking through each line and realising the simple errors that I'd made and just getting back to the basics we'd covered the last few weeks. This also helped me keep the code DRY. I was unaware of how difficult writing the JSON component of my code would be as well, after lots of trial and error and reading online it still took me some time to get the hang of it.

Post test: