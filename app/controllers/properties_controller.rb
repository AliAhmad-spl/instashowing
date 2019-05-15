class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy,:approval_new]
  before_action :authenticate_user! ,except: [:show]
  # GET /properties
  def index
    @properties = Property.all
  end

  # GET /properties/1
  def show
     @property = Property.friendly.find(params[:id])
  end

  # GET /properties/new
  def new
    @property = Property.new
  end
  def back
    @property = current_user.properties.last
    respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /properties/1/edit
  def edit
  end

  # POST /properties
  def create
    @property = Property.new(property_params)
    @agent123 = Agent.new
    if @property.save
      respond_to do |format|
        format.html { redirect_to new_agent_path(property_id:@property.id), notice: 'Property was successfully created.' }
        format.js
      end
    else
      render :new
    end
  end

  # PATCH/PUT /properties/1
  def update

    if @property.update(property_params)
      redirect_to controller: 'charges', action: 'details', id:@property.id, notice: 'Property was successfully updated.'
    else
      render :edit
    end
  end
  def approval_new
  end
  def approval_type
    @property.update(property_params)
    redirect_to properties_path
  end

  # DELETE /properties/1
  def destroy
    @property.destroy
    redirect_to properties_url, notice: 'Property was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.friendly.find(params[:id])
    end
    # Only allow a trusted parameter "white list" through.
    def property_params
      params.require(:property).permit(:name, :beds, :baths, :address, :description,:approval_type,:user_id,:stripe_id ,:slug,pictures: [])
    end
end
