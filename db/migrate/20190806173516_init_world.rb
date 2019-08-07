class InitWorld < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.timestamps #null: false
    end

    create_table :player_lists do |t|
      t.references :user, foreign_key: true
      t.timestamps #null: false
    end

    create_table :player_list_players do |t|
      t.references :player_list, foreign_key: true
      t.references :players, foreign_key: true
      t.timestamps #null: false
    end

    create_table :players do |t|
      t.string :first_name #null: false
      t.string :last_name #null: false
      t.integer :wage
      t.integer :overall_rating
      t.integer :potential_rating
      t.integer :value
      t.string :club
    end
  end
end
