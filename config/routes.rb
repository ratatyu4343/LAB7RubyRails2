Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    resources :streets
    resources :students
    resources :houses
    root to: "streets#index"
  end



end
