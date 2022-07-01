class UsersController < ApplicationController
  def show
    @user = User.find(1)
  end

  # def start_test
  #   redirect_to new_user_test_path(@user)
  # end
end
