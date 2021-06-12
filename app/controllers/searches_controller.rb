class SearchesController < ApplicationController

  def create
    @search = Search.create(search_params)
    redirect_to @search
  end

  def show
    @search = Search.find(params[:id])
    @searches = @search.search_question
    @new_search = Search.new
  end

  private
    def search_params
      params.require(:search).permit(:query)
    end
end