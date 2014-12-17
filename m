From: Gabriel FERNANDEZ <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH 1/2] ARM: DT: STiH407: Add DRM dt nodes
Date: Wed, 17 Dec 2014 11:02:23 +0100
Message-ID: <1418810544-11405-2-git-send-email-gabriel.fernandez@linaro.org>
References: <1418810544-11405-1-git-send-email-gabriel.fernandez@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418810544-11405-1-git-send-email-gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srinivas Kandagatla <srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds the DRM/KMS dt notes.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/stih407-family.dtsi | 104 ++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/stihxxx-b2120.dtsi  |   2 +-
 2 files changed, 105 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
index 3e31d32..5fd3c96 100644
--- a/arch/arm/boot/dts/stih407-family.dtsi
+++ b/arch/arm/boot/dts/stih407-family.dtsi
@@ -274,5 +274,109 @@
 
 			status = "disabled";
 		};
+
+		/* Display */
+		vtg_main: sti-vtg-main@8d02800 {
+			compatible = "st,vtg";
+			reg = <0x8d02800 0x200>;
+			interrupts = <GIC_SPI 108 IRQ_TYPE_NONE>;
+		};
+
+		vtg_aux: sti-vtg-aux@8d00200 {
+			compatible = "st,vtg";
+			reg = <0x8d00200 0x100>;
+			interrupts = <GIC_SPI 109 IRQ_TYPE_NONE>;
+		};
+
+		sti-display-subsystem {
+			compatible = "st,sti-display-subsystem";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			sti-compositor@9d11000 {
+				compatible = "st,stih407-compositor";
+				reg = <0x9d11000 0x1000>;
+
+				clock-names = "compo_main",
+					      "compo_aux",
+					      "pix_main",
+					      "pix_aux",
+					      "pix_gdp1",
+					      "pix_gdp2",
+					      "pix_gdp3",
+					      "pix_gdp4",
+					      "main_parent",
+					      "aux_parent";
+
+				clocks = <&clk_s_c0_flexgen CLK_COMPO_DVP>,
+					 <&clk_s_c0_flexgen CLK_COMPO_DVP>,
+					 <&clk_s_d2_flexgen CLK_PIX_MAIN_DISP>,
+					 <&clk_s_d2_flexgen CLK_PIX_AUX_DISP>,
+					 <&clk_s_d2_flexgen CLK_PIX_GDP1>,
+					 <&clk_s_d2_flexgen CLK_PIX_GDP2>,
+					 <&clk_s_d2_flexgen CLK_PIX_GDP3>,
+					 <&clk_s_d2_flexgen CLK_PIX_GDP4>,
+					 <&clk_s_d2_quadfs 0>,
+					 <&clk_s_d2_quadfs 1>;
+
+				reset-names = "compo-main", "compo-aux";
+				resets = <&softreset STIH407_COMPO_SOFTRESET>,
+					 <&softreset STIH407_COMPO_SOFTRESET>;
+				st,vtg = <&vtg_main>, <&vtg_aux>;
+			};
+
+			sti-tvout@8d08000 {
+				compatible = "st,stih407-tvout";
+				reg = <0x8d08000 0x1000>;
+				reg-names = "tvout-reg";
+				reset-names = "tvout";
+				resets = <&softreset STIH407_HDTVOUT_SOFTRESET>;
+				#address-cells = <1>;
+				#size-cells = <1>;
+				ranges;
+
+				sti-hdmi@8d04000 {
+					compatible = "st,stih407-hdmi";
+					reg = <0x8d04000 0x1000>;
+					reg-names = "hdmi-reg";
+					interrupts = <GIC_SPI 106 IRQ_TYPE_NONE>;
+					interrupt-names	= "irq";
+					clock-names = "pix",
+						      "tmds",
+						      "phy",
+						      "audio",
+						      "main_parent",
+						      "aux_parent";
+
+					clocks = <&clk_s_d2_flexgen CLK_PIX_HDMI>,
+						 <&clk_s_d2_flexgen CLK_TMDS_HDMI>,
+						 <&clk_s_d2_flexgen CLK_REF_HDMIPHY>,
+						 <&clk_s_d0_flexgen CLK_PCM_0>,
+						 <&clk_s_d2_quadfs 0>,
+						 <&clk_s_d2_quadfs 1>;
+
+					hdmi,hpd-gpio = <&pio5 3>;
+					reset-names = "hdmi";
+					resets = <&softreset STIH407_HDMI_TX_PHY_SOFTRESET>;
+					ddc = <&hdmiddc>;
+
+				};
+
+				sti-hda@8d02000 {
+					compatible = "st,stih407-hda";
+					reg = <0x8d02000 0x400>, <0x92b0120 0x4>;
+					reg-names = "hda-reg", "video-dacs-ctrl";
+					clock-names = "pix",
+						      "hddac",
+						      "main_parent",
+						      "aux_parent";
+					clocks = <&clk_s_d2_flexgen CLK_PIX_HDDAC>,
+						 <&clk_s_d2_flexgen CLK_HDDAC>,
+						 <&clk_s_d2_quadfs 0>,
+						 <&clk_s_d2_quadfs 1>;
+				};
+			};
+		};
 	};
 };
diff --git a/arch/arm/boot/dts/stihxxx-b2120.dtsi b/arch/arm/boot/dts/stihxxx-b2120.dtsi
index 0074bd4..0bc8c17 100644
--- a/arch/arm/boot/dts/stihxxx-b2120.dtsi
+++ b/arch/arm/boot/dts/stihxxx-b2120.dtsi
@@ -48,7 +48,7 @@
 		};
 
 		/* SSC11 to HDMI */
-		i2c@9541000 {
+		hdmiddc: i2c@9541000 {
 			status = "okay";
 			/* HDMI V1.3a supports Standard mode only */
 			clock-frequency = <100000>;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
