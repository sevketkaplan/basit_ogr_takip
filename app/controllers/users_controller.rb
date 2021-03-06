class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :authorize_admin, only: :create
	before_action :set_user, only: [:edit, :update]

	def index
		@users=User.all.order("created_at DESC")
	end
	
	def new 
		@user=User.new
	end

	def new2 
		@user=User.new
	end

	def edit
	end

	def create
		@user=User.new(user_params)

		if User.exists?(username:  @user.username)
			flash[:notice] = "Bu kullanıcı zaten KAYITLI !!"
			redirect_to :back
		else
			if current_user.yonetici?
				if @user.save
					flash[:notice]="Kullanıcı hesabı oluşturuldu. !!"
					redirect_to users_path
				end
			else
				flash[:notice]="Kullanıcı hesabını sadece yönetici oluşturabilir."
				redirect_to new_user_path

			end
		end
	end

	def compose
		@user=User.new(user_params)

		if User.exists?(username:  @user.username)
			flash[:notice] = "Bu kullanıcı zaten KAYITLI !!"
			redirect_to :back
		else
			if current_user.yonetici?
				if @user.save
					flash[:notice]="Kullanıcı hesabı oluşturuldu. !!"
					redirect_to users_path
				end
			else
				flash[:notice]="Kullanıcı hesabını sadece yönetici oluşturabilir."
				redirect_to new_user_path

			end
		end
	end


	def update

		respond_to do |format|
			if @user.update(user_params)
				format.html { redirect_to users_path, notice: 'Kullanıcı Güncellendi!' }
				format.json { render :show, status: :ok, location: @user}
			else
				format.html { render :edit }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end


	private
	def set_user
		@user=User.find(params[:id])
	end
	def authorize_admin
		return unless !current_user.yonetici?
		redirect_to root_path, alert: 'Admins only!'
	end
	def user_params
		params.require(:user).permit(:ogrid, :role, :username, :email, :password, :password_confirmation)
	end
end
