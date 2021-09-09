class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user,only: [:edit,:update]

  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end


    # @book = Book.find(params[:id])
    # @books = User.books.page(params[:page]).reverse_order
  # end

  def edit
    @user = User.find(params[:id])
  end

  # def edit
  #   @book = Book.find(params[:id])
  #   if @book.user == current_user
  #     render "edit"
  #   else
  #     redirect_to books_path
  #   end
  # end



  def update
    @user = User.find(params[:id])
    # binding.pry
    if @user.update(user_params)
     redirect_to user_path(@user.id)
     flash[:success] = "You have updated user successfully."
    else
      render :edit
    end
  end

   private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def correct_user
    @user = User.find(params[:id])
    unless current_user == @user
      redirect_to user_path(current_user)
    end
  end


end
