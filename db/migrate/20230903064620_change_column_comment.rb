class ChangeColumnComment < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :content, :comment
  end
end
