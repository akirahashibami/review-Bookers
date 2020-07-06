Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # ルートディレクトリ（URL/　の場所）を定義
  root :to => 'homes#top'

  # booksコントローラーのアクションを定義
  resources :books

  # なんかデリートメソッドは書かないかんらしい
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
end
