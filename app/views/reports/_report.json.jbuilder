json.extract! report, :id, :date, :observation, :risk_level, :recommendation, :action_plan, :timelines, :created_at, :updated_at
json.url report_url(report, format: :json)
