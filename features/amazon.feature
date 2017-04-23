Feature: Buy an item

Scenario: Login on Amazon
  Given I am on the Amazon site
  When I enter to the login page
  And Enter the my credentials
  Then I should be logged in with the name "test"

Scenario: Search for an item
  Given I am on the Amazon site
  When I search for "Xbox"
  And Select an item from the results
  Then I should be on the information page of the selected item

Scenario Outline: Select several items
  Given I am on the Amazon site
  When I search for "<item>"
  And Select an item from the results
  Then I should be on the information page of the selected item

Examples:
  |item|
  |Xbox one|
  |Nintendo|
  |PS 4|
  |Alienware|
  |Ipad|


Scenario: Add item to the car
  Given I am on the Amazon site
  When I search for "Xbox"
  And Select an item from the results
  When I add it to the car
  Then The item should be on the shopping cart

Scenario: Log out user
  Given I am on the Amazon site
  And I enter to the login page
  And Enter the my credentials
  When I log out
  Then I should return to the login page