Scriptname sailWaveFight extends ObjectReference  

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

objectReference property TombDoor auto

ObjectReference Property DunvarrDummy Auto


Auto State NotTriggeredState  

    Event OnTriggerEnter(ObjectReference akActionRef)
        if (akActionRef == Game.GetPlayer())
             GoToState("Wave1")
        endif
    EndEvent

EndState

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

    Event OnUpdate()
        if (WaveA01.IsDead()&& WaveA02.IsDead() && WaveA03.IsDead() && WaveA04.IsDead())
             GoToState("Wave2")
        else
             Registerforsingleupdate(3)
        endif

    EndEvent



EndState  

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

    Event OnUpdate()
        if (WaveB01.IsDead()&& WaveB02.IsDead() && WaveB03.IsDead())
             GoToState("Wave3")
        else
             Registerforsingleupdate(3)
        endif

    EndEvent



EndState  

State Wave3

    Event OnBeginState()  
			 WaveC01.Enable()
			 WaveC02.Enable()
             WaveC01.Activate(DunvarrDummy)
             WaveC02.Activate(DunvarrDummy)
             RegisterForSingleUpdate(3)
    EndEvent

    Event OnUpdate()
        if (WaveC01.IsDead()&& WaveC02.IsDead())
             GoToState("Wave4")
        else
             Registerforsingleupdate(3)
        endif

    EndEvent



EndState  

State Wave4

    Event OnBeginState()  
	         WaveD01.Enable()
             WaveD01.Activate(DunvarrDummy)
             RegisterForSingleUpdate(3)
    EndEvent

    Event OnUpdate()
        if (WaveD01.IsDead())
             tombDoor.setOpen()
        else
             Registerforsingleupdate(3)
        endif

    EndEvent



EndState  