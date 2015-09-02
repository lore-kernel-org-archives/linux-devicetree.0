From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v3 5/6] ARM: STiH407: Add nodes for RemoteProc
Date: Wed,  2 Sep 2015 16:38:08 +0100
Message-ID: <1441208289-17330-6-git-send-email-lee.jones@linaro.org>
References: <1441208289-17330-1-git-send-email-lee.jones@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1441208289-17330-1-git-send-email-lee.jones@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kernel@stlinux.com, ohad@wizery.com, devicetree@vger.kernel.org, Nathan_Lynch@mentor.com, f.fainelli@gmail.com, Lee Jones <lee.jones@linaro.org>, Ludovic Barre <ludovic.barre@st.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 arch/arm/boot/dts/stih407-family.dtsi | 40 +++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
index 33daa49..1c31918 100644
--- a/arch/arm/boot/dts/stih407-family.dtsi
+++ b/arch/arm/boot/dts/stih407-family.dtsi
@@ -608,5 +608,45 @@
 			status		= "okay";
 			tx-only;
 		};
+
+		st231_gp0: st231-gp0@40000000 {
+			compatible	= "st,st231-rproc";
+			reg		= <0x40000000 0x01000000>;
+			resets		= <&softreset STIH407_ST231_GP0_SOFTRESET>;
+			reset-names	= "sw_reset";
+			clocks		= <&clk_s_c0_flexgen CLK_ST231_GP_0>;
+			clock-frequency	= <600000000>;
+			st,syscfg	= <&syscfg_core 0x22c>;
+		};
+
+		st231_gp1: st231-gp1@41000000 {
+			compatible	= "st,st231-rproc";
+			reg		= <0x41000000 0x01000000>;
+			resets		= <&softreset STIH407_ST231_GP1_SOFTRESET>;
+			reset-names	= "sw_reset";
+			clocks		= <&clk_s_c0_flexgen CLK_ST231_GP_1>;
+			clock-frequency = <600000000>;
+			st,syscfg	= <&syscfg_core 0x220>;
+		};
+
+		st231_audio: st231-audio@42000000 {
+			compatible	= "st,st231-rproc";
+			reg		= <0x42000000 0x01000000>;
+			resets		= <&softreset STIH407_ST231_AUD_SOFTRESET>;
+			reset-names	= "sw_reset";
+			clocks		= <&clk_s_c0_flexgen CLK_ST231_AUD_0>;
+			clock-frequency	= <600000000>;
+			st,syscfg	= <&syscfg_core 0x228>;
+		};
+
+		st231_dmu: st231-dmu@43000000 {
+			compatible	= "st,st231-rproc";
+			reg		= <0x43000000 0x01000000>;
+			resets		= <&softreset STIH407_ST231_DMU_SOFTRESET>;
+			reset-names	= "sw_reset";
+			clocks		= <&clk_s_c0_flexgen CLK_ST231_DMU>;
+			clock-frequency	= <600000000>;
+			st,syscfg	= <&syscfg_core 0x224>;
+		};
 	};
 };
-- 
1.9.1
