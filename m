From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v4 5/6] ARM: STiH407: Add nodes for RemoteProc
Date: Wed, 21 Oct 2015 12:47:06 +0100
Message-ID: <1445428027-26174-6-git-send-email-lee.jones@linaro.org>
References: <1445428027-26174-1-git-send-email-lee.jones@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445428027-26174-1-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nathan_Lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ludovic.barre-qxv4g6HH51o@public.gmane.org, s-anna-l0cyMroinI0@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Ludovic Barre <ludovic.barre-qxv4g6HH51o@public.gmane.org>
Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/stih407-family.dtsi | 40 +++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
index 1e4e01925..15c20b6 100644
--- a/arch/arm/boot/dts/stih407-family.dtsi
+++ b/arch/arm/boot/dts/stih407-family.dtsi
@@ -650,5 +650,45 @@
 			mbox-name	= "st231_audio_video";
 			status		= "okay";
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
