class StaticPagesController < ApplicationController
  def home
    @page_title = "Home"
    @group = current_user.groups.build if signed_in?
    @groups = current_user.groups.limit(5).order("updated_at DESC")
  end

  def help
    @page_title = "Help"
  end

  def about
    @page_title = "About"
  end
end
