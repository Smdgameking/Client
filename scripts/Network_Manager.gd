extends Node


var Address = "127.0.0.1"
var Port = 9000

func connect_to_server():
	var peer = ENetMultiplayerPeer.new()
	var error = peer.create_client(Address,Port)
	if error!=OK:
		print("can't Connect to server")
	else:
		print("connect to server")
	multiplayer.multiplayer_peer = peer
	multiplayer.connected_to_server.connect(connected_to_server)
	multiplayer.connection_failed.connect(connection_failed)
	multiplayer.server_disconnected.connect(server_discinnected)

func connected_to_server():
	print("connected to server")

func connection_failed():
	print("connection failed")

func server_discinnected():
	print("server disconnected")

func send_login_data(username: String, password: String):
	var data = {
		"username": username,
		"Password": password
	}
	var json_text = JSON.stringify(data)
	print("📤 Sending login data:", json_text)
	rpc_id(1, "receive_login_data", json_text) # Send to server (peer 1)

# 📥 Receive reply from server
@rpc("any_peer")
func login_response(msg: String):
	print("💬 Server says:", msg)
