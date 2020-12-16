Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'flashcards#home'
  get '/flashcards/:id/answer', to: "flashcards#answer", as: "flashcards_answer"
  get '/flashcards/:id/next', to: "flashcards#next", as: "flashcards_next"
  get '/flashcards/:id/previous', to: "flashcards#previous", as: "flashcards_previous"

  resources :flashcards
end
