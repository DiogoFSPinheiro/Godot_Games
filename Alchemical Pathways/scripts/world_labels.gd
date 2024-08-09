extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$hi.text = "Welcome to Alchemical Pathways!!
In this game you have to escape by moving
the tower blocks to get to the top and
deafeat the Evil Alchemist!"
	$turial1.text = "Move with AD and Arrow keys
Jump with SPACE, S and Arrow down flips player
Hold G while moving to move the blocks"
	$turial2.text = "Feed the altars with Ashes to save
your check point
Press R and the level will reset
to your latest checkpoint position"
	$Label5.text = "Don't forget! 
If you make a mistake 
press R"
	$happy.text = "Congratulations you 
escaped the tower!!
Thank you for Playing!
Press R to quit."
