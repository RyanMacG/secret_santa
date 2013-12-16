class GroupsController < ApplicationController
  before_action :signed_in_user,  only: [:create, :destroy, :index]
  before_action :correct_user,    only: :destroy

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
    @page_title = @group.name
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