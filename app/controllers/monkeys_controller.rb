class MonkeysController < ApplicationController
  before_action :set_monkey, only: [:show, :edit, :update, :destroy]

  def create
    temp_monkey_params = monkey_params
    temp_monkey_params[:access_user] = User.first
    @monkey = Monkey.new temp_monkey_params
    respond_to do |format|
      if @monkey.save
        format.html {redirect_to @monkey, notice: 'Monkey was successfully created.'}
        format.json {render :show, status: :created, location: @monkey}
      else
        format.html {render :new}
        format.json {render json: @monkey.errors, status: :unprocessable_entity}
      end
    end
  end

  def edit
  end

  def index
    @monkeys = Monkey.all
  end

  def new
    @monkey = Monkey.new
  end

  def show
  end

  def update
    temp_monkey_params = monkey_params
    temp_monkey_params[:access_user] = User.last
    @monkey.assign_attributes temp_monkey_params
    respond_to do |format|
      if @monkey.save
        format.html {redirect_to @monkey, notice: 'Monkey was successfully updated.'}
        format.json {render :show, status: :ok, location: @monkey}
      else
        format.html {render :edit}
        format.json {render json: @monkey.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @monkey.destroy
    respond_to do |format|
      format.html {redirect_to monkeys_url, notice: 'Monkey was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_monkey
    @monkey = Monkey.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def monkey_params
    params.require(:monkey).permit(:name)
  end
end
