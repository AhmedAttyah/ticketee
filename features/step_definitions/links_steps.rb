Then(/^I should not see "(.*?)" link$/) do |text|
	page.should_not(have_css("a",text: text))
end

Given(/^I am signed in as "(.*?)"$/) do |text|
	@user = User.find_by_email!(text)
	steps("Given I am signed in as them")
end

Then(/^I should see "(.*?)" link$/) do |text|
	page.should(have_css("a", text: text))	
end
