class NotesController < ApplicationController
  before_action :logged_in_user, only:[:create, :destroy]

  def create
    @note = current_user.notes.build(note_params)
    if @note.save
      flash[:success] = "Note created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private
    def note_params
      params.require(:note).permit(:content, :image)
    end
end
