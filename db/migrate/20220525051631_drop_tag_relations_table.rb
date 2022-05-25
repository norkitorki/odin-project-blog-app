class DropTagRelationsTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :tag_relations
  end
end
