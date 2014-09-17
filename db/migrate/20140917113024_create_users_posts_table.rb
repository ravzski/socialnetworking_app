class CreateUsersPostsTable < ActiveRecord::Migration
  def change

    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.timestamps
    end

    create_table :posts do |t|
      t.text :content
      t.integer :user_id
      t.attachment :photos
      t.timestamps
    end

    create_table :comments do |t|
      t.text :content
      t.integer :post_id
      t.timestamps
    end






  end
end
