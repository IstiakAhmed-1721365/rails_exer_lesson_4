Rails.application.routes.draw do
  resources :articles
  #resources :articles, module: 'admin', path: '/abc/articles', only: [:index, :show]
 
=begin
 resources :articles, module: 'admin', path: '/abc/articles', only: [:index, :show] do
     member do
         get 'search'
     end
     collection do
         get 'search'
     end
 end
=end
 
 #=========================================
 
=begin scope '/abc' do
         resources :articles, module: 'admin', only: [:index, :show] 
         
         resources :users, module: 'admin', only: [:show] do
             resources :posts, only: [ :index]
         end
 end
=end
 #=============================
 
=begin
 scope '/abc' do
         resources :articles, module: 'admin', only: [:index, :show] 
         
         resources :users, module: 'admin', only: [:show] do
             resource :details, only: [] do
                 resources :test, as: 'posts', controller: "details/posts", only: [ :index]
             end
         end
     end
=end
 
 #======================
 
=begin
 namespace :admin do
     resources :users, only: [:show] do
         scope '/abc' do
             resources :posts, only: [:index]
         end
     end
 end
=end
 
 #===============================
 
 #resources :test, as: 'posts', controller: 'posts', module: 'admin', only: [:index, :show]
 
 #============================
 
resources :users do
    resource :posts do
        collection do
          get 'search', to:"user#search_post"
        end
    end
end
 
#delete '/books/:id', to: 'book#destroy' 
#root to: "books#index"
#resources :xyz, controller: "abcs", only: [:new, :create]
get '/xyz/new', to: 'abcs#new', as: 'new_test'
post '/xyz', to: 'abcs#create', as: 'test'
 
end

