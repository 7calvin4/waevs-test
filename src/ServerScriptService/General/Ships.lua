local ShipsStorage = game.ServerStorage.Ships
return {
	--[[
	
	Ship = {
		Name = "Ship_Name"; -- SPACE = _
		Speed = 69; -- in kts
		Acceleration = 10;
		Deacceleration = 1;
		TurningSpeed = 3;
		TurningPower = 3;
		LaunchOffset = Vector3.new(0,0,0);
		ShipModel = game.ServerStorage.skibiditoilet;
	};
	
	]]

	IceBreaker = {
		Name = "Ze_Icebreaker";
		Speed = 25;
		Acceleration = 3;
		Deacceleration = 1;
		TurningSpeed = 3;
		TurningPower = 3;
		LaunchOffset = Vector3.new(0,0,0);
		ShipModel = ShipsStorage.IceBreaker;
	};

	Atlas = {
		Name = "Atlas";
		Speed = 21;
		Acceleration = 2;
		Deacceleration = 1;
		TurningSpeed = 3;
		TurningPower = 3;
		LaunchOffset = Vector3.new(0,-37,0);
		ShipModel = ShipsStorage.Atlas;
	};

	SpeedyBoat = {
		Name = "Speedy_Boat";
		Speed = 65;
		Acceleration = 10;
		Deacceleration = 1;
		TurningSpeed = 3;
		TurningPower = 3;
		LaunchOffset = Vector3.new(0,-2,0);
		ShipModel = ShipsStorage["Speedy Boat"];
	};

	TripleE = {
		Name = "Triple_E";
		Speed = 1000;
		Acceleration = 10;
		Deacceleration = 1;
		TurningSpeed = 3;
		TurningPower = 3;
		LaunchOffset = Vector3.new(0,0,0);
		ShipModel = ShipsStorage["TripleE"];
	};
}
