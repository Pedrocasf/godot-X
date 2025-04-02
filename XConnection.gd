extends Node
onready var connection = StreamPeerTCP.new()
const LITTLE_ENDIAN_BYTE = 0x6C
const PROTOCOL_MAJOR = 11
const PROTOCOL_MINOR = 0
func tcp_x_connect():
	connection.put_8(LITTLE_ENDIAN_BYTE)
	connection.put_16(PROTOCOL_MAJOR)
	connection.put_16(PROTOCOL_MINOR)
	connection.put_utf8_string("")
	connection.put_utf8_string("")
	print_debug(connection.get_available_bytes())
	print_debug()
	
# Called when the node enters the scene tree for the first time.
func _ready():
	var err = connection.connect_to_host("localhost", 6000);
	tcp_x_connect()
	if err != OK:
		print_debug("can not connect to X server ")
	else:
		print_debug("connected")
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
