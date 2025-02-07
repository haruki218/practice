class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @comment = current_user.book_comments.new(book_comment_params)
    @comment.book_id = @book.id
    @comment.save
    respond_to do |format|
      format.js
      format.html { redirect_to @book }
    end
  end

  def destroy
    @comment = BookComment.find_by(id: params[:id], book_id: params[:book_id])
    @book = @comment.book
    @comment.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to @book }
    end
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
