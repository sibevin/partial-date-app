class Book < ActiveRecord::Base
  def release_date_display
    if self.date_mask == 4
      return self.release_date.strftime('%Y')
    elsif self.date_mask == 6
      return self.release_date.strftime('%b %Y')
    elsif self.date_mask == 0
      return 'No release date is given.'
    else
      return self.release_date.strftime('%F')
    end
  end
end
