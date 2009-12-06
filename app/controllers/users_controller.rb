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
     else
      render :action => 'new'
    end
  end

end
