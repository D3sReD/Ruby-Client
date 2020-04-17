--------------------[[ Ruby Client |To do list ]]-------------------- %appdata%\kosYLRyOICCSayceYCicqNKX\VUXlfkLqreWlGB
--Essayer encore d'augmenter les perfs du menu
--Développé les fonctionnalités


---------------------[[ Ruby Global Languages ]]---------------------
local Ruby_Client_Current_Version = "1.01"
local Ruby_Client_Latest_Version = "Soon !"--http.Get("https://raw.githubusercontent.com/D3sReD/Ruby-Client/master/latest-version.txt")

local Ruby_C_Option_Ex_Title = {"Ruby Client","Updater","Change Logs","Main Option"}
local Ruby_C_Option_Ex_GP1_Text = {"Current Version | ","Latest Version | ","Update (Not in-game)"}
local Ruby_C_Option_Ex_GP2_Text = "Soon !"--http.Get("https://raw.githubusercontent.com/D3sReD/Ruby-Client/master/change-logs.txt")
local Ruby_C_Option_Ex_GP3_Text = {"Menu Key"}

local Ruby_C_Main_Title = " "
local Ruby_C_Main_Version = "Version Développement "..Ruby_Client_Current_Version
---------------------[[ Ruby Global Variables ]]---------------------
local RubyMainWindowCooldown = 10
local last_action = globals.TickCount()

local Ruby_C_Active_tab_Status = 1
local Ruby_C_Active_Sidebar_Status = 1

local Ruby_C_Main_PosX = 100
local Ruby_C_Main_PosY = 300
local Ruby_C_Main_Height = 376
local Ruby_C_Main_Width = 600

local Ruby_C_M_Bar_Height = 24
local Ruby_C_M_Bar_Width = Ruby_C_Main_Width
local Ruby_C_M_Bar_adjust = 5

local Ruby_C_M_UnderBar_Height = 1
local Ruby_C_M_UnderBar_Width = Ruby_C_Main_Width

---------------------[[ Ruby Global Functions ]]---------------------
--[[local function Update() 
    currentScript = file.Open(GetScriptName(), "w")
    currentScript:Write(http.Get("https://raw.githubusercontent.com/D3sReD/Ruby-Client/master/RubyClient.lua"))
    currentScript:Close()
    LoadScript(GetScriptName())
end]]
local function inBounds(x, y, x1, y1)
	mx, my = input.GetMousePos()
    return mx >= x and mx <= x1 and my >= y and my <= y1;
end

function RoundedRectangle(r, g, b, a, posx, posy, posx2, posy2, round, tl, tr, bl, br)

	draw.Color(r,g,b,a)
	draw.RoundedRectFill( posx, posy, posx2, posy2, round, tl, tr, bl, br)

end

local RubyFontArial14 = draw.CreateFont( "Arial", 14 )
local RubyFontArialBlack20 = draw.CreateFont( "Arial Black", 20 )
function DrawText(font,r ,g ,b ,a, posx, posy, Text)

	draw.SetFont(font)
	draw.Color(r ,g ,b ,a)
	draw.Text(posx ,posy ,Text)
end
----------------------[[ Ruby  Global Window ]]----------------------
local Ruby_C_Option_Ex_Reference = gui.Reference("Settings")
local Ruby_C_Option_Ex_Tab = gui.Tab(Ruby_C_Option_Ex_Reference, "ruby.client.option.ex.tab", Ruby_C_Option_Ex_Title[1])

local Ruby_C_Option_Ex_GP1 = gui.Groupbox(Ruby_C_Option_Ex_Tab, Ruby_C_Option_Ex_Title[2], 16,16,295,300)
local Ruby_C_Option_Ex_GP1_Text1 = gui.Text( Ruby_C_Option_Ex_GP1, Ruby_C_Option_Ex_GP1_Text[1]..Ruby_Client_Current_Version)
local Ruby_C_Option_Ex_GP1_Text2 = gui.Text( Ruby_C_Option_Ex_GP1, Ruby_C_Option_Ex_GP1_Text[2]..Ruby_Client_Latest_Version)
if Ruby_Client_Latest_Version ~= nil then
    Ruby_C_Option_Ex_GP1_Text2:SetText(Ruby_C_Option_Ex_GP1_Text[2]..Ruby_Client_Latest_Version)
else
    Ruby_C_Option_Ex_GP1_Text2:SetText(Ruby_C_Option_Ex_GP1_Text[2].."Error, try to reload the script")
