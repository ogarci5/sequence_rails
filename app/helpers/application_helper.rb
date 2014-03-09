module ApplicationHelper
	def login(account)
		cookies.permanent[:sso_token] = account["sso_token"]
		self.current_account = account
	end
	
	def current_account=(account)
		@current_account = account
	end
	
	def current_account
		@current_account ||= HTTParty.post("http://squaresuits.com/soul/login", 
			:body => {account: {sso_token: cookies[:sso_token]}})
	end
	
	def logged_in?
		!current_account.nil?
	end
	
	def logout
		self.current_account = nil
		cookies.delete(:sso_token)
	end
end
