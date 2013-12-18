class GroupsController < ApplicationController
  before_action :signed_in_user,  only: [:create, :destroy, :index, :match]
  before_action :correct_user,    only: [:destroy, :match]

  def index
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      flash[:success] = "Group created!"
      redirect_to @group
    else
      render 'static_pages/home'
    end
  end

  def destroy
    @group.destroy
    flash[:error] = "Group deleted"
    redirect_to root_url
  end

  def show
    @group = Group.find(params[:id])
    @participant = @group.participants.build if signed_in?
    @participants = @group.participants.paginate(page: (params[:page]))
    @page_title = @group.name
  end

  def match
    @group.participants.each do |participant|
      if !participant.partner_id.blank?
        @potential_giftees = @group.participants.where(['matched = ? AND id <> ? AND id <> ?', false, participant.id, participant.partner_id])
      else
        @potential_giftees = @group.participants.where(['matched = ? AND id <> ?', false, participant.id])
      end
      giftee = @potential_giftees.sample
      participant.giftee_id = giftee.id
      giftee.matched = true
      participant.save!
      giftee.save!
    end
    redirect_to group_path(@group)
  end

  private
    def group_params
      params.require(:group).permit(:name, :year, :limit)
    end

    def correct_user
      @group = current_user.groups.find_by(id: params[:id])
      redirect_to root_url if @group.nil?
    end
end