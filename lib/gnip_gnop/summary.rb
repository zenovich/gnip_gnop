module GnipGnop
  class Summary
    include HappyMapper

    tag 'summary'

    attribute :type, String
    content :text, String
  end
end
