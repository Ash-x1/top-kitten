class KittensController < ApplicationController

  def index
    @kittens = Kitten.all 

    respond_to do |format|
      format.html
      format.json { render :json => @kittens } 
    end
  end

  def show
    @kitten = Kitten.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render :json => @kitten }
    end
  end

  def new
    @kitten = Kitten.new 
  end

  def create
    @kitten = Kitten.new(kitten_params)

    if @kitten.save
      redirect_to @kitten, flash: { notice: "#{@kitten.name} was successfully created" }
    else 
      flash.now[:alert] = "😼 Really? Even a kitten form was too hard? Fix your inputs."
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])

    if @kitten.update(kitten_params)
      redirect_to @kitten, flash: { notice: "Update successfully" }
    else 
      flash.now[:alert] = "🙃 That edit failed… maybe try using real numbers this time?"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @kitten = Kitten.find(params[:id])

    @kitten.destroy
    redirect_to kittens_path, flash: { notice: "Kitten deleted. You monster..." }
  end

  private

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
end
