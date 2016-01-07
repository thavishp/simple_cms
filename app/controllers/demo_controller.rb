class DemoController < ApplicationController

	layout "application"

	def index
	end

	def hello
		@array = [1, 2, 3, 4, 5]
		@id = params['id'].to_i
		@page = params[:page].to_i
	end

	def text_helpers
	end

	def escape_output
	end

	def make_error
		# render(text: "test"
		# render(text: @something.upcase)
		# render(text: "1" + 1)
	end

	def logging
		logger.debug("This is debug.")
		logger.info("This is info.")
		logger.warn("This is warm.")
		logger.error("This is error.")
		logger.fatal("This is fatal.")
		render(text: 'Logged!')
	end

end
