require "http"

response = HTTP.get("http://localhost:3000/all_products")
pp response.parse(:json)
