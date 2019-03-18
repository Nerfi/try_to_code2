class GymsController < ApplicationController
  before_action :set_gym, only: [:show, :edit, :update, :destroy]

  def index
    @gyms = policy_scope(Gym).order(created_at: :desc)

  end

  def show


  end

  def new
    @gym = Gym.new
    authorize @gym

  end

  def edit
    #esta linea la hemos sustituido por set_gym method
   # @gym = Gym.find(params[:id])

  end


  def create
    @gym =  Gym.new(gym_params)
    @gym.save
    @gym.user = current_user
    authorize @gym

    if @gym.save
      redirect_to @gym , notice: 'your gym was created thanks!'
    else
      render :new
    end
  end

  def update
    #@gym = Gym.find(params[:id])
    #@gym.update(params[:gym])
    @gym.update(gym_params)

    if @gym.update(gym_params)
      redirect_to @gym, notice: 'your gym was updated, thanks!'
    else
      render :edit
  end
end


 def destroy
    #wacth out with this method
    @gym.destroy
    redirect_to gyms_path

  end

  private

  def set_gym
    @gym = Gym.find(params[:id])
    authorize @gym

  end

  def gym_params
    params.require(:gym).permit(:name, :description, :pricing, :user_id, :photo, :address)

  end

end
