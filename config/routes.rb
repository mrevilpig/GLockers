GLockers::Application.routes.draw do
  devise_for :users
  root :to => "pages#index"
  post "api/DoorOpened(.:format)" => "api#DoorOpened"
  post "api/DropOff(.:format)"
  post "api/SyncAccessInfo(.:format)"
  post "api/SyncOperatorInfo(.:format)"
  post "api/SyncAdminInfo(.:format)"
  post "api/BarcodeNotExist(.:format)"
  post "api/BoxIntruded(.:format)"

  post "boxes/assign"
  post "boxes/assign_backup"
  post "boxes/reassign"
  post "boxes/reassign_backup"
  post "boxes/delivered"
  post "boxes/picked_up"
  post "boxes/dropped_off"
  post "boxes/received"
  post "boxes/:id/open", to: "boxes#open", as: "open_box"

  post "lockers/:id/sync", to: "lockers#sync", as: "sync_locker"

  post "employees/set_permissions"
  post "employees/set_privileges"

  resources :lockers

  resources :employees

  resources :trackings

  resources :packages

  resources :branches

  resources :boxes

  resources :users

  get "logs" => "loggings#index"
  get "logs/box/:id", to: "loggings#box_logs", as: "box_logs"
  get "logs/package/:id", to: "loggings#package_logs", as: "package_logs"
  get "packages/:id/get_available_boxes" => "packages#get_available_boxes"

end
