class CreateFlashcards < ActiveRecord::Migration[6.1]
  def change
    create_table :flashcards do |t|
      t.string :prompt
      t.text :answer

      t.timestamps
    end
  end
end
