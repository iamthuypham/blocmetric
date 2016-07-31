class RegisteredApplicationsController < ApplicationController
  def create
    @user = current_user
    @registered_application = @user.registered_applications.build(registered_application_params)
    
    if @registered_application.save
      flash[:notice] = "Your application was registered successfully."
      redirect_to registered_applications_path
    else
      flash.now[:alert] = "There was an error saving your application. Please try again."
      render :new
    end
  end

  def new
    @registered_application = RegisteredApplication.new
  end
  
  def index
    @registered_applications = RegisteredApplication.all
  end
  
  def destroy
     @registered_application = RegisteredApplication.find(params[:id])

     if @registered_application.destroy
       flash[:notice] = "\"#{@registered_application.name}\" was deleted successfully."
       redirect_to registered_applications_path
     else
       flash.now[:alert] = "There was an error deleting the registered_application."
       render :show
     end
  end
  
  def show
    @registered_application = RegisteredApplication.find(params[:id])
    @events = @registered_application.events.group_by(&:name)
    
    unless current_user
      flash[:alert] = "You must be signed in to view your applications."
      redirect_to new_user_session_path
    end
  end
  
  private
  def registered_application_params
     params.require(:registered_application).permit(:name, :url, :user_id)
  end
end
