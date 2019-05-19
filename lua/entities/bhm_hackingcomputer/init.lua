AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
AddCSLuaFile( "autorun/bhm_config.lua" )


include('shared.lua')
include( "autorun/bhm_config.lua" )

// Net Strings
util.AddNetworkString( "bhm_sendopenpcterminal" )
util.AddNetworkString( "bhm_sendhackstring" )
util.AddNetworkString( "Waiting" )

function ENT:Initialize()

	self:SetModel( "models/props/cs_office/computer_case.mdl" )
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetUseType( SIMPLE_USE )

  local phys = self:GetPhysicsObject()
	 if (phys:IsValid()) then
		  phys:Wake()
	end

	self.isHacking = false
	self.isWaiting = false
	self.isVpnIn = false
	self.TimeAmount = bhm_config.HackTimeAmount

end

net.Receive( "bhm_sendhackstring", function( len, ply )

	local self = net.ReadEntity()
	self.endTime = CurTime() + self.TimeAmount
	self.isHacking = true
	ply:ChatPrint( "You have started hacking! Wait for your hacked account list to be created!" )

end)

function ENT:StartTouch( ENT )

	if ENT:GetClass() == "bhm_vpn" and self.isVpnIn == false then
		ENT:Remove()
		self.isVpnIn = true
	end

end

function ENT:Think()

	if self.isHacking == true then
		if self.endTime <= CurTime() and self.isVpnIn == true then
			local InfoCase = ents.Create( "bhm_infocase" )
			InfoCase:SetPos( self:GetPos() + Vector( 0,0,40 ) )
			InfoCase:Spawn()
			self.isHacking = false
			SendChatText( self.hackerIs, Color( 0, 255, 0 ), "You have successfully completed hacking! Go grab your info case and bring it to the dealer!" )
		end

		if self.endTime <= CurTime() and self.isVpnIn == false then
			self.isHacking = false
			self.hackerIs:wanted( stuff, "Hacking", bhm_config.arrestTime )
			SendChatText( self.hackerIs, Color(255, 0, 0 ), "You shouldv'e used a vpn! Now your in big trouble with the cops!" )
		end

	end

end

function SendChatText( player, color, text )
	umsg.Start( "chatmsg", player )
		umsg.Short( color.r )
		umsg.Short( color.g )
		umsg.Short( color.b )
		umsg.String( text )
	umsg.End()
end



function ENT:Use( activator, caller )

	if IsValid( caller ) and caller:IsPlayer() and self.isHacking == false then
		net.Start( "bhm_sendopenpcterminal" )
		net.WriteEntity( self )
		net.Send( caller )
		self.hackerIs = caller
	end

	if IsValid( caller ) and caller:IsPlayer() and self.isHacking == true then
		caller:ChatPrint ( "You are already hacking!" )
	end
end

 ENT.bhm_health = 250;
 
 function ENT:OnTakeDamage(dmg)

	self:TakePhysicsDamage(dmg); 
	if(self.bhm_health <= 0) then return; end 
 
	self.bhm_health = self.bhm_health - dmg:GetDamage(); 
 
	if(self.bhm_health <= 0) then 
		self:Remove(); 
	end

 end
