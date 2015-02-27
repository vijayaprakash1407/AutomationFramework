@RegressionTest @SmokeTest @SearchTest
Feature: DAD - Search

  @SearchPositive
  Scenario Outline: Search with a Query that returns data
    Given I have gone to the DAD Home page
    When I add "<Search Query>" to the search box
    And Click the Search Button
    And I "<wait>" for results to appear
    Then The "<Search Result>" should be mentioned in the search
  Examples: Valid Search
    |  wait     |   Search Query        |    Search Result          |
    |    5      |   AHMED_DONOTDELETE   |     AHMED_DONOTDELETE     |

  @SearchNegative
  Scenario Outline: Search with an empty Query
    Given I have gone to the DAD Home page
    When I add "<Search Query>" to the search box
    And Click the Search Button
    And I "<wait>" for results to appear
    Then The "<Search Result>" should be mentioned in the search
  Examples: Validation Error
    |  wait     |   Search Query        |    Search Result          |
    |    0      |                       |     Enter Search Text     |

  @SearchNegative
  Scenario Outline: Search with a Query that returns no data
    Given I have gone to the DAD Home page
    When I add "<Search Query>" to the search box
    And Click the Search Button
    And I "<wait>" for results to appear
    Then The "<Search Result>" should be mentioned in the search
  Examples: No result
    |  wait     |   Search Query        |    Search Result          |
    |    7      |     SpaceSpaceSpace   |   No results found for this filter criteria     |

  @SearchNegative
  Scenario Outline: Search with a Query that returns an error
    Given I have gone to the DAD Home page
    When I add "<Search Query>" to the search box
    And Click the Search Button
    And I "<wait>" for results to appear
    Then The "<Search Result>" should be mentioned in the search
  Examples: Invalid Search
    |  wait     |   Search Query        |    Search Result          |
    |    7      |         ####          | An error occurred while processing your request |