end
local Ruby_C_Option_Ex_GP1_Bp1 = gui.Button( Ruby_C_Option_Ex_GP1, Ruby_C_Option_Ex_GP1_Text[3], function() 
	print("Soon !")
	--[[if Ruby_Client_Current_Version ~= Ruby_Client_Latest_Version and Ruby_Client_Latest_Version ~= nil then
		print("[Ruby Client] Downloading file !")
		Update()
	else
		print("[Ruby Client] Already up to date !")
	end]]
end)

local Ruby_C_Option_Ex_GP2 = gui.Groupbox(Ruby_C_Option_Ex_Tab, Ruby_C_Option_Ex_Title[3], 328,16,295,300)
local Ruby_C_Option_Ex_GP2_Text = gui.Text(Ruby_C_Option_Ex_GP2, Ruby_C_Option_Ex_GP2_Text)

local Ruby_C_Option_Ex_GP3 = gui.Groupbox(Ruby_C_Option_Ex_Tab, Ruby_C_Option_Ex_Title[4], 16,185,295,300)
local Ruby_C_Option_Ex_GP3_Key1 = gui.Keybox( Ruby_C_Option_Ex_GP3, "ruby.client.option.ex.key1", Ruby_C_Option_Ex_GP3_Text[1], 45) --Default = 45 https://keycode.info/

local Ruby_C_Main = gui.Window( "ruby.client.main", Ruby_C_Main_Title, Ruby_C_Main_PosX, Ruby_C_Main_PosY, Ruby_C_Main_Width, Ruby_C_Main_Height )

local Ruby_C_Visuals1_GP1 = gui.Groupbox( Ruby_C_Main, "Option(s)", 176, 16, Ruby_C_Main_Width * 0.68,300 ) -- "Player FOV" --local Ruby_C_Visuals_GP1 = gui.Groupbox( Ruby_C_Main, "Test", 176, 16, 295,300 )

local Ruby_C_Visuals2_GP1 = gui.Groupbox( Ruby_C_Main, "Option(s)", 176, 16, Ruby_C_Main_Width * 0.68,300 ) -- "Skybox Changer"

local Ruby_C_Visuals3_GP1 = gui.Groupbox( Ruby_C_Main, "Option(s)", 176, 16, Ruby_C_Main_Width * 0.68,300 ) -- "Hand weapon switcher"

local Ruby_C_Visuals4_GP1 = gui.Groupbox( Ruby_C_Main, "Option(s)", 176, 16, Ruby_C_Main_Width * 0.68,300 ) -- "Quick switch AWP/Knive"

local Ruby_C_Visuals5_GP1 = gui.Groupbox( Ruby_C_Main, "Option(s)", 176, 16, Ruby_C_Main_Width * 0.68,300 ) -- "Custom nade ESP"

local Ruby_C_Visuals6_GP1 = gui.Groupbox( Ruby_C_Main, "Misc", 176, 16, Ruby_C_Main_Width * 0.68,300 ) -- "Misc"



local Ruby_C_Clantag_GP1 = gui.Groupbox( Ruby_C_Main, "Coming Soon ;) !", 16, 16, 295,300 )



local Ruby_C_Soon_GP1 = gui.Groupbox( Ruby_C_Main, "Coming soon and be patient xD !", 176, 16, Ruby_C_Main_Width * 0.68,300 )

-------------------[[ Ruby  Add Tabs or Onglets ]]-------------------
--Tabs Groups Settings
local Ruby_C_Tabs_Table_Name = {"Visuals","Clantag","Soon"}

local Ruby_C_M_Bar_Bp_Height = 16
local Ruby_C_M_Bar_Bp_Width = 105
local Ruby_C_M_Bar_Bp_adjust = 22
local Ruby_C_M_Bar_Decal = 105
local Ruby_C_M_Bar_Text_Decal = 20
local BpDecal = 55

--Onglets Groups Settings
local Ruby_C_Onglets_Table_Name = {
								 	{
								 	"Player FOV","Skybox Changer","Hand weapon switcher","Quick switch AWP/Knive","Custom nade ESP","Misc" --Onglet pour le Tab 1
								 	},

								 	{
										--Onglet pour le Tab 2
								 	},

								 	{
									"Soon"	--Onglet pour le Tab 3
								 	},
								 }

local Ruby_C_M_Onglets_Width = 160


