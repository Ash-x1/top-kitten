class KittensController < ApplicationController

  def index
    @kittens = Kittens.all 
  end

  def show
    @kitten + Kitten.find(:id)
  end

  def new
    @kitten = Kitten.new 
  end

  def create
    @kitten = @KItten.create(params[:kitten])
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])

    if @kitten.update(kitten_params)
      redirect_to @kitten, notice: "Update successfully"
    else 
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])

    @kitten.destroy
    redirect_to kittens_path, notice: "Delete successfully"
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
