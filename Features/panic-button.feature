Feature: Panic Button

#it's a button that sould be pressed in case of emergency. When it does, it notifies the nearest police station and provides with the name and location, accompanied by a short voice clip that has been automatically recorded at the press.

Background: 
    
    Given a logged in user named "Mike"
    And he is at the Home Page




Scenario: Successful Notification

    Given Mike has permitted the system to access his location and microphone. 
    When he presses the Panic Button
    Then a confirmation message appears
    """
    Are you sure you want to press the Panic Button?
    
    | YES |  NO  |

    """
    And he has the option to select "Yes"
    And he has the option to select "No"

    When he selects "Yes"
    Then The microphone records a 10s sound clip
    And the system sends a notification to the nearest admin 
        |Name      |Mike                    |
        |Location  |150 Freston Road, London|        
        |Sound Clip|audio1.wav              |
    And Mike get notified for admin notification    

    When he presses "OK"
    Then he returns to the Home Page

    





Scenario: Permissions not turned on
    
    Given Mike presses the Panic Button
    But he has not permitted the system to access his location and microphone
    Then a confirmation message appears
    """
    Are you sure you want to press the Panic Button?
    
    | YES |  NO  |

    """
    And he has the option to select "Yes"
    And he has the option to select "No"

    When he selects "Yes"
    Then the system requests permission to access his location and microphone
    And he has the option to grant permission
    And he has the option to deny permission

    When he chooses to grant permission
    Then The microphone starts recording
    And the system sends a notification to the nearest admin 
        |Name      |Mike                    |
        |Location  |150 Freston Road, London|        
        |Sound Clip|audio1.wav              |
    And Mike gets notified for successful admin notification

    When he presses "OK"
    Then he returns to the Home Page






Scenario: Non-Intentional Press

    Given Mike has permitted the system to access his location and microphone. 
    When he presses the Panic Button
    Then a confirmation message appears
    """
    Are you sure you want to press the Panic Button?
    
    | YES |  NO  |

    """
    And he has the option to select "Yes"
    And he has the option to select "No"

    When he selects " No "
    Then he returns at the Home Page








Scenario: Deny Permission
    
    Given Mike presses the Panic Button
    But he has not permitted the system to access his location and microphone
    Then a confirmation message appears
    """
    Are you sure you want to press the Panic Button?
    
    | YES |  NO  |

    """
    And he has the option to select "Yes"
    And he has the option to select "No"

    When he selects " Yes "
    Then the system requests permission to access his location and microphone
    And he has the option to grant permission
    And he has the option to deny permission

    When he chooses to deny permission
    Then he returns at the Home Page 