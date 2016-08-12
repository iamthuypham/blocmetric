class CreateRegisteredApplications < ActiveRecord::Migration
  def change
    create_table :registered_applications do |t|
      t.name: string
      t.url: string
      t.timestamps null: false
    end
  end
end
