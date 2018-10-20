extends AudioStreamPlayer


#Play music lol.
var current_song #Is song name.
var last_song : AudioStream


var talking_files = {
	"Hello" : "res://Assets/Sounds/Orc/JoinTheArmyTheySaid.ogg"
	}


func at_chase():
	if already_playing( "chase" ) :
		last_song = self.stream
		self.stream = load( "res://Assets/Music/Chase.ogg" )
		current_song = "chase"
		self.play()


func at_heroic():
	if already_playing( "heroic" ) :
		last_song = self.stream
		self.stream = load( "res://Assets/Music/Heroic.ogg" )
		current_song = "heroic"
		self.play()


func at_title():
	if already_playing( "title" ) :
		last_song = self.stream
		self.stream = load( "res://Assets/Music/Title.ogg" )
		current_song = "title"
		self.play()


func at_stealth():
	if already_playing( "stealth" ) :
		last_song = self.stream
		self.stream = load( "res://Assets/Music/Stealth.ogg" )
		current_song = "stealth"
		self.play()


func already_playing( check_song ):
	if current_song == null  :
		return true
	
	var is_same_song = current_song != check_song
	return is_same_song



func _ready():
	#Play the title song.
	at_title()
	

func revert():
	#Go to the previous song.
	if last_song != null :
		self.stream = last_song
		Music.play()


func get_talk( talk ):
	if not talking_files.has( talk ) :
		return
	
	var return_song = load( talking_files[ talk ] )
	return return_song
	



