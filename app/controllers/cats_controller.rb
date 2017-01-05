class CatsController < ApplicationController
  before_action :set_cat, only: [:show, :edit, :update, :destroy]

  # GET /cats
  def index
    @cats = Cat.all
  end

  # GET /cats/1
  def show
  end

  # GET /cats/new
  def new
    @cat = Cat.new
  end

  # GET /cats/1/edit
  def edit
  end

  # POST /cats
  def create
    @cat = Cat.new(cat_params)

    if @cat.save
      redirect_to @cat, notice: 'Cat was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /cats/1
  def update
    if @cat.update(cat_params)
      redirect_to @cat, notice: 'Cat was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /cats/1
  def destroy
    @cat.destroy
    redirect_to cats_url, notice: 'Cat was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cat
      @cat = Cat.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cat_params
      params.require(:cat).permit(:name, :favorite_thing, :color)
    end
end
