class FoodsController < ApplicationController
  before_action :set_food, only: %i[edit update destroy]

  def index
    @foods = Food.includes(:user).order(:created_at)
  end

  def new
    @food = Food.new
  end

  def create
    food = current_user.foods.create!(post_params)
    redirect_to food
  end

  def show
    @food = Food.find(params[:id])
  end

  def edit; end

  def update
    @food.update!(post_params)
    redirect_to @food
  end

  def destroy
    @food.destroy!
    redirect_to root_path
  end

  private

  def post_params
    params.require(:food).permit(:name, :comment)
  end

  def set_food
    @food = current_user.foods.find(params[:id])
  end
end
