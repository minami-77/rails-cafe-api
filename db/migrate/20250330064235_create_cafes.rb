class CreateCafes < ActiveRecord::Migration[7.1]
  def change
    create_table :cafes do |t|
      t.string :title
      t.string :address
      t.string :picture
      t.jsonb :hours #jsonb は PostgreSQL のデータ型で、JSONデータをそのまま格納できる。
      t.string :criteria, array: true, default: [] #複数の値を配列として保存 できる。デフォルトでは空の配列。

      t.timestamps
    end
  end
end
