class CreateMonkeys < ActiveRecord::Migration[5.1]
  def change
    create_table :monkeys do |t|
      t.string :name

      t.timestamps
    end
  end
end
