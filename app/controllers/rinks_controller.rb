class RinksController < ApplicationController
  before_action :set_rink, only: [:show, :edit, :update, :destroy]

  # GET /rinks
  # GET /rinks.json
  def index
    @rinks = Rink.all
  end

  # GET /rinks/1
  # GET /rinks/1.json
  def show
  end

  # GET /rinks/new
  def new
    @rink = Rink.new
  end

  # GET /rinks/1/edit
  def edit
  end

  # POST /rinks
  # POST /rinks.json
  def create
    @rink = Rink.new(rink_params)

    respond_to do |format|
      if @rink.save
        format.html { redirect_to @rink, notice: 'Rink was successfully created.' }
        format.json { render :show, status: :created, location: @rink }
      else
        format.html { render :new }
        format.json { render json: @rink.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rinks/1
  # PATCH/PUT /rinks/1.json
  def update
    respond_to do |format|
      if @rink.update(rink_params)
        format.html { redirect_to @rink, notice: 'Rink was successfully updated.' }
        format.json { render :show, status: :ok, location: @rink }
      else
        format.html { render :edit }
        format.json { render json: @rink.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rinks/1
  # DELETE /rinks/1.json
  def destroy
    @rink.destroy
    respond_to do |format|
      format.html { redirect_to rinks_url, notice: 'Rink was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rink
      @rink = Rink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rink_params
      params.require(:rink).permit(:name, :address, :rink_type, :ottawa_rinks_ref)
    end
end
