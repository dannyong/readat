class HomeController < ApplicationController
	def index
		@writes = Write.all
	end
end