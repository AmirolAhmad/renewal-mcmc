class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :fullname
      t.text :address
      t.string :postcode
      t.string :city
      t.string :state
      t.string :phone_number

      t.timestamps
    end
  end
end
