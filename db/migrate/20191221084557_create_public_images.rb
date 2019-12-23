class CreatePublicImages < ActiveRecord::Migration[6.0]
  def change
    create_table :public_images do |t|
      t.string 'uuid', null: false
      t.index ['uuid'], name: 'index_public_images_on_uuid', unique: true

      t.timestamps
    end
  end
end
