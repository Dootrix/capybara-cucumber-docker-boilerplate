Feature: Check out the team
  As a user, I want to be able to view the team, so I can see who they are

  Scenario Outline: User can see a specific team member
    Given I visit the home page
    When I click on "Our team"
    Then I should see a list of team members
    And I should see "<team_member>"

    Examples:
      | team_member     |
      | Adam Braimah    |
      | Charlie Allen   |
      | Steve Atkinson  |
      | Wayne McManus   |
