Given /^"([^\"]*)" has created a ticket for this project:$/ do |email, table|
  table.hashes.each do |attributes|
  	@ticket = @project.tickets.create! (attributes)
  	@ticket.user_id = @user.id
  	@ticket.save
  end
end
