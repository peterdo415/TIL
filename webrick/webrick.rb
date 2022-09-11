# webrick.rb
require 'webrick'

server = WEBrick::HTTPServer.new({ 
  :DocumentRoot => './',
  :BindAddress => '127.0.0.1',
  :Port => 8000
})

server.mount_proc("/time") do |req, res|
  # レスポンス内容を出力
  body = "<html><body>#{Time.now}</body></html>"
  res.status = 200
  res['Content-Type'] = 'text/html'
  res.body = body
end

server.mount_proc("/form_get") do |req, res|
  body = "<html><meta charset='UTF-8'>
  <body>クエリパラメータは{&quot;username&quot;=>&quot;#{req.query['user_name']}&quot; , 
  &quot;age&quot;=>&quot;#{req.query['user_age']}&quot;} です<br>
  こんにちは#{req.query['user_name']}さん
  あなたの年齢は#{req.query['user_age']}ですね
  </body></html>"
  res.status = 200
  res['Content-Type'] = 'text/html'
  res.body = body
end

server.mount_proc("/form_post") do |req, res|
  body = "<html><meta charset='UTF-8'>
  <body>フォームデータは{&quot;username&quot;=>&quot;#{req.query['user_name']}&quot; , 
  &quot;age&quot;=>&quot;#{req.query['user_age']}&quot;}です<br>
  こんにちは#{req.query['user_name']}さん
  あなたの年齢は#{req.query['user_age']}ですね
  </body></html>"
  res.status = 200
  res['Content-Type'] = 'text/html'
  res.body = body
end

server.start