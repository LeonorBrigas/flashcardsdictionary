class Flashcard < ApplicationRecord
  validates :prompt, presence: true, length: { minimum: 2 }
  validates :answer, presence: true, length: { minimum: 2 }
end
