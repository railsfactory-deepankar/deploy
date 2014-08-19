require 'rails_helper'

describe "Users" do

  describe "sign_up" do
  	describe "failure" do
  		it "should not make a new user" do
  		lamda do
  			visit signup_path
  			fill_in "Email",			:with =>""
  			fill_in "Password",		:with =>""
  			fill_in "Password confirmation", :with=>""
  			fill_in "User name",      :with =>""
  			fill_in "Gender",        :with =>"male"
  			click_button
  			response.should render_template('users/new')
  			response.should have_selector('div#error_explanation')
  		end.should_not change(User, :count)
  	end
    end
    RSpec.describe "success" do
  		it "should make a new user" do
  		lamda do
  			visit signup_path
  			fill_in "Email",			:with =>"user@gmail.com"
  			fill_in "Password",		:with =>"deepankar"
  			fill_in "Password confirmation", :with=>"deepankar"
  			fill_in "User name",      :with =>"Example user"
  			fill_in "Gender",        :with =>"male"
  			click_button
  			
  			response.should have_selector('div#flash.success', :content => "welcome")
            response.should render_template('users/show')
  		end.should change(User, :count).by(1)
  	end
  end
end
end

