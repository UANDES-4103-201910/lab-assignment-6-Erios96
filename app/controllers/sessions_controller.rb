class SessionsController < ApplicationController
	def new
		@user = User.new(id: cookies[id_user])
	end

	def create
		#complete this method
		if user = User.authenticate(params[:username], params[:password])
      			session[:current_user_id] = user.id
			cookies[id_user] = @user.id
      			redirect_to root_url
    		end
	end

	def destroy
		#complete this method
    		@_current_user = session[:current_user_id] = nil
		cookies.delete(:id_user)
    		redirect_to root_url
	end
end
