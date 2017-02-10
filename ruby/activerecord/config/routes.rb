Rails.application.routes.draw do
  get :ping, to: 'ping#ping'

  resources :customers, path: '/customer', except: [:edit, :new]
  resources :products,  path: '/product',  except: [:edit, :new]
  resources :orders,    path: '/order',    except: [:edit, :new] do
    resources :line_items, path: '/product', only: :create
  end
end
