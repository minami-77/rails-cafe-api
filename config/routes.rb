Rails.application.routes.draw do
  # as a user, I can see all  of my cafes
  # resources :cafes, only:[:index] -> cannot put "api/v1(version1)" before cafes.
  # defaults: { format: :json } → デフォルトのレスポンスをJSON形式に。APIリクエストを送ったときに JSON 形式でデータを返す。

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :cafes, only: [ :index, :create]
    end
  end
  # as a user, I can search through all of my cafes
  # as a user, I can add a cafe
end
