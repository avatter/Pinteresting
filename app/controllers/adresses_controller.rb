class AdressesController < ApplicationController
  before_action :set_adress, only: [:show, :edit, :update, :destroy]
before_action :authenticate_user!, except: [:index, :show]
#before_action :correct_user, only: [:edit, :update, :destroy]
 

  # GET /adresses
  # GET /adresses.json
  def index
    @adresses = Adresse.all
    #@adresses = Adresse.to_a
  end

  # GET /adresses/1
  # GET /adresses/1.json
  def show
  end

  # GET /adresses/new
  def new
    #@adress = current_user.adresses.build
    @adress = Adresse.new
  end

  # GET /adresses/1/edit
  def edit
  end

  # POST /adresses
  # POST /adresses.json
  def create
    
    @adress = Adresse.new(adress_params)
    @adress.user_id = current_user.id

    #adress = Adresse.new(adress_params)
    #adress = current_user.adresses.build(adress_params)

    respond_to do |format|
      if @adress.save
        format.html { redirect_to @adress, notice: 'Location wurde erstellt.' }
        format.json { render action: 'show', status: :created, location: @adress }
      else
        format.html { render action: 'new' }
        format.json { render json: @adress.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adresses/1
  # PATCH/PUT /adresses/1.json
  def update
    respond_to do |format|
      if @adress.update(adress_params)
        format.html { redirect_to @adress, notice: 'Location wurde angepasst.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @adress.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adresses/1
  # DELETE /adresses/1.json
  def destroy
    @adress.destroy
    respond_to do |format|
      format.html { redirect_to adresses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adress
      @adress = Adresse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def adress_params
      params.require(:adresse).permit(:strasse, :hausnummer, :plz, :stadt, :latitude, :longitude)
    end
end
