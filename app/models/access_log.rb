class AccessLog < ApplicationRecord
  belongs_to :access_loggable, polymorphic: true
  belongs_to :created_by, class_name: 'User', foreign_key: 'created_by_id', optional: true
  belongs_to :updated_by, class_name: 'User', foreign_key: 'updated_by_id', optional: true
end
