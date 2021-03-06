class Learning
  # documents
  include Mongoid::Document
  include Mongoid::Timestamps
  include BehaviorHelper

  # associations
  embedded_in :preference

  # fields
  field :l, as: :hightest_level_of_learning_disability_in_a_child_your_family_will_consider,
            type: String

  # validation
  validates :l, presence: true, inclusion: { in: SEVERITY }
end
