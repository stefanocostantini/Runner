class RunsController < ApplicationController

in_place_edit_for :run, :distance
in_place_edit_for :run, :hours
in_place_edit_for :run, :minutes
in_place_edit_for :run, :seconds
in_place_edit_for :run, :note
in_place_edit_for :run, :created_at

before_filter :login_required

  # GET /runs
  # GET /runs.xml
  def index
    @runs = current_user.runs.all(:order => 'created_at DESC')
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
    @goal = current_user.goals.first
    @run.duration = @run.hours*3600 + @run.minutes*60 + @run.seconds 
    @run.avgspeed = ((@run.distance/@run.duration)*3600).round(1)
    @run.note = 'Click to enter a short note here'
    
   
    @run.distance_comparison = (((@run.distance-@goal.distance)/@goal.distance)*100).round(1)
    #@run.duration_comparison = (((@run.duration-@goal.duration)/@goal.duration)*100).round(1)
    @run.avgspeed_comparison = (((@run.avgspeed-@goal.avgspeed)/@goal.avgspeed)*100).round(1)
    @run.total_comparison = ((@run.distance_comparison+@run.avgspeed_comparison)/2).round(1)
    
	@run.save 
	@runs = current_user.runs.all(:order => 'created_at DESC') 

    
    #respond_to do |format|
     # if @run.save
      # flash[:notice] = 'Run was successfully created.'
      # format.html { redirect_to(@run) }
      # format.xml  { render :xml => @run, :status => :created, :location => @run }
      # else
       # format.html { render :action => "new" }
       # format.xml  { render :xml => @run.errors, :status => :unprocessable_entity }
      #end
    #end
  
  end

  # PUT /runs/1
  # PUT /runs/1.xml
  def update
    @run = current_user.runs.find(params[:id])
    @goal = current_user.goals.first
    @run.duration = @run.hours*3600 + @run.minutes*60 + @run.seconds 
    
    @run.avgspeed = ((@run.distance/@run.duration)*3600).round(1)
    
    @run.distance_comparison = (((@run.distance-@goal.distance)/@goal.distance)*100).round(1)
    #@run.duration_comparison = (((@run.duration-@goal.duration)/@goal.duration)*100).round(1)
    @run.avgspeed_comparison = (((@run.avgspeed-@goal.avgspeed)/@goal.avgspeed)*100).round(1)
    @run.total_comparison = ((@run.distance_comparison+@run.avgspeed_comparison)/2).round(1)
    
   	@run.save 
	@runs = current_user.runs.all(:order => 'created_at DESC') 

    #respond_to do |format|
     # if @run.save
      #  flash[:notice] = 'Run was successfully updated.'
       # format.html { redirect_to(@run) }
       # format.xml  { head :ok }
     # else
      #  format.html { render :action => "edit" }
       # format.xml  { render :xml => @run.errors, :status => :unprocessable_entity }
     # end
    # end
  end

  # DELETE /runs/1
  # DELETE /runs/1.xml
  def destroy
    @run = current_user.runs.find(params[:id])
    @run.destroy
    @runs = current_user.runs.all(:order => 'created_at DESC') 

   # respond_to do |format|
   #  format.html { redirect_to(runs_url) }
   #   format.xml  { head :ok }
   # end
  end
  
  def set_goal_distance
  	@goal = current_user.goals.first
	@goal.distance = params[:value]
	@goal.duration = @goal.hours*3600 + @goal.minutes*60 + @goal.seconds 
    @goal.avgspeed = ((@goal.distance/@goal.duration)*3600).round(1)
	@goal.save
	@runs = current_user.runs.all
		for @run in @runs
		    @run.distance_comparison = (((@run.distance-@goal.distance)/@goal.distance)*100).round(1)
    		#@run.duration_comparison = (((@run.duration-@goal.duration)/@goal.duration)*100).round(1)
    		@run.avgspeed_comparison = (((@run.avgspeed-@goal.avgspeed)/@goal.avgspeed)*100).round(1)
    		@run.total_comparison = ((@run.distance_comparison+@run.avgspeed_comparison)/2).round(1)
    		@run.save
		end
	@runs = current_user.runs.all(:order => 'created_at DESC')
	@goal = current_user.goals.first
  end
  
  def set_goal_hours
  	@goal = current_user.goals.first
	@goal.hours = params[:value]
	@goal.duration = @goal.hours*3600 + @goal.minutes*60 + @goal.seconds 
    @goal.avgspeed = ((@goal.distance/@goal.duration)*3600).round(1)
	@goal.save
	@runs = current_user.runs.all
		for @run in @runs
		    @run.distance_comparison = (((@run.distance-@goal.distance)/@goal.distance)*100).round(1)
    		#@run.duration_comparison = (((@run.duration-@goal.duration)/@goal.duration)*100).round(1)
    		@run.avgspeed_comparison = (((@run.avgspeed-@goal.avgspeed)/@goal.avgspeed)*100).round(1)
    		@run.total_comparison = ((@run.distance_comparison+@run.avgspeed_comparison)/2).round(1)
    		@run.save
		end
	@runs = current_user.runs.all(:order => 'created_at DESC')
    @goal = current_user.goals.first
  end
  
  def set_goal_minutes
  	@goal = current_user.goals.first
	@goal.minutes = params[:value]
	@goal.duration = @goal.hours*3600 + @goal.minutes*60 + @goal.seconds 
    @goal.avgspeed = ((@goal.distance/@goal.duration)*3600).round(1)
	@goal.save
	@runs = current_user.runs.all
		for @run in @runs
		    @run.distance_comparison = (((@run.distance-@goal.distance)/@goal.distance)*100).round(1)
    		#@run.duration_comparison = (((@run.duration-@goal.duration)/@goal.duration)*100).round(1)
    		@run.avgspeed_comparison = (((@run.avgspeed-@goal.avgspeed)/@goal.avgspeed)*100).round(1)
    		@run.total_comparison = ((@run.distance_comparison+@run.avgspeed_comparison)/2).round(1)
    		@run.save
		end
	@runs = current_user.runs.all(:order => 'created_at DESC')
    @goal = current_user.goals.first
  end
  
  def set_goal_seconds
  	@goal = current_user.goals.first
	@goal.seconds = params[:value]
	@goal.duration = @goal.hours*3600 + @goal.minutes*60 + @goal.seconds 
    @goal.avgspeed = ((@goal.distance/@goal.duration)*3600).round(1)
	@goal.save
	@runs = current_user.runs.all
		for @run in @runs
		    @run.distance_comparison = (((@run.distance-@goal.distance)/@goal.distance)*100).round(1)
    		#@run.duration_comparison = (((@run.duration-@goal.duration)/@goal.duration)*100).round(1)
    		@run.avgspeed_comparison = (((@run.avgspeed-@goal.avgspeed)/@goal.avgspeed)*100).round(1)
    		@run.total_comparison = ((@run.distance_comparison+@run.avgspeed_comparison)/2).round(1)
    		@run.save
		end
	@runs = current_user.runs.all(:order => 'created_at DESC')
    @goal = current_user.goals.first
  end
  
  def delete
  
    @run = current_user.runs.find(params[:id])
    @run.destroy
    	
 	@runs = current_user.runs.all(:order => 'created_at DESC')
   
  end 
  
  def set_run_distance
	@run = current_user.runs.find(params[:id])
	@goal = current_user.goals.first
	@run.distance = params[:value]
	@run.distance_comparison = (((@run.distance-@goal.distance)/@goal.distance)*100).round(1)
	@run.avgspeed = ((@run.distance/@run.duration)*3600).round(1)
    @run.avgspeed_comparison = (((@run.avgspeed-@goal.avgspeed)/@goal.avgspeed)*100).round(1)
	@run.total_comparison = ((@run.distance_comparison+@run.avgspeed_comparison)/2).round(1)
	@run.save
  end 
  
  def set_run_hours
	@run = current_user.runs.find(params[:id])
	@goal = current_user.goals.first
	@run.hours = params[:value]
	@run.duration = @run.hours*3600 + @run.minutes*60 + @run.seconds 
    @run.avgspeed = ((@run.distance/@run.duration)*3600).round(1)
    @run.avgspeed_comparison = (((@run.avgspeed-@goal.avgspeed)/@goal.avgspeed)*100).round(1)
	@run.total_comparison = ((@run.distance_comparison+@run.avgspeed_comparison)/2).round(1)
	@run.save
  end
  
  def set_run_minutes
	@run = current_user.runs.find(params[:id])
	@goal = current_user.goals.first
	@run.minutes = params[:value]
	@run.duration = @run.hours*3600 + @run.minutes*60 + @run.seconds 
    @run.avgspeed = ((@run.distance/@run.duration)*3600).round(1)
    @run.avgspeed_comparison = (((@run.avgspeed-@goal.avgspeed)/@goal.avgspeed)*100).round(1)
	@run.total_comparison = ((@run.distance_comparison+@run.avgspeed_comparison)/2).round(1)
	@run.save
  end
  
  def set_run_seconds
	@run = current_user.runs.find(params[:id])
	@goal = current_user.goals.first
	@run.seconds = params[:value]
	@run.duration = @run.hours*3600 + @run.minutes*60 + @run.seconds 
    @run.avgspeed = ((@run.distance/@run.duration)*3600).round(1)
    @run.avgspeed_comparison = (((@run.avgspeed-@goal.avgspeed)/@goal.avgspeed)*100).round(1)
	@run.total_comparison = ((@run.distance_comparison+@run.avgspeed_comparison)/2).round(1)
	@run.save
  end    

  
end
