require "rails_helper"

RSpec.describe UsersController, :type => :controller do

	before do 
		stub_user
		@user = create_user
	end

	it 'GET #index' do
	  	get :index
      	expect(response).to be_success
      	expect(response).to have_http_status(200)
	end

	it "renders the index template" do
      	get :index
      	expect(response).to render_template("index")
    end

    it "loads all of the users in the @users" do
	   get :index
	   expect(assigns(:users)).to match_array([@user])
    end

    it "load the user" do
    	get :show, id: @user
      	expect(response).to be_success
    end

    it "change the user email" do
    	new_email = 'demo123@demo.com'
    	patch :update, id: @user, user:{
    		email: new_email
    	}
    	expect(response).to redirect_to users_path
    	expect(User.first.email).to eq new_email
    end

    it "change the user email but fails" do
    	new_email = 'demo123'
    	patch :update, id: @user, user:{
    		email: new_email
    	}
    	expect(response).to render_template("edit")
    	expect(User.first.email).not_to eq new_email
    end

    it "deletes the user" do
    	delete :destroy, id: @user
    	expect(response).to redirect_to users_path
    end

    context 'POST #create' do 

    	it 'creates a new user' do 
    		post :create, user: {
    			name: 'demo',
    			email: 'demo@demo.com',
    			password: '123'
    		}
    		expect(response).to redirect_to users_path
      		expect(response).to have_http_status(302)
    	end

    	it 'creates a new user' do 
    		post :create, user: {
    			name: 'demo',
    			email: 'demo',
    			password: '123'
    		}
    		expect(response).to render_template("new")
    	end
    	
    end

end