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
    @profile = Profile.find_by_user_id(params[:id])
    respond_with(@profile)
  end

  # GET /profiles/1/edit
  def edit
    @profile = Profile.find(params[:id])
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

  # DELETE /profiles/1
  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy

    respond_with(@profile)
  end
end
