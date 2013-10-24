class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.references :tag, index: true
      t.references :user

      t.timestamps
    end
  end
end
