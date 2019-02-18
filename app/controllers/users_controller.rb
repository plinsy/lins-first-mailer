class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:secret]
  before_action :set_user, only: [:show, :edit, :update]

  def new
  	@user.avatar.attach(params[:avatar])
  end

	def show
		
	end

	def edit
	end

	def update
		respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_path(@user.id), notice: 'Profil was successfully updated.' }
        format.json { render :edit, status: :updated, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
	end

	private

	def set_user
		@user = current_user
	end

	def user_params
		params.require(:user).permit(:first_name, :last_name, :description)
	end
	
end
