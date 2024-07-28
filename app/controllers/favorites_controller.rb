class FavoritesController < ApplicationController
  before_action :set_book

  def create
    favorite = current_user.favorites.new(book_id: @book.id)
    if favorite.save
      respond_to do |format|
        format.js
        format.html { redirect_to request.referer }
      end
    else
      logger.error favorite.errors.full_messages
      head :unprocessable_entity
    end
  end

  def destroy
    favorite = current_user.favorites.find_by(book_id: @book.id)
    if favorite.destroy
      respond_to do |format|
        format.js
        format.html { redirect_to request.referer }
      end
    else
      logger.error favorite.errors.full_messages
      head :unprocessable_entity
    end
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end
end
