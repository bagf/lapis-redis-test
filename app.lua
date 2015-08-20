local lapis = require 'lapis'
local redis = require 'redis'

local app = lapis.Application()
local client = redis.connect('127.0.0.1', 6379)

app:get("/", function()
    local key = math.random() * 1000;
    client:set(key, math.random() * 1000)
    local value = client:get(key)
    return value
end)

return app
