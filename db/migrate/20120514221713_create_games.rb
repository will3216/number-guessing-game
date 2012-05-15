class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :guess
      t.integer :lower_bound
      t.integer :upper_bound
      t.integer :answer
      t.boolean :ub_set
      t.boolean :lb_set
      
      t.timestamps
    end
  end
end
