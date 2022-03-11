require "http"

response = HTTP.get("http://localhost:3000/products/1")
pp response.parse(:json)
