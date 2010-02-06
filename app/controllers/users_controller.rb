class UsersController < ApplicationController
  
  # render new.rhtml
  def new
  end

  def create
    cookies.delete :auth_token
    # protects against session fixation attacks, wreaks havoc with 
    # request forgery protection.
    # uncomment at your own risk
    # reset_session
    @user = User.new(params[:user])
    @user.save
    if @user.errors.empty?
      self.current_user = @user    
       
      redirect_back_or_default('/')
      flash[:notice] = "Thanks for signing up!"
      
   		#create default goal
   			@goal = current_user.goals.new #(params[:goal])
       		@goal.distance = 8
    		@goal.hours = 0
    		@goal.minutes = 40
    		@goal.seconds = 0
    		@goal.duration = @goal.hours*3600 + @goal.minutes*60 + @goal.seconds 
    		@goal.avgspeed = ((@goal.distance/@goal.duration)*3600).round(1)
    		@goal.save
    		
    	#create default run#1	
    		@run = current_user.runs.new #(params[:goal])
       		@run.distance = 8
    		@run.hours = 0
    		@run.minutes = 40
    		@run.seconds = 0
    		@run.note = 'Click to enter notes here'
    		@run.duration = @run.hours*3600 + @run.minutes*60 + @run.seconds 
    		@run.avgspeed = ((@run.distance/@run.duration)*3600).round(1)
    		
    		@run.distance_comparison = (((@run.distance-@goal.distance)/@goal.distance)*100).round(1)
    		#@run.duration_comparison = (((@run.duration-@goal.duration)/@goal.duration)*100).round(1)
    		@run.avgspeed_comparison = (((@run.avgspeed-@goal.avgspeed)/@goal.avgspeed)*100).round(1)
    		@run.total_comparison = ((@run.distance_comparison+@run.avgspeed_comparison)/2).round(1)
    		    		
    		@run.save
    		 	
     else
      render :action => 'new'
    end
  end

end
