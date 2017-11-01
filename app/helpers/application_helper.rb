module ApplicationHelper

  ## 完全なtitle
  def full_title(page_title='')
    base_title = "VoiceNote"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

end
