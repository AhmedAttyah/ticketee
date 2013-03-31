Feature: Editing Projects
	In order to update project information
	As a user
	I want to be able to do that through an interface

	Background:
		Given there is a project called "Linux"
		And I am on the homepage
		When I follow "Linux"
		And I follow "Edit Project"
	Scenario: Updating a project with correct data
		And I fill in "Name" with "Ubuntu"
		And I press "Update Project"
		Then I should see "Project has been updated"
		And I should be on the project page for "Ubuntu"

	Scenario: Updating a project with incorrect data
		And I fill in "Name" with ""
		And I press "Update Project"
		Then I should see "Project has not been updated"

