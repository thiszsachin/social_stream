Factory.define :activity do |a|
  a.association :_tie, :factory => :tie
  a.activity_verb { ActivityVerb["post"] }
end

Factory.define :like_activity, :parent => :activity do |a|
  a.association :parent, :factory => :activity
  a.activity_verb { ActivityVerb["like"] }
  a._tie { |tie| tie.association(:tie, :sender => tie.parent.tie.sender) }
end
