class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.text :content
      t.string :cover_image_url
      t.text :description
      t.string :title
      t.string :subtitle
      t.string :url
      t.string :thumbnail_image_url

      t.timestamps
    end
  end
end
