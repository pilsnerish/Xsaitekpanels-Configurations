-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.

if AIRCRAFT_FILENAME == "CL650.acf" then
	dataref("CL650_xsaitekpanels_Vertical_Velocity", "sim/cockpit/autopilot/vertical_velocity", "writable")

	dataref("CL650_xsaitekpanels_Float1", "bgood/xsaitekpanels/sharedata/float1", "writable")
--	dataref("CL650_xsaitekpanels_Float2", "bgood/xsaitekpanels/sharedata/float2", "writable")
	dataref("CL650_xsaitekpanels_Float3", "bgood/xsaitekpanels/sharedata/float3", "writable")
	dataref("CL650_xsaitekpanels_Float4", "bgood/xsaitekpanels/sharedata/float4", "writable")
	dataref("CL650_xsaitekpanels_Float5", "bgood/xsaitekpanels/sharedata/float5", "writable")

	dataref("CL650_xsaitekpanels_FCC_0_ALT_SEL",	"abus/CL650/ARINC429/L-FCC-1/words/FCC/0/ALT_SEL")
	dataref("CL650_xsaitekpanels_FCC_0_VS_TGT_TGT",	"abus/CL650/ARINC429/L-FCC-1/words/FCC/0/VS_TGT_TGT")
	dataref("CL650_xsaitekpanels_FCC_0_IAS_SEL",	"abus/CL650/ARINC429/L-FCC-1/words/FCC/0/IAS_SEL")
	dataref("CL650_xsaitekpanels_FCC_0_HDG_SEL",	"abus/CL650/ARINC429/L-FCC-1/words/FCC/0/HDG_SEL")
	dataref("CL650_xsaitekpanels_FCC_0_CRS_SEL",	"abus/CL650/ARINC429/L-FCC-1/words/FCC/0/CRS_SEL")

	function CL650_xsaitekpanels_m2ft(m)
		if (not(m ~= m)) then
			local ft = m * 3.2808399
			return math.floor(ft + 0.5)
		end
	end

	function CL650_xsaitekpanels_mps2fpm(mps)
		if (not(mps ~= mps)) then
			return mps * 3.2808399 * 60
		end
	end

	function CL650_xsaitekpanels_mps2kts(mps)
		if (not(mps ~= mps)) then
			return mps * 1.9438444924406
		end
	end

	function CL650_xsaitekpanels_FCC_to_XSP()
		CL650_xsaitekpanels_Float1 = CL650_xsaitekpanels_m2ft(CL650_xsaitekpanels_FCC_0_ALT_SEL)
		CL650_xsaitekpanels_Vertical_Velocity = CL650_xsaitekpanels_mps2fpm(CL650_xsaitekpanels_FCC_0_VS_TGT_TGT)
		CL650_xsaitekpanels_Float3 = CL650_xsaitekpanels_mps2kts(CL650_xsaitekpanels_FCC_0_IAS_SEL)
		CL650_xsaitekpanels_Float4 = CL650_xsaitekpanels_FCC_0_HDG_SEL
		CL650_xsaitekpanels_Float5 = CL650_xsaitekpanels_FCC_0_CRS_SEL
	end

	do_every_frame("CL650_xsaitekpanels_FCC_to_XSP()")
end
