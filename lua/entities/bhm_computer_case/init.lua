AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('shared.lua')

function ENT:Initialize()

	self:SetModel( "models/props/cs_office/computer_caseb_p8.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )

  local phys = self:GetPhysicsObject()
	 if (phys:IsValid()) then
		  phys:Wake()
	end

	self.partsIn = false

end

function ENT:StartTouch( ENT )

	if ENT:GetClass() == "bhm_computercontents" and self.partsIn == false then

		self.partsIn = true
		ENT:Remove()
		local finishedComputer = ents.Create( "bhm_hackingcomputer" )
		finishedComputer:SetPos( self:GetPos() + Vector(0,0,25) )
		self:Remove()
		finishedComputer:Spawn()

	end

end
