module GnipGnop
  class MatchingRule
    include HappyMapper

    tag 'matching_rule'

    namespace "gnip"

    attribute :rel, String
    content :rule
  end
end
