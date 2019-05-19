AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('shared.lua')
include( "autorun/bhm_config.lua" )

function ENT:Initialize()

	self:SetModel( "models/gman_high.mdl" )
	self:SetHullType( HULL_HUMAN )
	self:SetHullSizeNormal( )
	self:SetTrigger( true )
	self:SetNPCState( NPC_STATE_SCRIPT )
	self:SetSolid( SOLID_BBOX )
	self:CapabilitiesAdd( CAP_ANIMATEDFACE )
	self:CapabilitiesAdd( CAP_TURN_HEAD )
	self:SetUseType( SIMPLE_USE )
	self:DropToFloor()

  	local phys = self:GetPhysicsObject()
	 	if (phys:IsValid()) then
			  phys:Wake()
		end

end

function ENT:StartTouch( ENT )

	if ENT:GetClass() == "bhm_infocase" then
		ENT:Remove()
		DarkRP.createMoneyBag( self:GetPos() + Vector(0, 25, 5), bhm_config.PayoutAmount )
	end

end

function ENT:AcceptInput ( name, activator, caller, data )

	if IsValid( caller ) and caller:IsPlayer() then
		caller:ChatPrint( "Sell Me Your Hacked Accounts!" )
	end

end
