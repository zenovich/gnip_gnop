module GnipGnop
  class MatchingRules
    include HappyMapper

    tag 'matching_rules'
    namespace "gnip"

    has_many :matching_rules, MatchingRule, :tag => "matching_rule"#, :namespace => "gnip", :xpath => "./gnip:matching_rules/"

    def respond_to?(symbol, include_priv=false)
      super || matching_rules.respond_to?(symbol, include_priv)
    end

    private

    def method_missing(method, *args, &block)
      matching_rules.send(method, *args, &block)
    end
  end
end
