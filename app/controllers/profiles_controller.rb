class ProfilesController < ApplicationController
  respond_to :html
  helper_method :sort_column, :sort_direction  
  before_filter :authenticate_user!

  # GET /profiles
  # GET /profiles.xml
  def index
    if params[:search_name] != "name" && !params[:search_name].blank?
      field = "name"
      value = params[:search_name]
    elsif params[:search_location] != "name" && !params[:search_location].blank?
      field = "location"
      value = params[:search_location]
    end
    @profiles = Profile.search(field, value).order(sort_column + ' ' + sort_direction).paginate(:per_page => 20, :page => params[:page])
    respond_with(@profiles)
  end

  # GET /profiles/1
  # GET /profiles/1.xml
  def show
    @profile = Profile.find_by_user_id(params[:id])

  rescue ActiveRecord::RecordNotFound => e
    Rails.logger.info("Tried to access profile id #{params[:id]} and was not found")
    flash[:notice] = "You are not authorized to modify that profile"
    redirect_to root_path
  end

  # GET /profiles/1/edit
  def edit
    @profile = Profile.find(params[:id])
    # Wanted to raise exception of not authorized, but i don't know what its called. for now
    # using the AR one.
    raise ActiveRecord::RecordNotFound unless @profile.user_id == current_user[:id] #or admin
  rescue ActiveRecord::RecordNotFound => e
    Rails.logger.info("Tried to access profile id #{params[:id]} and was not found")
    flash[:notice] = "You are not authorized to modify that profile"
    redirect_to root_path
  end

  # PUT /profiles/1
  def update
    @profile = Profile.find(params[:id])

    if @profile.update_attributes(params[:profile])
      flash[:notice] = 'Profile was successfully updated.'
    end
    respond_with(@profile, :location => profiles_url)
  end

  private  
  def sort_column  
    params[:sort] || "last_name"  
  end  
     
  def sort_direction  
    params[:direction] || "asc"  
  end  

end
