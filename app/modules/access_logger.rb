module AccessLogger
  def self.included(includer)
    includer.class_eval do
      attr_accessor :access_user
      after_create :create_access_log
      after_update :update_access_log

      has_many :access_logs, as: :access_loggable, dependent: :destroy
      has_many :created_by, through: :access_logs
      has_many :updated_by, through: :access_logs
    end
  end

  def create_access_log
    # add a new access log
    if self.access_user.present?
      access_logs.create(created_by_id: self.access_user.id, updated_by_id: self.access_user.id)
      logger.debug {"#### New access log created for #{self.class.name} id #{self.id}."}
    else
      logger.debug {"#### Could not create access log for #{self.class.name} id #{self.id}. Access user is not defined."}
    end
  end

  def update_access_log
    if access_logs.any?
      if saved_changes?
        if self.access_user.present?
          # update the existing access log
          access_logs.last.update(updated_by_id: self.access_user.id, updated_at: Time.zone.now)
          logger.debug {"#### Access log updated for #{self.class.name} id #{self.id}."}
        else
          logger.debug {"#### Could not update access log for #{self.class.name} id #{self.id}. Access user is not defined."}
        end
      end
    else
      create_access_log
    end
  end
end