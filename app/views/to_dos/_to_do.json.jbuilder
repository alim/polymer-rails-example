json.extract! to_do, :id, :task, :priority, :due_date, :created_at, :updated_at
json.url to_do_url(to_do, format: :json)