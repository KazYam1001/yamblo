class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string     :title, null: false, limit: 255
      t.text       :body,  null: false
      t.string     :image, limit: 255
      t.references :user,  foreign_key: true
      t.timestamps
    end
  end
end
