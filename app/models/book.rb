class Book < ActiveRecord::Base
  PartialDate = Struct.new(:year, :month, :day)

  def release_date_display
    if self.date_mask == 0 || self.release_date == nil
      return 'No release date is given.'
    elsif self.date_mask == 6
      return self.release_date.strftime('%b %Y')
    elsif self.date_mask == 4
      return self.release_date.strftime('%Y')
    else
      return self.release_date.strftime('%F')
    end
  end

  def get_date_select_opt
    opt = { include_blank: true }
    if self.date_mask == 0 || self.release_date == nil
      return opt.merge( selected: nil )
    elsif self.date_mask == 6
      date = PartialDate.new(self.release_date.year, self.release_date.month, nil)
      return opt.merge( selected: date)
    elsif self.date_mask == 4
      date = PartialDate.new(self.release_date.year, nil, nil)
      return opt.merge( selected: date)
    else
      return opt
    end
  end
end
