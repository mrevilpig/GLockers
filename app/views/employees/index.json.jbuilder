json.array!(@employees) do |employee|
  json.extract! employee, :first_name, :last_name, :middle_name, :mobile_phone, :email, :username, :role, :password
  json.url employee_url(employee, format: :json)
end
