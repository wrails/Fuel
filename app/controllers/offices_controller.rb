class OfficesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_office, only: [:show, :edit, :update, :destroy]

  # GET /offices
  # GET /offices.json



  def index
    if params[:search].present?
      radius = params[:radius]
      @offices = Office.near(params[:search], radius)
      puts(@offices.first.distance)
    else
      @offices = current_user.offices.all
    end
  end

  # GET /offices/1
  # GET /offices/1.json
  def show
  end

  # GET /offices/new
  def new
    @office = current_user.offices.build
  end

  # GET /offices/1/edit
  def edit
  end

  # POST /offices
  # POST /offices.json
  def create
    @office = current_user.offices.build(office_params)

    respond_to do |format|
      if @office.save
        format.html { redirect_to offices_path, notice: 'Office was successfully created.' }
        format.json { render :index, status: :created, location: offices }
      else
        format.html { render :new }
        format.json { render json: @office.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offices/1
  # PATCH/PUT /offices/1.json
  def update
    respond_to do |format|
      if @office.update(office_params)
        format.html { redirect_to offices_path, notice: 'Office was successfully updated.' }
        format.json { render :index, status: :ok, location: offices }
      else
        format.html { render :edit }
        format.json { render json: @office.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offices/1
  # DELETE /offices/1.json
  def destroy
    @office.destroy
    respond_to do |format|
      format.html { redirect_to offices_url, notice: 'Office was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_office
      @office = Office.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def office_params
      params.require(:office).permit(:user_id, :name, :postcode, :distance, :latitude, :longitude)
    end
end
