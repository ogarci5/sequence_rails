class SessionsController < ApplicationController
  layout false
  skip_before_filter :authenticate
	def new
  end

  def create
		@account = HTTParty.post("http://squaresuits.com/soul/login", :body => params).parsed_response
		if @account
			login @account
			redirect_to root_path
		else
			flash.now[:danger] = "Invalid name/password"
			render 'new'
		end
  end

  def destroy
		logout
		redirect_to root_path
  end
end
