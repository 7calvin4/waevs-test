local ThrottleStep = 0

game.Players.LocalPlayer:GetMouse().KeyDown:Connect(function(Key)
	if Key == "x" then
		script.Throttle.Value = 0
		game.ReplicatedStorage.Game.Events.Ship.SetThrottle:FireServer(script.Throttle.Value)
	end
end)

game.Players.LocalPlayer:GetMouse().KeyUp:Connect(function(Key)
end)

game["Run Service"].Heartbeat:Connect(function()
	game.ReplicatedStorage.Game.Events.Ship.SetThrottle:FireServer(script.Throttle.Value)

	if script.Ship.Value:FindFirstChild("VehicleSeat") then
		if script.Ship.Value:FindFirstChild("VehicleSeat").Throttle == 1 then
			script.Throttle.Value += 1
			game.ReplicatedStorage.Game.Events.Ship.SetThrottle:FireServer(script.Throttle.Value)
		elseif script.Ship.Value:FindFirstChild("VehicleSeat").Throttle == -1 then
			script.Throttle.Value -= 1
		end
	end
	
	if script.Throttle.Value > script.ThrottleMax.Value then
		script.Throttle.Value = script.ThrottleMax.Value
	elseif script.Throttle.Value < script.ThrottleMin.Value then
		script.Throttle.Value = script.ThrottleMin.Value
	end
	
	script.Parent.Center.Stats.Speed.UIGradient.Offset = Vector2.new(script.Throttle.Value / script.ThrottleMax.Value, 0)
	script.Parent.Center.Stats.Throttle.Text = "Throttle "..script.Throttle.Value.."%"
end)