class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user,only: [:edit,:update]

  def index
    @book = Book.new
    @books = Book.all
    #@user = @book.user
    @user = current_user

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @users = User.all
      @user = current_user
      render :index
    end
  end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
    #@user = current_user
  end

  def edit
    @book = Book.find(params[:id])
  end


#   def edit
#     @book = Book.find(params[:id])
#     if @book.user == current_user
#       render "edit"
#     else
#       redirect_to books_path
#     end
# 　end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(book_params)
      flash[:success] = "Book was successfully updated."
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:alert] = "Book was successfully destroyed."
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
    #params.permit(:title, :body)
  end

  def correct_user
    @book = Book.find(params[:id])
    unless @book.user == current_user
      flash[:notice] = "権限がありません"
      redirect_to books_path
    end
  end




end
