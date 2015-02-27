@RegressionTest @SmokeTest @LoginTest
Feature: DAD - Sign In Page

  @LoginPositive
  Scenario Outline: Login - Successfully
    Given I have gone to the DAD Login page
    When I enter "Admin User" in the Username field
    And I enter "Admin Password" in the Password field
    And click the Sign In Button
    And I wait for "<wait>" seconds
    Then The "<result>" should be displayed
  Examples:
    | wait  |         result          |
    |   0   |     Upload Manager      |

  @LoginNegative
  Scenario Outline: Login - Missing Username
    Given I have gone to the DAD Login page
    When I add "<username>" to the Username textbox
    And I add "<password>" to the Password textbox
    And click the Sign In Button
    And I wait for "<wait>" seconds
    Then The "<result>" should be displayed
  Examples: Missing Username
    | wait  | username  | password  |       result          |
    |   0   |           | 123       | Username is required  |

  @LoginNegative
  Scenario Outline: Login - Missing Password
    Given I have gone to the DAD Login page
    When I add "<username>" to the Username textbox
    And I add "<password>" to the Password textbox
    And click the Sign In Button
    And I wait for "<wait>" seconds
    Then The "<result>" should be displayed
  Examples: Missing Password
    | wait  | username  | password  |       result          |
    |   0   | AhmedD    |           | Password is required  |

  @LoginNegative
  Scenario Outline: Login - Missing Password and Username
    Given I have gone to the DAD Login page
    When I add "<username>" to the Username textbox
    And I add "<password>" to the Password textbox
    And click the Sign In Button
    And I wait for "<wait>" seconds
    Then The "<result>" should be displayed
  Examples: Invalid Username and Password
    | wait  | username  | password  |       result          |
    |   1   | AhmedDD   | 123       | The user name or password provided is incorrect |