class AgentsController < ApplicationController
  before_action :set_agent, only: [:show, :edit, :update, :destroy]

  # GET /agents
  def index
    @property = params[:property]
    @agents = Agent.where(property_id:@property)
  end

  # GET /agents/1
  def show
  end

  # GET /agents/new
  def new
    @agent = Agent.new
  end

  # GET /agents/1/edit
  def edit
  end

  # POST /agents
  def create
    @agent = Agent.new(agent_params)

    if @agent.save
      redirect_to approval_new_properties_path(id:@agent.property.id), notice: 'Agent was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /agents/1
  def update
    if @agent.update(agent_params)
      redirect_to properties_path, notice: 'Agent was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /agents/1
  def destroy
    @agent.destroy
    redirect_to agents_url, notice: 'Agent was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agent
      @agent = Agent.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def agent_params
      params.require(:agent).permit(:picture, :name, :email, :phone,:property_id)
    end
end
