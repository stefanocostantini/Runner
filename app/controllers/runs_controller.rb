class RunsController < ApplicationController

before_filter :login_required

  # GET /runs
  # GET /runs.xml
  def index
    @runs = current_user.runs.all
    @goal = current_user.goals.first

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @runs }
    end
  end

  # GET /runs/1
  # GET /runs/1.xml
  def show
    @run = current_user.runs.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @run }
    end
  end

  # GET /runs/new
  # GET /runs/new.xml
  def new
    @run = current_user.runs.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @run }
    end
  end

  # GET /runs/1/edit
  def edit
    @run = current_user.runs.find(params[:id])
  end

  # POST /runs
  # POST /runs.xml
  def create
    @run = current_user.runs.new(params[:run])
    
    @run.duration = @run.hours*3600 + @run.minutes*60 + @run.seconds 
    
    @run.avgspeed = ((@run.distance/@run.duration)*3600).round(1)
    
    @run.pace_minutes = ((@run.duration/60)/@run.distance)
    
  	pace_in_decimal = ((@run.duration/60)/@run.distance)
  	
  	seconds_in_decimal = ((@run.duration/60)/@run.distance) - @run.pace_minutes
  	
  	@run.pace_seconds = seconds_in_decimal * 60

    respond_to do |format|
      if @run.save
        flash[:notice] = 'Run was successfully created.'
        format.html { redirect_to(@run) }
        format.xml  { render :xml => @run, :status => :created, :location => @run }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @run.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /runs/1
  # PUT /runs/1.xml
  def update
    @run = current_user.runs.find(params[:id])

    respond_to do |format|
      if @run.update_attributes(params[:run])
        flash[:notice] = 'Run was successfully updated.'
        format.html { redirect_to(@run) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @run.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /runs/1
  # DELETE /runs/1.xml
  def destroy
    @run = current_user.runs.find(params[:id])
    @run.destroy

    respond_to do |format|
      format.html { redirect_to(runs_url) }
      format.xml  { head :ok }
    end
  end
end