--Witch groups is display         --{Tabs, Onglets, Groups To Display},
local Ruby_C_M_Groups_Display_Table = 	{	--Tabs 1
											{1, 1, Ruby_C_Visuals1_GP1},
											{1, 2, Ruby_C_Visuals2_GP1},
											{1, 3, Ruby_C_Visuals3_GP1},
											{1, 4, Ruby_C_Visuals4_GP1},
											{1, 5, Ruby_C_Visuals5_GP1},
											{1, 6, Ruby_C_Visuals6_GP1},
											--Tabs 2
											{2, 1, Ruby_C_Clantag_GP1},
											--Tabs 3
											{3, 1, Ruby_C_Soon_GP1},
										}

----------------------[[ Ruby  Global Window ]]----------------------
if Ruby_Client_Current_Version ~= Ruby_Client_Latest_Version and Ruby_Client_Latest_Version ~= nil then
    Ruby_C_Main_Version = Ruby_C_Main_Version.." (Update Available !)"
end

local Ruby_C_Main_Bar = gui.Custom( Ruby_C_Main, "ruby.client.main.bar", 1, 1, 1000, 1000, function()
	--Setup
	local RCMBx,RCMBy = Ruby_C_Main:GetValue()

	--Main Bar
	local x1B = RCMBx
	local y1B = RCMBy - Ruby_C_M_Bar_Height
	local x2B = RCMBx + Ruby_C_M_Bar_Width
	local y2B = RCMBy + Ruby_C_M_Bar_adjust
	RoundedRectangle(220, 40, 40, 255, x1B, y1B, x2B, y2B, 6, 1, 1, 0, 0)

	--Main underbar
	local x1UB = RCMBx
	local y1UB = RCMBy + Ruby_C_Main_Height - Ruby_C_M_Bar_Height
	local x2UB = RCMBx + Ruby_C_M_UnderBar_Width
	local y2UB = RCMBy + Ruby_C_Main_Height

	local x1UBT1 = x1UB + 10
	local y1UBT1 = y1UB + 6

	RoundedRectangle(220, 40, 40, 255, x1UB, y1UB, x2UB, y2UB, 6, 0, 0, 1, 1)

	DrawText(RubyFontArialBlack20 ,255 ,255 ,255 ,255 , x1UBT1 ,y1UBT1 ,Ruby_C_Main_Version)

	--Tabs Creator/Manager --(pas sur --peut etre source de crash (a mettre avant onglet))
	local x1Bp = RCMBx + BpDecal
	local y1Bp = RCMBy - Ruby_C_M_Bar_Bp_Height
	local x2Bp = RCMBx + Ruby_C_M_Bar_Bp_Width + BpDecal
	local y2Bp = RCMBy + Ruby_C_M_Bar_Bp_adjust

	local x2BGP = RCMBx + (Ruby_C_M_Bar_Bp_Width * #Ruby_C_Tabs_Table_Name) + BpDecal

	local xBpT = x1Bp + Ruby_C_M_Bar_Text_Decal
	local yBpT = y1Bp + 12

	RoundedRectangle(140, 30, 30, 255 , x1Bp, y1Bp, x2BGP, y2Bp, 6, 1, 1, 0, 0)

	for i, v in ipairs(Ruby_C_Tabs_Table_Name) do
		if Ruby_C_Active_tab_Status == i then
			if Ruby_C_Active_tab_Status == 1 then
				RoundedRectangle(220, 60, 60, 255 , x1Bp, y1Bp, x2Bp, y2Bp, 6, 1, 0, 0, 0)
			elseif Ruby_C_Active_tab_Status == #Ruby_C_Tabs_Table_Name then -- (next(Ruby_C_Tabs_Table_Name,i) == nil)
				RoundedRectangle(220, 60, 60, 255 , x1Bp, y1Bp, x2Bp, y2Bp, 6, 0, 1, 0, 0)
			else
				RoundedRectangle(220, 60, 60, 255 , x1Bp, y1Bp, x2Bp, y2Bp, 6, 0, 0, 0, 0)
			end
		end
		DrawText(RubyFontArialBlack20 ,255 ,255 ,255 ,255 , xBpT, yBpT, v)

		if inBounds(x1Bp, y1Bp, x2Bp, y2Bp) and input.IsButtonReleased(1) then
			Ruby_C_Active_tab_Status = i
			Ruby_C_Active_Sidebar_Status = 1
		end

		x1Bp = x1Bp + Ruby_C_M_Bar_Decal
		x2Bp = x2Bp + Ruby_C_M_Bar_Decal
		xBpT = xBpT + Ruby_C_M_Bar_Decal
	end

	--Sidebar group
	local x1SB = RCMBx
	local y1SB = RCMBy + 24
	local x2SB = RCMBx + Ruby_C_M_Onglets_Width
	local y2SB = RCMBy + Ruby_C_Main_Height - 24

	local x1SBT1 = x1SB + 12
	local y1SBT1 = y1SB + 12

	local Ruby_C_Onglets_Table_Name_Selected = Ruby_C_Onglets_Table_Name[Ruby_C_Active_tab_Status]

	if next(Ruby_C_Onglets_Table_Name_Selected) ~= nil then
		RoundedRectangle(0, 0, 0, 100, x1SB, y1SB, x2SB, y2SB, 6, 0, 0, 0, 0)
	end

	--Onglet Setup
	draw.SetFont(RubyFontArial14)

	local y1y2BP = y1SB

	local y1y2BPText = y1SBT1

	for i, v in ipairs(Ruby_C_Onglets_Table_Name_Selected) do

		if Ruby_C_Active_Sidebar_Status == i then

			RoundedRectangle(50, 50, 50, 255, x1SB, y1y2BP, x2SB, y1y2BP + 34, 6, 0, 0, 0, 0)
			RoundedRectangle(220, 40, 40, 255, x1SB, y1y2BP, x1SB + 4, y1y2BP + 34, 0, 0, 0, 0, 0)

			draw.Color(220, 40, 40, 255)
		else

			draw.Color(255 ,255 ,255 ,255)

		end

		draw.Text(x1SBT1 ,y1y2BPText ,v)

		if inBounds(x1SB, y1y2BP , x2SB, y1y2BP + 34) and input.IsButtonReleased(1) then
			Ruby_C_Active_Sidebar_Status = i
		end

		y1y2BP = y1y2BP + 40
		y1y2BPText = y1y2BPText + 40

	end

	--Groups draws Manager
	for i , v in ipairs(Ruby_C_M_Groups_Display_Table) do

		if v[1] == Ruby_C_Active_tab_Status and v[2] == Ruby_C_Active_Sidebar_Status then
			v[3]:SetInvisible(false)
		else
			v[3]:SetInvisible(true)
		end

	end

end)

function RubyWindowGUIManager()

	local RubyKeyPress = Ruby_C_Option_Ex_GP3_Key1:GetValue()
	local RubyMainWindowStatus = Ruby_C_Main:IsActive()

	if (last_action ~= nil and last_action > globals.TickCount()) then
        last_action = globals.TickCount();
    end

	if not RubyMainWindowStatus and input.IsButtonReleased(RubyKeyPress) and globals.TickCount() - last_action > RubyMainWindowCooldown then

		last_action = globals.TickCount()
		Ruby_C_Main:SetActive(1)
		
	return elseif RubyMainWindowStatus and input.IsButtonReleased(RubyKeyPress) and globals.TickCount() - last_action > RubyMainWindowCooldown then

		last_action = globals.TickCount()
		Ruby_C_Main:SetActive(0)

	return end

end

callbacks.Register("Draw", RubyWindowGUIManager)


----------------------[[ Ruby  FOV Functions ]]----------------------
local Ruby_FOV_Enable = gui.Checkbox( Ruby_C_Visuals1_GP1, "ruby.visuals.fov.enable", "Field of view override", false )
local Ruby_FOV_Slider = gui.Slider(Ruby_C_Visuals1_GP1, "ruby.visuals.fov.slider", "Ruby_Visuals_FOV_Text", 90, 1, 170 )

local Ruby_Visuals_Misc_GESP_Enable = gui.Checkbox( Ruby_C_Visuals5_GP1, "ruby.visuals.nade.esp", "Nade ESP", false )
local Ruby_Visuals_Misc_GESP_ColorPicker = gui.ColorPicker( Ruby_Visuals_Misc_GESP_Enable, "ruby.visuals.nade.esp.color", "Color", 255, 0, 0, 255 )

local Ruby_EngineRadarchek = gui.Checkbox(Ruby_C_Visuals6_GP1, "ruby.visuals.srh.enable", "Radar ESP", false )
function ruby_visuals()
	local Ruby_LocalPlayer = entities.GetLocalPlayer()
	if Ruby_FOV_Enable:GetValue() then
		if Ruby_LocalPlayer:GetProp("m_bIsScoped") == 0 or Ruby_LocalPlayer:GetProp("m_bIsScoped") == 256 then
			client.SetConVar( "fov_cs_debug", Ruby_FOV_Slider:GetValue(), true )
		else
			client.SetConVar( "fov_cs_debug", 0, true )
		end
	end

	---- Simple Radar hack ----
	for index, Player in pairs(entities.FindByClass("CCSPlayer")) do
  		if not Ruby_EngineRadarchek:GetValue() then        
    		Player:SetProp("m_bSpotted", 0);
    	else
	    	Player:SetProp("m_bSpotted", 1);

    	end
	end

	----Nade ESP ----
	if Ruby_Visuals_Misc_GESP_Enable:GetValue() then
		local nades = entities.FindByClass( "CBaseCSGrenadeProjectile" );
		for i = 1, #nades do
			local x, y = client.WorldToScreen( nades[ i ]:GetAbsOrigin() );
			if x ~= nil then
				draw.Color( 0, 0, 0, 250 )
				draw.FilledRect( x - 1, y - 1, x + 7, y + 7);

				draw.Color( Ruby_Visuals_Misc_GESP_ColorPicker:GetValue() );			
				draw.FilledRect( x, y, x + 5, y + 5);
			end
		end
	end

end
callbacks.Register("Draw", "rubyvisuals", ruby_visuals)
---------------------[[ Ruby Skybox Functions ]]---------------------
-- Skybox list.
-- { file name, display name }
local skybox_list = {
    {"sky_descent", "Galaxy"},
    {"bartuc_canyon_", "Bartuc Canyon"},
    {"bartuc_grey_sky_", "Bartuc Grey"},
    {"blue1", "Blue One"},
    {"blue2", "Blue Two"},
    {"blue3", "Blue Three"},
    {"blue4", "Blue Four"},
    {"blue5", "Blue Five"},
    {"blue6", "Blue Six"},
    {"cssdefault", "Css Default"},
    {"dark1", "Dark One"},
    {"dark2", "Dark Two"},
    {"dark3", "Dark Three"},
    {"dark4", "Dark Four"},
    {"dark5", "Dark Five"},
    {"extreme_glaciation_", "Extreme Glaciation"},
    {"green1", "Green One"},
    {"green2", "Green Two"},
    {"green3", "Green Three"},
    {"green4", "Green Four"},
    {"green5", "Green Five"},
    {"greenscreen", "Green Screen"},
    {"greysky", "Grey Sky"},
    {"night1", "Night One"},
    {"night2", "Night Two"},
    {"night3", "Night Three"},
    {"night4", "Night Four"},
    {"night5", "Night Five"},
    {"orange1", "Orange One"},
    {"orange2", "Orange Two"},
    {"orange3", "Orange Three"},
    {"orange4", "Orange Four"},
    {"orange5", "Orange Five"},
    {"orange6", "Orange Six"},
    {"persistent_fog_", "Persistent Fog"},
    {"pink1", "Pink One"},
    {"pink2", "Pink Two"},
    {"pink3", "Pink Three"},
    {"pink4", "Pink Four"},
    {"pink5", "Pink Five"},
    {"polluted_atm_", "Polluted"},
    {"toxic_atm_", "Toxic"},
    {"water_sunset_", "Water Sunset"}
}


local arglist = {}
local arg_to_name = {}
for num, sky in ipairs(skybox_list) do
    arglist[num] = sky[2]
    arg_to_name[num - 1] = sky[1]
end

local nightmode = gui.Slider(Ruby_C_Visuals2_GP1, "lua_nightmode_value", "Night Mode", 100, 0.5, 100);
local lua_combobox = gui.Combobox(Ruby_C_Visuals2_GP1, "lua_skyboxppicker", "Skybox picker", unpack(arglist))

local function getSkyboxName(sel)
    return arg_to_name[sel]
end

function SkyBox()
    local skybox_current = client.GetConVar("sv_skyname")
    local skybox_new = lua_combobox:GetValue()
    local skybox_new_name = getSkyboxName(skybox_new)

    if skybox_current ~= skybox_new_name then
        client.SetConVar("sv_skyname", skybox_new_name, true)
    end

    local controller = entities.FindByClass("CEnvTonemapController")[1];

    if controller then
        controller:SetProp("m_bUseCustomAutoExposureMin", 1);
        controller:SetProp("m_bUseCustomAutoExposureMax", 1);

        controller:SetProp("m_flCustomAutoExposureMin", nightmode:GetValue() / 100);
        controller:SetProp("m_flCustomAutoExposureMax", nightmode:GetValue() / 100);
    end
end

callbacks.Register("Draw", "SkyBox", SkyBox)



local Ruby_Visuals_Misc_Knive_Mode = gui.Combobox( Ruby_C_Visuals3_GP1, "ruby.visuals.knive.mode", "Mode", "Off","Left", "On key")  --Checkbox( Ruby_Visuals_GP3, "ruby.visuals.knive.enable", "Knive on left hand", false )
local Ruby_Visuals_Misc_Knive_Key_Switch = gui.Keybox( Ruby_C_Visuals3_GP1, "ruby.visuals.knive.key.enable", "Switch key", 0 )

local Ruby_Knive_Switch_Key_Status = 0
last_knive_action = 0
local RubyKniveSwitchCooldown = 10

function ruby_auto_knive_on_left_hand(Event)
	if Ruby_Visuals_Misc_Knive_Mode:GetValue() == 1 then
    	if (Event:GetName() ~= "item_equip") then
        	return
    	end

    	if (client.GetLocalPlayerIndex() == client.GetPlayerIndexByUserID(Event:GetInt("userid"))) then
        	if Event:GetString("item") == "knife" then
            	client.Command( "cl_righthand 0", true );
        	else
            	client.Command( "cl_righthand 1", true );
        	end
    	end
    end
end

client.AllowListener("item_equip")
callbacks.Register("FireGameEvent", "ruby_knive_on_left_hand", ruby_auto_knive_on_left_hand)

function ruby_manual_switch_weapon()

	if (last_knive_action ~= nil and last_knive_action > globals.TickCount()) then
        last_knive_action = globals.TickCount();
    end

    if Ruby_Visuals_Misc_Knive_Mode:GetValue() == 2  then --and Ruby_Visuals_Misc_Knive_Key_Switch:GetValue() ~= 0
    	


    	if Ruby_Visuals_Misc_Knive_Key_Switch:GetValue() ~= 0 then

    		if Ruby_Knive_Switch_Key_Status == 0 and input.IsButtonDown(Ruby_Visuals_Misc_Knive_Key_Switch:GetValue()) and globals.TickCount() - last_knive_action > RubyKniveSwitchCooldown then
    			last_knive_action = globals.TickCount()
    			client.Command( "cl_righthand 0", true )
    			Ruby_Knive_Switch_Key_Status = 1
    		return elseif Ruby_Knive_Switch_Key_Status == 1 and input.IsButtonDown(Ruby_Visuals_Misc_Knive_Key_Switch:GetValue()) and globals.TickCount() - last_knive_action > RubyKniveSwitchCooldown then 
				last_knive_action = globals.TickCount()
    			client.Command( "cl_righthand 1", true )
    			Ruby_Knive_Switch_Key_Status = 0
    		return end
    	end
    end
end
callbacks.Register("Draw", ruby_manual_switch_weapon)


local quickswitch = gui.Checkbox(Ruby_C_Visuals4_GP1, 'lua_quick_switch', "Enable", 0)

local uid_to_idx = client.GetPlayerIndexByUserID;
local get_local_player = client.GetLocalPlayerIndex;
local in_action
local equipped

local function on_weapon_fire( _event )
    if quickswitch:GetValue() then
    if ( _event:GetName( ) ~= 'weapon_fire' ) then
        return;
    end

    if (gui.GetValue("misc.fakelatency.enable")) then
        return;
    end

    local _local = get_local_player( );
    local _id = _event:GetInt('userid');

    if ( _local == uid_to_idx( _id ) ) then
        local _weapon = _event:GetString( 'weapon' );

        if ( _weapon == 'weapon_awp' ) then
            client.Command( 'slot3', true )
            flip = true;
        end
    end
end
end
client.AllowListener( 'weapon_fire' );
callbacks.Register( 'FireGameEvent', 'on_weapon_fire', on_weapon_fire );
local function on_item_equip( _event )
    if ( _event:GetName( ) ~= 'item_equip' ) then
        return;
    end

    local _local = get_local_player( );
    local _id = _event:GetInt( 'userid' );
    local _item =  _event:GetString( 'item' );

    if ( _local == uid_to_idx( _id ) ) then
        equipped = _item;
    end
end

client.AllowListener( 'item_equip' );
callbacks.Register( 'FireGameEvent', 'on_item_equip', on_item_equip );
function reset_tick( _cmd )
  if ( flip ) then
        if ( equipped ~= 'awp' ) then
            client.Command( "slot1", true )
            flip = false;
        end
    end
end

callbacks.Register( 'CreateMove', 'reset_tick', reset_tick )

