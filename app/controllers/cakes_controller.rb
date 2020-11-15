class CakesController < ApplicationController
  before_action :authenticate_user!,only: [:create, :new, :edit, :update, :destroy]
  before_action :set_cake, only: [:show, :edit, :update, :destroy]

  # GET /cakes
  # GET /cakes.json
  def index
    @cakes = Cake.all.where(availability:true)
  end

  # GET /cakes/1
  # GET /cakes/1.json
  def show
  end

  # GET /cakes/new
  def new
    @cake = Cake.new
  end

  # GET /cakes/1/edit
  def edit
    authorize! :manage, @cake
  end

  # POST /cakes
  # POST /cakes.json
  def create
    @cake = current_user.cakes.new(cake_params)

    respond_to do |format|
      if @cake.save
        format.html { redirect_to @cake, notice: 'Cake was successfully created.' }
        format.json { render :show, status: :created, location: @cake }
      else
        format.html { render :new }
        format.json { render json: @cake.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cakes/1
  # PATCH/PUT /cakes/1.json
  def update
    authorize! :manage, @cake
    respond_to do |format|
      if @cake.update(cake_params)
        format.html { redirect_to @cake, notice: 'Cake was successfully updated.' }
        format.json { render :show, status: :ok, location: @cake }
      else
        format.html { render :edit }
        format.json { render json: @cake.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cakes/1
  # DELETE /cakes/1.json
  def destroy
    authorize! :manage, @cake
    @cake.destroy
    respond_to do |format|
      format.html { redirect_to cakes_url, notice: 'Cake was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cake
      @cake = Cake.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cake_params
      params.require(:cake).permit(:name, :author, :description, :price, :availability)
    end
end
