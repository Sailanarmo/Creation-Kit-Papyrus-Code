Scriptname sailWaveFight extends ObjectReference  

	;Draugr being used in Waves A to B, to use in the in-game reference window.
Actor Property WaveA01 Auto
Actor Property WaveA02 Auto
Actor Property WaveA03 Auto
Actor Property WaveA04 Auto

Actor Property WaveB01 Auto
Actor Property WaveB02 Auto
Actor Property WaveB03 Auto

Actor Property WaveC01 Auto
Actor Property WaveC02 Auto

Actor Property WaveD01 Auto

	;locked Door to not allow the player to escape.
objectReference property TombDoor auto

	;Dummy to control the fight.
ObjectReference Property DunvarrDummy Auto

	;Priming the first instance
Auto State NotTriggeredState  

		;If player enters the trigger box in game, then go to State Wave1
    Event OnTriggerEnter(ObjectReference akActionRef)
        if (akActionRef == Game.GetPlayer())
             GoToState("Wave1")
        endif
    EndEvent

EndState

	;State Wave 1, activate all Easy Level A Draugr. Dunvarr being the activator
State Wave1

    Event OnBeginState()  
		WaveA01.Enable()
		WaveA02.Enable()
		WaveA03.Enable()
		WaveA04.Enable()
             WaveA01.Activate(DunvarrDummy)
             WaveA02.Activate(DunvarrDummy)
             WaveA03.Activate(DunvarrDummy)
             WaveA04.Activate(DunvarrDummy)
             RegisterForSingleUpdate(3)
    EndEvent

		;if all the waves are dead, move on to State Wave 2, else, keep checking every
		;3 seconds to make sure they are dead.
    Event OnUpdate()
        if (WaveA01.IsDead()&& WaveA02.IsDead() && WaveA03.IsDead() && WaveA04.IsDead())
             GoToState("Wave2")
        else
             Registerforsingleupdate(3)
        endif

    EndEvent



EndState  

	;State Wave 2, activate all Medium Level B Draugr. Dunvarr being the activator
State Wave2

    Event OnBeginState()  
			 WaveB01.Enable()
			 WaveB02.Enable()
			 WaveB03.Enable()
             WaveB01.Activate(DunvarrDummy)
             WaveB02.Activate(DunvarrDummy)
             WaveB03.Activate(DunvarrDummy)
             RegisterForSingleUpdate(3)
    EndEvent

		;if all the waves are dead, move on to State Wave 3, else, keep checking every
		;3 seconds to make sure they are dead.
    Event OnUpdate()
        if (WaveB01.IsDead()&& WaveB02.IsDead() && WaveB03.IsDead())
             GoToState("Wave3")
        else
             Registerforsingleupdate(3)
        endif

    EndEvent



EndState  

	;State Wave 3, activate all Hard Level C Draugr. Dunvarr being the activator
State Wave3

    Event OnBeginState()  
			 WaveC01.Enable()
			 WaveC02.Enable()
             WaveC01.Activate(DunvarrDummy)
             WaveC02.Activate(DunvarrDummy)
             RegisterForSingleUpdate(3)
    EndEvent
	
		;if all the waves are dead, move on to State Wave 4, else, keep checking every
		;3 seconds to make sure they are dead.
    Event OnUpdate()
        if (WaveC01.IsDead()&& WaveC02.IsDead())
             GoToState("Wave4")
        else
             Registerforsingleupdate(3)
        endif

    EndEvent



EndState  

	;State Wave 4, activate the Boss level Draugr, Dunvarr being the activator.
State Wave4

    Event OnBeginState()  
	         WaveD01.Enable()
             WaveD01.Activate(DunvarrDummy)
             RegisterForSingleUpdate(3)
    EndEvent

		;if Boss is dead, open the door to the treasure room, else, keep checking every
		;3 seconds to make sure he is dead.
    Event OnUpdate()
        if (WaveD01.IsDead())
             tombDoor.setOpen()
        else
             Registerforsingleupdate(3)
        endif

    EndEvent



EndState  