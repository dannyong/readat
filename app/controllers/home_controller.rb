class HomeController < ApplicationController
	before_action :authenticate_user!
	
	def index
		@writes = Write.limit(3).order(created_at: :desc)
		@latest = Write.last
	end
end