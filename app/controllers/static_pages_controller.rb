class StaticPagesController < ApplicationController
  def home
    @page_title = "Home"
    @group = current_user.groups.build if signed_in?
  end

  def help
    @page_title = "Help"
  end

  def about
    @page_title = "About"
  end
end
