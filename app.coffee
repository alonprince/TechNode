express = require 'express'
app = express()
port = process.env.PORT || 3000

app.use express.static "#{__dirname}/static"

app.use (req, res) ->
    res.sendfile './static/index.html'

io = require 'socket.io'
        .listen app.listen port

io.sockets.on 'connection', (socket) ->
    socket.emit 'conected'

console.log "TeckNode is on port #{port}!"