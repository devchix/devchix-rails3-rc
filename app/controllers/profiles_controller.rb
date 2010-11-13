class ProfilesController < ApplicationController
  before_filter :authenticate_user!

  # GET /profiles
  # GET /profiles.xml
  def index
    @profiles = Profile.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @profiles }
    end
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
  end

  # PUT /profiles/1
  # PUT /profiles/1.xml
  def update
    @profile = Profile.find(params[:id])

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to(@profile, :notice => 'Profile was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @profile.errors, :status => :unprocessable_entity }
      end
    end
  end

end
