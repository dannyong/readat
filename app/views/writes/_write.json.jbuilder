json.extract! write, :id, :title, :post, :publish, :user_id, :created_at, :updated_at
json.url write_url(write, format: :json)