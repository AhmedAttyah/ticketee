class TicketsController < ApplicationController
	before_filter :find_project
	before_filter :find_ticket, only: [:update,:destroy,:edit,:show]
	
	def new
		@ticket = @project.tickets.build
	end

	def create
		@ticket = @project.tickets.build(params[:ticket])
		if @ticket.save
			redirect_to [@project,@ticket], notice: "Ticket has been created."
		else
			flash[:alert] = "Ticket has not been created."
			render action: "new"
		end
	end

	private
	def find_project
		@project = Project.find(params[:project_id])
	end

	def find_ticket
		@ticket= @project.tickets.find(params[:id])
	end
end