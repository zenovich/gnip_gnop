module GnipGnop
  class Source
    include HappyMapper

    tag 'source'

    element :title, String
    element :updated, DateTime
    has_one :link, Link
    element :rule, String, :namespace => "gnip"
  end
end
