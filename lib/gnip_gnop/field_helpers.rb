module ::GnipGnop::FieldHelpers
  def format_date_time(time)
    time.new_offset(0).strftime("%Y-%m-%dT%H:%M:%SZ") if time
  end

  def format_date_time_with_hyphens(time)
    time.new_offset(0).strftime("%Y-%m-%dT%H-%M-%SZ") if time
  end

  def parse_date_time_with_hyphens(str)
    DateTime.strptime(str, "%Y-%m-%dT%H-%M-%SZ").new_offset(0)
  end
end
