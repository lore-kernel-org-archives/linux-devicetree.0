From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 3/4] ARM: STiH407: Add nodes for RemoteProc
Date: Wed, 26 Aug 2015 14:08:02 +0100
Message-ID: <1440594483-29601-4-git-send-email-lee.jones@linaro.org>
References: <1440594483-29601-1-git-send-email-lee.jones@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440594483-29601-1-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/stih407-family.dtsi | 48 +++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
index 33daa49..89a363c 100644
--- a/arch/arm/boot/dts/stih407-family.dtsi
+++ b/arch/arm/boot/dts/stih407-family.dtsi
@@ -608,5 +608,53 @@
 			status		= "okay";
 			tx-only;
 		};
+
+		st231_gp0: st231-gp0@0 {
+			compatible = "st,st231-rproc";
+			reg = <0x40000000 0x01000000>;
+			reg-names = "carveout";
+			resets = <&softreset STIH407_ST231_GP0_SOFTRESET>;
+			reset-names = "sw_reset";
+			clocks = <&clk_s_c0_flexgen CLK_ST231_GP_0>;
+			clock-names = "rproc_clk";
+			clock-frequency = <600000000>;
+			st,syscfg-boot = <&syscfg_core 0x22C>;
+		};
+
+		st231_gp1: st231-gp1@0 {
+			compatible = "st,st231-rproc";
+			reg = <0x41000000 0x01000000>;
+			reg-names = "carveout";
+			resets = <&softreset STIH407_ST231_GP1_SOFTRESET>;
+			reset-names = "sw_reset";
+			clocks = <&clk_s_c0_flexgen CLK_ST231_GP_1>;
+			clock-names = "rproc_clk";
+			clock-frequency = <600000000>;
+			st,syscfg-boot = <&syscfg_core 0x220>;
+		};
+
+		st231_audio: st231-audio@0 {
+			compatible = "st,st231-rproc";
+			reg = <0x42000000 0x01000000>;
+			reg-names = "carveout";
+			resets = <&softreset STIH407_ST231_AUD_SOFTRESET>;
+			reset-names = "sw_reset";
+			clocks = <&clk_s_c0_flexgen CLK_ST231_AUD_0>;
+			clock-names = "rproc_clk";
+			clock-frequency = <600000000>;
+			st,syscfg-boot = <&syscfg_core 0x228>;
+		};
+
+		st231_dmu: st231-dmu@0 {
+			compatible = "st,st231-rproc";
+			reg = <0x43000000 0x01000000>;
+			reg-names = "carveout";
+			resets = <&softreset STIH407_ST231_DMU_SOFTRESET>;
+			reset-names = "sw_reset";
+			clocks = <&clk_s_c0_flexgen CLK_ST231_DMU>;
+			clock-names = "rproc_clk";
+			clock-frequency = <600000000>;
+			st,syscfg-boot = <&syscfg_core 0x224>;
+		};
 	};
 };
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
