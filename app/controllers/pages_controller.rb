class PagesController < ApplicationController
	before_action :authenticate_user!

	def index
		@pages = Page.paginate(page: params[:page])
	end

	def ajax_call_update
		page = Page.where(id: params[:id]).last
		page.update(key: !page.key)
		render :json => {id: page.key}, status: 200
	end
end
