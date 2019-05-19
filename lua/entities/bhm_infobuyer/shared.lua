ENT.Base = "base_ai" -- This entity is based on "base_ai"
ENT.Type = "ai" -- What type of entity is it, in this case, it's an AI.
ENT.AutomaticFrameAdvance = true -- This entity will animate itself.
ENT.PrintName		= "Hacking Info Buyer"
ENT.Author			= "BloodyMustache"
ENT.Contact			= "Don't"
ENT.Purpose			= "Hacking Mod"
ENT.Spawnable   = true
ENT.Category    = "BloodysComputerHacking"
function ENT:SetAutomaticFrameAdvance( bUsingAnim ) -- This is called by the game to tell the entity if it should animate itself.
	self.AutomaticFrameAdvance = bUsingAnim
end