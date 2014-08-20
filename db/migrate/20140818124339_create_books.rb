class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
    	t.string :title
    	t.float  :price
    	t.integer :subject_id
    	t.text    :description
    	t.timestamp :created_at
      t.timestamps
    end
  end
end



