Feature: Creating Users
In order to add new users to the system
As an admin
I want to be able to add them through the backend
	
	Background:
	Given there are the following users:
	| email| password | admin |
	| admin@ticketee.com | password | true |
	And I am signed in as them
	Given I am on the homepage
	When I follow "Admin"
	And I follow "Users"
	When I follow "New User"
