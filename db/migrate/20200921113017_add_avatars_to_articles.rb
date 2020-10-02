class AddAvatarsToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :avatars, :json
  end
end
