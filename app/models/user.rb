class User < ApplicationRecord
  include AccessLogger

  has_many :access_logs_created, class_name: 'AccessLog', foreign_key: 'created_by_id'
  has_many :access_logs_updated, class_name: 'AccessLog', foreign_key: 'updated_by_id'
end
