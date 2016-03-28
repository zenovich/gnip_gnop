module GnipGnop
  class ActivityObject
    class Content
      include HappyMapper

      tag 'content'

      attribute :type, String
      content :text, String
    end
  end
end
