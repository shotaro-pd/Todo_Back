Rails.application.routes.draw do
  # 既存のCRUD以外のルートの追加で同じ'api/task/'にしたいときは
  # resources doで囲んであげるといい
  namespace 'api' do
    resources :tasks do
      member do
        get :show_tag
      end
    end
  end
end
