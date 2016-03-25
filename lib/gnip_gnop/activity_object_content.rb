module GnipGnop
  class ActivityObjectContent
    include HappyMapper

    tag 'content'

    attribute :type, String
    content :text, String
  end
end
