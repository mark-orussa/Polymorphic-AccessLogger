class CreateAccessLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :access_logs do |t|
      t.references :created_by, foreign_key: {to_table: :users, on_delete: :cascade}, unique: false, null: false
      t.references :updated_by, foreign_key: {to_table: :users, on_delete: :cascade}, unique: false, null: false
      t.references :access_loggable, polymorphic: true, index: {name: 'index_access_logs'}

      t.timestamps
    end
  end
end
