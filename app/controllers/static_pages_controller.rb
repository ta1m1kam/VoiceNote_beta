class StaticPagesController < ApplicationController
  def home
    @note = current_user.notes.build if logged_in?
  end

  def about
  end

  def contact
  end

end
