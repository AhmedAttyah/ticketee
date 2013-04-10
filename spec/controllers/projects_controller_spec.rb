require 'spec_helper'

describe ProjectsController do

	it "should redirect me to homepage for wrong url" do
		get :show, id: "non-exist"
		response.should redirect_to (projects_path)
		message= "the project you were looking for doesn't exist"
		flash[:alert].should eql(message)
	end

	let (:user) do
		user = FactoryGirl.build(:user)
		user.confirm!
		user
	end
	let (:project) do
		project= FactoryGirl.build(:project)
		project.save!
		project
	end

	context "standard user" do
		{"new"=> "get","create"=> "post", "edit"=> "get","update"=> "put","destroy"=>
		 "delete"}.each do|action,method|
			it "cannot access new action" do
				sign_in(:user, user)
				send(method, action.dup, :id => project.id)
				response.should redirect_to (root_path)
				flash[:alert].should eql("You must be an admin to do that.")
			end
		end
	end
end
