class AreaOfExpertisesController < ApplicationController
  before_action :set_area_of_expertise, only: [:show, :edit, :update, :destroy]

  # GET /area_of_expertises
  # GET /area_of_expertises.json
  def index
    require_user()
    @area_of_expertises = AreaOfExpertise.all
  end

  # GET /area_of_expertises/1
  # GET /area_of_expertises/1.json
  def show
    require_user()
  end

  # GET /area_of_expertises/new
  def new
    require_user()
    @area_of_expertise = AreaOfExpertise.new
  end

  # GET /area_of_expertises/1/edit
  def edit
    require_user()
  end

  # POST /area_of_expertises
  # POST /area_of_expertises.json
  def create
    require_user()
    @area_of_expertise = AreaOfExpertise.new(area_of_expertise_params)

    respond_to do |format|
      if @area_of_expertise.save
        format.html { redirect_to @area_of_expertise, notice: 'Area of expertise was successfully created.' }
        format.json { render :show, status: :created, location: @area_of_expertise }
      else
        format.html { render :new }
        format.json { render json: @area_of_expertise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /area_of_expertises/1
  # PATCH/PUT /area_of_expertises/1.json
  def update
    require_user()
    respond_to do |format|
      if @area_of_expertise.update(area_of_expertise_params)
        format.html { redirect_to @area_of_expertise, notice: 'Area of expertise was successfully updated.' }
        format.json { render :show, status: :ok, location: @area_of_expertise }
      else
        format.html { render :edit }
        format.json { render json: @area_of_expertise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /area_of_expertises/1
  # DELETE /area_of_expertises/1.json
  def destroy
    require_user()
    @area_of_expertise.destroy
    respond_to do |format|
      format.html { redirect_to area_of_expertises_url, notice: 'Area of expertise was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_area_of_expertise
      @area_of_expertise = AreaOfExpertise.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def area_of_expertise_params
      params.require(:area_of_expertise).permit(:Title, :Filed, :Domain)
    end
end
