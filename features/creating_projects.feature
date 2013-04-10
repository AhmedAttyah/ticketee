Feature: Creating Project
	In order to have a project to assign tickets to users i want to be able to create them 

  Background:    
    Given there are the following users:
    | email | password | admin|
    | user@ticketee.com | password | true|
    And I am signed in as them
    Given I am on the homepage
    When I follow "New Project"

  Scenario: Creating a project
    And I fill in "Name" with "TextMate 2"
    And I press "Create Project"
    Then I should see "Project has been created!"
    And I should be on the project page for "TextMate 2"


  Scenario: Filling Empty Project
    And I press "Create Project"
    Then I should see "Project has not been created!"
    And I should see "Name can't be blank"

