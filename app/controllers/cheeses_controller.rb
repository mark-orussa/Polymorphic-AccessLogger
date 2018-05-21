class CheesesController < ApplicationController
  before_action :set_cheese, only: [:show, :edit, :update, :destroy]

  def create
    temp_cheese_params = cheese_params
    temp_cheese_params[:access_user] = User.first
    @cheese = Cheese.new temp_cheese_params
    respond_to do |format|
      if @cheese.save
        format.html {redirect_to @cheese, notice: 'Cheese was successfully created.'}
        format.json {render :show, status: :created, location: @cheese}
      else
        format.html {render :new}
        format.json {render json: @cheese.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @cheese.destroy
    respond_to do |format|
      format.html {redirect_to cheeses_url, notice: 'Cheese was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  def edit
  end

  def index
    @cheeses = Cheese.all
  end

  def new
    @cheese = Cheese.new
  end

  def show
  end

  def update
    temp_cheese_params = cheese_params
    temp_cheese_params[:access_user] = User.last
    @cheese.assign_attributes temp_cheese_params
    respond_to do |format|
      if @cheese.save
        format.html {redirect_to @cheese, notice: 'Cheese was successfully updated.'}
        format.json {render :show, status: :ok, location: @cheese}
      else
        format.html {render :edit}
        format.json {render json: @cheese.errors, status: :unprocessable_entity}
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cheese
    @cheese = Cheese.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cheese_params
    params.require(:cheese).permit(:name)
  end
end
