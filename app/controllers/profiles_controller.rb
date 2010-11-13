class ProfilesController < ApplicationController
  respond_to :html

  before_filter :authenticate_user!

  # GET /profiles
  # GET /profiles.xml
  def index
    @profiles = Profile.all
    respond_with(@profiles)
  end

  # GET /profiles/1
  # GET /profiles/1.xml
  def show
    @profile = Profile.find(params[:id])

  rescue ActiveRecord::RecordNotFound => e
    Rails.logger.info("Tried to access profile id #{params[:id]} and was not found")
    flash[:notice] = "You are not authorized to see that profile"
    redirect_to root_path
  end

    @profile = Profile.find_by_user_id(params[:id])
    respond_with(@profile)
  end

  # GET /profiles/1/edit
  def edit
    @profile = Profile.find(params[:id])
    # Wanted to raise exception of not authorized, but i don't know what its called. for now
    # using the AR one.
    raise ActiveRecord::RecordNotFound unless @profile.user_id == current_user[:id] #or admin
  rescue ActiveRecord::RecordNotFound => e
    Rails.logger.info("Tried to access profile id #{params[:id]} and was not found")
    flash[:notice] = "You are not authorized to see that profile"
    redirect_to root_path
    respond_with(@profile)
  end

  # PUT /profiles/1
  def update
    @profile = Profile.find(params[:id])

    if @profile.update_attributes(params[:profile])
      flash[:notice] = 'Profile was successfully updated.'
    end
    respond_with(@profile, :location => profiles_url)
  end

end
