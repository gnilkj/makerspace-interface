class InvoiceOption
  include Mongoid::Document
  include ActiveModel::Serializers::JSON

  OPERATION_RESOURCES = {
    member: Member,
    rental: Rental,
  }.freeze
  OPERATION_FUNCTIONS = [:renew].freeze

  ## Transaction Information
  # User friendly name for invoice displayed on receipt
  field :name, type: String
  # Any details about the invoice. Also shown on receipt
  field :description, type: String
  field :amount, type: Float
  # How many operations to perform (eg, num of months renewed)
  field :quantity, type: Integer
  # What does this do to Resource. One of OPERATION_FUNCTIONS
  field :operation, type: String, default: :renew
  # Class name of resource, one of OPERATION_RESOURCES
  field :resource_class, type: String
  # ID of billing plan to/is subscribe(d) to.  May reference a DEFAULT_INVOICE
  field :plan_id, type: String

  validates :resource_class, inclusion: { in: OPERATION_RESOURCES.keys }, allow_nil: false
  validates :operation, inclusion: { in: OPERATION_FUNCTIONS }, allow_nil: false
  validates_numericality_of :amount, greater_than: 0
  validates_numericality_of :quantity, greater_than: 0
  validates_uniqueness_of :plan_id

end