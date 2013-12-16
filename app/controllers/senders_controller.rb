class SendersController < ApplicationController
	def new
		@card=Card.new
	end
end
