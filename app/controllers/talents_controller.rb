class TalentsController < ApplicationController
  # GET /talents
  # GET /talents.json
  def index
    @talents = Talent.all
  end

  def search_results
    keywords = params[:search_keywords]
    @found_talents = Talent.roughly_spelled_like(keywords)
    
  end

  # GET /talents/1
  # GET /talents/1.json
  def show
    @talent = Talent.find(params[:id])
  end

  # GET /talents/new
  def new
    @talent = Talent.new
  end

  # GET /talents/1/edit
  def edit
    @talent = Talent.find(params[:id])
  end

  # POST /talents
  # POST /talents.json
  def create
    @talent = Talent.new(talent_params)
    @talent.user_id = User.find(1).id # a remplacer par current_user.id apres la reparation du login
    @talent.save
    redirect_to talent_path(@talent.id)
  end

  # PATCH/PUT /talents/1
  # PATCH/PUT /talents/1.json
  def update
    @talent = Talent.find(params[:id])
    @talent.update(talent_params)
    redirect_to talents_path
  end

  # DELETE /talents/1
  # DELETE /talents/1.json
  def destroy
    @talent = Talent.find(params[:id])
    @talent.destroy
    redirect_to talents_path
  end

  private

  def talent_params
    params.require(:talent).permit(:title, :description, :duration)
  end
  
end
