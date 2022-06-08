-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.

if AIRCRAFT_FILENAME == "CL650.acf" then
	dataref("SIM_VERTICAL_VELOCITY", "sim/cockpit/autopilot/vertical_velocity", "writable")

	dataref("XSP_F1", "bgood/xsaitekpanels/sharedata/float1", "writable")
	-- dataref("XSP_F2", "bgood/xsaitekpanels/sharedata/float2", "writable")
	dataref("XSP_F3", "bgood/xsaitekpanels/sharedata/float3", "writable")
	dataref("XSP_F4", "bgood/xsaitekpanels/sharedata/float4", "writable")
	dataref("XSP_F5", "bgood/xsaitekpanels/sharedata/float5", "writable")

	dataref("CL650_ARINC429_FCC_0_ALT_SEL", "abus/CL650/ARINC429/FDCU-1/words/FCC/0/ALT_SEL")
	dataref("CL650_ARINC429_FCC_0_VS_TGT",  "abus/CL650/ARINC429/FDCU-1/words/FCC/0/VS_TGT")
	dataref("CL650_ARINC429_FCC_0_IAS_SEL", "abus/CL650/ARINC429/FDCU-1/words/FCC/0/IAS_SEL")
	dataref("CL650_ARINC429_FCC_0_HDG_SEL", "abus/CL650/ARINC429/FDCU-1/words/FCC/0/HDG_SEL")
	dataref("CL650_ARINC429_FCC_0_CRS_SEL", "abus/CL650/ARINC429/FDCU-1/words/FCC/0/CRS_SEL")

	function CL650_m2ft(m)
		if (not(m ~= m)) then
			local ft = m * 3.2808399
			ft = math.ceil(ft)
			ft = ft - (ft % 10)
			return ft
		end
	end

	function CL650_mps2fpm(mps)
		if (not(mps ~= mps)) then
			return mps * 3.2808399 * 60
		end
	end

	function CL650_mps2kts(mps)
		if (not(mps ~= mps)) then
			return mps * 1.9438444924406
		end
	end

	function CL650_ARINC429_FCC()
		XSP_F1 = CL650_m2ft(CL650_ARINC429_FCC_0_ALT_SEL)
		SIM_VERTICAL_VELOCITY = CL650_mps2fpm(CL650_ARINC429_FCC_0_VS_TGT)
		XSP_F3 = CL650_mps2kts(CL650_ARINC429_FCC_0_IAS_SEL)
		XSP_F4 = CL650_ARINC429_FCC_0_HDG_SEL
		XSP_F5 = CL650_ARINC429_FCC_0_CRS_SEL
	end

	do_every_frame("CL650_ARINC429_FCC()")
end
