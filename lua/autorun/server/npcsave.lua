include( "autorun/bhm_config.lua" )

buyerNpc = "bhm_infobuyer" 

function SpawnNpc()

    for _, npc in ipairs ( bhm_config.npcData ) do

  		local ent = ents.Create ( buyerNpc )
  		ent:SetPos( npc.pos )
  		ent:SetAngles( npc.ang )
  		ent:Spawn() 

  	end

end
hook.Add("InitPostEntity", "bhm_spawn", SpawnNpc)