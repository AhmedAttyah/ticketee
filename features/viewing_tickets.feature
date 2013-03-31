Feature: Viewing Tickets
	In order to view the tickets for a project
	As a user
	I want to see them on that project's page

	Background:
		Given there is a project called "Linux"
		And that project has a ticket:
		|	title 	|	description|
		|	Ubuntu	|	Grub error while dual booting|
		And there is a project called "Windows"
		And that project has a ticket:
		|	title 	|	description|
		|	Vista	|	disaster microsoft made! :D|
		And I am on the homepage

	Scenario: Viewing Ticket for a given project
		When I follow "Linux"
		Then I should see "Ubuntu" 
		And I should not see "Vista"
		When I follow "Ubuntu"
		Then I should see "Grub error while dual booting"
		And should not see "disaster microsoft made! :D"

		When I follow "Ticketee"
		And I follow "Windows"
		Then I should see "Vista"
		And I should not see "Ubuntu"
		When I follow "Vista"
		Then I should see "disaster microsoft made! :D"
		And I should not see "Grub error while dual booting"
