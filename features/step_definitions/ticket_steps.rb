Given(/^that project has a ticket:$/) do |table|
  table.hashes.each do |attirbutes|
  	@project.tickets.create! (attirbutes)
  end
end
