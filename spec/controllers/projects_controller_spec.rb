require 'spec_helper'

describe ProjectsController do

	it "should redirect me to homepage for wrong url" do
		get :show, id: "non-exist"
		response.should redirect_to (projects_path)
		message= "the project you were looking for doesn't exist"
		flash[:alert].should eql(message)
	end
end
