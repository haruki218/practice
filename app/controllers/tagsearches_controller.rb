class TagsearchesController < ApplicationController
  def search
    @word = params[:content]
    @books = Book.where("category LIKE ?", "%#{@word}%")
    render "search"
  end
end
