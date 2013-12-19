class ParticipantsController < ApplicationController
  before_action :signed_in_user,  only: [:create, :edit, :index]

  def create
    @participant = Participant.new(participant_params)
    if @participant.save
      flash[:success] = "participant created!"
      redirect_to group_path(@participant.group)
    else
      redirect_to group_path(:group_id)
    end
  end

  def destroy
    @participant.destroy
    flash[:error] = "participant deleted"
    redirect_to root_url
  end

  def edit
    @page_title = "Update participant"
    @participant = Participant.find(params[:id])
    @other_participants = Participant.where(['id <> ? AND group_id = ?', @participant.id, @participant.group_id])
  end

  def update
    @participant = Participant.find(params[:id])
    if @participant.update_attributes(participant_params)
      @partner = Participant.find_by_id(params[:participant][:partner_id])
      @partner.partner_id = @participant.id
      @partner.save!
      flash.now[:success] = "Profile updated"
      redirect_to @participant.group
    else
      render 'edit'
    end
  end

  private
    def participant_params
      params.require(:participant).permit(:name, :email, :group_id, :partner_id)
    end
end