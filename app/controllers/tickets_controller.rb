class TicketsController < ApplicationController
	before_filter :find_project
	before_filter :find_ticket, only: [:update,:destroy,:edit,:show]
	before_filter :authenticate_user!, except:[:index,:show]
	def new
		@ticket = @project.tickets.build
	end

	def create
		@ticket = @project.tickets.build(params[:ticket])
		@ticket.user_id = current_user.id
		if @ticket.save
			redirect_to [@project,@ticket], notice: "Ticket has been created."
		else
			flash[:alert] = "Ticket has not been created."
			render action: "new"
		end
	end

	def show
	end

	def edit
	end

	def destroy
		@ticket.destroy
		flash[:notice] = "Ticket has been deleted."
		redirect_to @project

	end

	def update
		if @ticket.update_attributes(params[:ticket])
			redirect_to [@project,@ticket], notice: "Ticket has been updated."
		else
			flash[:alert]= "Ticket has not been updated."
			render action: "edit"
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
