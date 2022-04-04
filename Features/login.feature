
Feature: Login

    Scenario: User logs in to the system succesfully
         
        Given User is in the Login screen
        When They enter their taxisnet info
        |username|
        |password|
        Then They enter the Home Page


    Scenario: First Login

        Given User is in the Login Screen
        When they enter theis taxisnet info for the first time
        Then the system creates an account for them
        And A message appears on the screen
        """
        Let's solve some crimes, shall we?
        
        """
        And they enter the Home Page



    Scenario: Wrong taxisnet info

        Given User is in the Login Screen
        And they are trying to log in to the system
        But  they enter wrong taxisnet info
        When they press login
        Then An error message appears
        """
        Incorrect Username or Password, please try again.
        
        """
        And they stay in the Login Screen

