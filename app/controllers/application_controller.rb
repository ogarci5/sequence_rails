class ApplicationController < ActionController::Base
  protect_from_forgery
	include ApplicationHelper
	before_filter :authenticate
	
	def authenticate
		redirect_to '/sequence/login' unless logged_in?
	end
end
