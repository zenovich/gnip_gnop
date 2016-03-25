module GnipGnop
  class Source
    include HappyMapper
    include FieldHelpers
    extend  FieldHelpers

    tag 'source'

    has_one :link, Link
    element :title, String
    element :updated, DateTimeWithHyphens, :parser => :parse_date_time_with_hyphens, :on_save => :format_date_time_with_hyphens
    element :rule, String, :namespace => "gnip"
  end
end
