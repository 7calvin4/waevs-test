local pi2 = math.pi*2

local module = {}

function module.GetTransform(WaveData, GridP, RunTime)
	local p = Vector3.new()
	for i,Wave in pairs(WaveData) do
		p = p + module.Calculate(Wave, GridP, RunTime)
	end

	return p
end

function module.GetHeightAndNormal(WaveData, GridP, RunTime)
	local p = Vector3.new()
	local tan = Vector3.new(1,0,0)
	local bi = Vector3.new(0,0,1)

	for i,Wave in pairs(WaveData) do
		local _p, _tan, _bi = module.Calculate(Wave, GridP, RunTime, true)
		p = p + _p
		tan = tan + _tan
		bi = bi + _bi
	end

	return p, tan, bi
end

function module.Calculate(Wave, GridP, RunTime, Ret)
	local steepness = Wave.z
	local wavelength = Wave.w
	local k = pi2/wavelength
	local c = math.sqrt(9.8/k)
	local d = Vector2.new(Wave.x, Wave.y).unit
	local f = k*(d:Dot(Vector2.new(GridP.x,GridP.z)) - c * RunTime)
	local a = steepness/k

	local cosf = math.cos(f)
	local sinf = math.sin(f)
	--
	local tangent, binormal

	if Ret then
		tangent = Vector3.new(-d.x*d.x*(steepness*sinf), d.x*(steepness*cosf), -d.x*d.y*(steepness*sinf))
		binormal = Vector3.new(-d.x*d.y*(steepness*sinf), d.y*(steepness*cosf), -d.y*d.y*(steepness*sinf))
	end
	--
	return Vector3.new(d.x*(a*cosf), a*sinf, d.y*(a*cosf)), tangent, binormal
end


return module
