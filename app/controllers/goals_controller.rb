class GoalsController < ApplicationController

in_place_edit_for :goal, :distance
in_place_edit_for :goal, :hours
in_place_edit_for :goal, :minutes
in_place_edit_for :goal, :seconds

before_filter :login_required

  # GET /goals
  # GET /goals.xml
  def index
    @goal = current_user.goals.first 

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @goals }
    end
  end

  # GET /goals/1
  # GET /goals/1.xml
  def show
    @goal = current_user.goals.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @goal }
    end
  end

  # GET /goals/new
  # GET /goals/new.xml
  def new
    @goal = current_user.goals.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @goal }
    end
  end

  # GET /goals/1/edit
  def edit
    @goal = current_user.goals.find(params[:id])
  end

  # POST /goals
  # POST /goals.xml
  def create
  	#This has been disabled. The User's goal is created when a new account is generated. 
  end

  # PUT /goals/1
  # PUT /goals/1.xml
  def update
    @goal = current_user.goals.find(params[:id])

    respond_to do |format|
      if @goal.update_attributes(params[:goal])
        flash[:notice] = 'Goal was successfully updated.'
        format.html { redirect_to(@goal) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @goal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.xml
  def destroy
    @goal = current_user.goals.find(params[:id])
    @goal.destroy

    respond_to do |format|
      format.html { redirect_to(goals_url) }
      format.xml  { head :ok }
    end
  end
end
