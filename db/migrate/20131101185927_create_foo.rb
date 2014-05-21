class CreateFoo < ActiveRecord::Migration
  def change
  	create_table :todos do |t|
  		t.string :content
  	end
  end
end
