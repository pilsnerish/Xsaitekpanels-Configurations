-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.

if AIRCRAFT_FILENAME == "a319_StdDef.acf" or AIRCRAFT_FILENAME == "a319.acf" then
	dataref("Speedbrake_Ratio", "sim/cockpit2/controls/speedbrake_ratio", "writable")
	
	-- "JOYSTICK" FUNCTIONS
	function a319_xsaitekpanels_toggle_arm_gnd_splr()
		if Speedbrake_Ratio == 0.0 then
			Speedbrake_Ratio = -0.5
		elseif Speedbrake_Ratio == -0.5 then
			Speedbrake_Ratio = 0.0
		end
	end
	create_command("FlyWithLua/a319_xsaitekpanels/toggle_arm_gnd_splr", "Toggle arming of ground spoilers.", "a319_xsaitekpanels_toggle_arm_gnd_splr()", "", "")

	function a319_xsaitekpanels_toggle_fd()
		command_once("toliss_airbus/fd1_push")
		command_once("toliss_airbus/fd2_push")
	end
	create_command("FlyWithLua/a319_xsaitekpanels/toggle_fd", "Toggle flight directors.", "a319_xsaitekpanels_toggle_fd()", "", "")

	-- XSAITEKPANELS FUNCTIONS
	AirbusFBW_ADIRUSwitchArray = dataref_table("AirbusFBW/ADIRUSwitchArray")
	AirbusFBW_OHPLightSwitches = dataref_table("AirbusFBW/OHPLightSwitches")
	
	function a319_xsaitekpanels_adiru_off()
		AirbusFBW_ADIRUSwitchArray[0] = 0
		AirbusFBW_ADIRUSwitchArray[1] = 0
		AirbusFBW_ADIRUSwitchArray[2] = 0
	end
	create_command("FlyWithLua/a319_xsaitekpanels/adiru_off", "Rotate ADIRU switches to OFF.", "a319_xsaitekpanels_adiru_off()", "", "")
	
	function a319_xsaitekpanels_adiru_nav()
		AirbusFBW_ADIRUSwitchArray[0] = 1
		AirbusFBW_ADIRUSwitchArray[1] = 1
		AirbusFBW_ADIRUSwitchArray[2] = 1
	end
	create_command("FlyWithLua/a319_xsaitekpanels/adiru_nav", "Rotate ADIRU switches to NAV.", "a319_xsaitekpanels_adiru_nav()", "", "")
	
	function a319_xsaitekpanels_nav_logo_off()
		AirbusFBW_OHPLightSwitches[2] = 0
	end
	create_command("FlyWithLua/a319_xsaitekpanels/nav_logo_off", "Move navigation light switch to OFF.", "a319_xsaitekpanels_nav_logo_off()", "", "")
	
	function a319_xsaitekpanels_nav_logo_1()
		AirbusFBW_OHPLightSwitches[2] = 1
	end
	create_command("FlyWithLua/a319_xsaitekpanels/nav_logo_1", "Move navigation light switch to 1.", "a319_xsaitekpanels_nav_logo_1()", "", "")
	
	function a319_xsaitekpanels_strobe_off()
		AirbusFBW_OHPLightSwitches[7] = 0
	end
	create_command("FlyWithLua/a319_xsaitekpanels/strobe_off", "Move strobe light switch to OFF.", "a319_xsaitekpanels_strobe_off()", "", "")
	
	function a319_xsaitekpanels_strobe_auto()
		AirbusFBW_OHPLightSwitches[7] = 1
	end
	create_command("FlyWithLua/a319_xsaitekpanels/strobe_auto", "Move strobe light switch to AUTO.", "a319_xsaitekpanels_strobe_auto()", "", "")
	
	function a319_xsaitekpanels_nose_off()
		AirbusFBW_OHPLightSwitches[3] = 0
	end
	create_command("FlyWithLua/a319_xsaitekpanels/nose_off", "Move nose light switch to OFF.", "a319_xsaitekpanels_nose_off()", "", "")
	
	function a319_xsaitekpanels_nose_taxi()
		AirbusFBW_OHPLightSwitches[3] = 1
	end
	create_command("FlyWithLua/a319_xsaitekpanels/nose_taxi", "Move nose light switch to TAXI.", "a319_xsaitekpanels_nose_taxi()", "", "")
	
	function a319_xsaitekpanels_nose_to()
		AirbusFBW_OHPLightSwitches[3] = 2
	end
	create_command("FlyWithLua/a319_xsaitekpanels/nose_to", "Move nose light switch to TO.", "a319_xsaitekpanels_nose_to()", "", "")
end
