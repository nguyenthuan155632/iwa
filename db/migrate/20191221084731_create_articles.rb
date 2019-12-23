class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.text :content, null: false
      t.text :description, null: false
      t.string :title, null: false
      t.string :subtitle
      t.string :url, null: false
      t.bigint :cover_image_id, null: false, index: true, foreign_key: true
      t.bigint :thumbnail_image_id, null: false, index: true, foreign_key: true

      t.index ['url'], unique: true

      t.timestamps
    end
  end
end