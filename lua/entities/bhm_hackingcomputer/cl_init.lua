include ( "shared.lua" )

function ENT:Draw()

  self:DrawModel()

end

net.Receive("bhm_sendopenpcterminal", function()

  local selfUse = net.ReadEntity()

  local toprightbuttons = Material( "materials/dui/topright_buttons.png", "noclamp smooth" )

surface.CreateFont( "Terminal", {
    font = "Ubuntu Mono",
    size = 18,
    weight = 500,
    scanlines = 0,
    antialias = true,
})

local bhm_menu = vgui.Create( "DFrame" )
	bhm_menu:SetSize( ScrW() / 2, ScrH() / 2 )
	bhm_menu:Center()
	bhm_menu:ShowCloseButton( false )
	bhm_menu:SetSizable( false )
	bhm_menu:SetDraggable( true )
	bhm_menu:MakePopup()
	bhm_menu:SetDeleteOnClose( true )
	bhm_menu:SetTitle( "" )
	bhm_menu:SetVisible( true )
	bhm_menu.Paint = function ( self, w, h )
		draw.RoundedBox( 0, 0, 5, bhm_menu:GetWide(), bhm_menu:GetTall(), Color( 48, 10, 36, 255 ) )
		draw.RoundedBox( 5, 0, 0, bhm_menu:GetWide(), 25,  Color( 69, 69, 69, 255 ) )
		surface.SetDrawColor( 255, 255, 255, 255 )
		surface.SetDrawColor( 0,255,0,255 )
		
		surface.SetFont( "Terminal" )
		surface.SetTextColor( 255, 255, 255, 255 )
		surface.SetTextPos( 1, 25 )
		surface.DrawText( "terminal@ubuntu:~$" )
	end
	
	local bhm_hackbutton = vgui.Create( "DButton",bhm_menu )
	bhm_hackbutton:SetSize( 300, 50 )
	bhm_hackbutton:SetText( "Start Hacking" )
	bhm_hackbutton:SetFont( "Terminal" )
	bhm_hackbutton:SetTextColor(Color(255,255,255,255))
	bhm_hackbutton:SetDark( false )
	bhm_hackbutton:SetMouseInputEnabled( true )
	bhm_hackbutton:Center()
	bhm_hackbutton.Paint = function()
		draw.RoundedBox( 0,0,0,bhm_hackbutton:GetWide(),bhm_hackbutton:GetTall(),Color( 0,0,0,100 ) )
		surface.SetDrawColor( 0,255,0,255 )
		surface.DrawOutlinedRect( 0,0,bhm_hackbutton:GetWide(),  bhm_hackbutton:GetTall() )
	end
	bhm_hackbutton.OnCursorEntered = function ()
		bhm_hackbutton:SetTextColor( Color(0,255,0,150) )
		draw.RoundedBox( 0,0,0,bhm_hackbutton:GetWide(),bhm_hackbutton:GetTall(),Color( 0,0,0,150 ) )
	end
	bhm_hackbutton.OnCursorExited  = function ()
		bhm_hackbutton:SetTextColor( Color( 255,255,255,255) )
		draw.RoundedBox( 0,0,0,bhm_hackbutton:GetWide(),bhm_hackbutton:GetTall(),Color( 0,0,0,100 ) )
	end

	bhm_hackbutton.DoClick = function ()
		bhm_hackbutton:SetTextColor( Color( 0,0,0,255 ) )
		draw.RoundedBox( 0,0,0,bhm_hackbutton:GetWide(),bhm_hackbutton:GetTall(), Color( 0,0,0,255 ) )
		net.Start( "bhm_sendhackstring" )
    net.WriteEntity( selfUse )
		net.SendToServer()
		bhm_menu:Remove()
	end
	
	local minimize = vgui.Create( "DButton", bhm_menu )
    minimize:SetSize( 15, 15 )
    minimize:SetPos( bhm_menu:GetWide() - 60, 5 )
    minimize:SetText( "" )
    minimize.DoClick = function()
        if IsValid(bhm_menu) then
            bhm_menu:Remove()
		end
	end
 
    minimize.Paint = function(self, w, h)
        surface.SetDrawColor( 255, 200, 0, 255 )
        surface.SetMaterial( toprightbuttons )
        surface.DrawTexturedRect( 0, 0, 15, 15 )
    end
	
	local close = vgui.Create( "DButton", bhm_menu )
    close:SetSize( 15, 15 )
    close:SetPos( bhm_menu:GetWide() - 20, 5 )
    close:SetText( "" )
    close.DoClick = function()
        if IsValid(bhm_menu) then
			    bhm_menu:Remove()
        end
    end
    close.Paint = function(self, w, h)
        surface.SetDrawColor( 255, 80, 80, 255 )
        surface.SetMaterial( toprightbuttons )
        surface.DrawTexturedRect( 0, 0, 15, 15 )
    end
	
	local resize = vgui.Create( "DButton", bhm_menu )
    resize:SetSize( 15, 15 )
    resize:SetPos( bhm_menu:GetWide() - 40, 5 )
    resize:SetText( "" )
    resize.DoClick = function()
		bhm_menu:SetSize( ScrW(),ScrH() )
        bhm_menu:Center()
        close:SetPos( ScrW() - 20, 5 )
        resize:SetPos( ScrW() - 40, 5 )
        minimize:SetPos( ScrW() - 60, 5 )
		bhm_hackbutton:Center()
	end
	resize.Paint = function(self, w, h)
        surface.SetDrawColor( 0, 255, 80, 255 )
        surface.SetMaterial( toprightbuttons )
        surface.DrawTexturedRect( 0, 0, 15, 15 )
  end

end)

net.Receive("Waiting", function()

  cam.Start3D2D(self:GetPos(), self:GetAngles(), 1)
    draw.SimpleText( "DONE", Terminal, 0, 0, Color( 255,255,255,255 ), 1, 1 )
  cam.End2D()

end)

function RecieveChatText( um )local r = um:ReadShort()
	local g = um:ReadShort()
	local b = um:ReadShort()
	local color = Color( r, g, b )
	local text = um:ReadString()
	
	chat.AddText( color, text )
end
usermessage.Hook( "chatmsg", RecieveChatText )