Feature: Deleting Projects
	remove projects that is not needed anymore
	
	Scenario: Deleting Projecs
		Given there is a project called "Ahmed"
		And I am on the homepage
		When I follow "Ahmed"
		And I follow "Delete Project"
		Then I should see "Project has been deleted."
		Then I should not see "Ahmed"