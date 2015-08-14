From: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Subject: [PATCH v3 1/2] ARM: dts: imx6qdl-nitrogen6x: add Okaya LCD panel
Date: Fri, 14 Aug 2015 14:51:06 +0200
Message-ID: <1439556667-3424-2-git-send-email-gary.bisson@boundarydevices.com>
References: <1432314867-30888-1-git-send-email-gary.bisson@boundarydevices.com>
 <1439556667-3424-1-git-send-email-gary.bisson@boundarydevices.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439556667-3424-1-git-send-email-gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds support for the 7" LCD display available for Nitrogen6x:
http://boundarydevices.com/product/7-800x480-display/

Also add label to backlight_lcd and connect it to the panel.

Signed-off-by: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
---
 arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi | 76 ++++++++++++++++++++++++++++++-
 1 file changed, 75 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi b/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi
index 340bc8e..ad16dce 100644
--- a/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi
@@ -124,7 +124,7 @@
 		mux-ext-port = <3>;
 	};
 
-	backlight_lcd {
+	backlight_lcd: backlight_lcd {
 		compatible = "pwm-backlight";
 		pwms = <&pwm1 0 5000000>;
 		brightness-levels = <0 4 8 16 32 64 128 255>;
@@ -142,6 +142,43 @@
 		status = "okay";
 	};
 
+	lcd_display: display@di0 {
+		compatible = "fsl,imx-parallel-display";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		interface-pix-fmt = "bgr666";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_j15>;
+		status = "okay";
+
+		port@0 {
+			reg = <0>;
+
+			lcd_display_in: endpoint {
+				remote-endpoint = <&ipu1_di0_disp0>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			lcd_display_out: endpoint {
+				remote-endpoint = <&lcd_panel_in>;
+			};
+		};
+	};
+
+	lcd_panel {
+		compatible = "okaya,rs800480t-7x0gp";
+		backlight = <&backlight_lcd>;
+
+		port {
+			lcd_panel_in: endpoint {
+				remote-endpoint = <&lcd_display_out>;
+			};
+		};
+	};
+
 	panel {
 		compatible = "hannstar,hsd100pxn1";
 		backlight = <&backlight_lvds>;
@@ -354,6 +391,39 @@
 			>;
 		};
 
+		pinctrl_j15: j15grp {
+			fsl,pins = <
+				MX6QDL_PAD_DI0_DISP_CLK__IPU1_DI0_DISP_CLK 0x10
+				MX6QDL_PAD_DI0_PIN15__IPU1_DI0_PIN15       0x10
+				MX6QDL_PAD_DI0_PIN2__IPU1_DI0_PIN02        0x10
+				MX6QDL_PAD_DI0_PIN3__IPU1_DI0_PIN03        0x10
+				MX6QDL_PAD_DISP0_DAT0__IPU1_DISP0_DATA00   0x10
+				MX6QDL_PAD_DISP0_DAT1__IPU1_DISP0_DATA01   0x10
+				MX6QDL_PAD_DISP0_DAT2__IPU1_DISP0_DATA02   0x10
+				MX6QDL_PAD_DISP0_DAT3__IPU1_DISP0_DATA03   0x10
+				MX6QDL_PAD_DISP0_DAT4__IPU1_DISP0_DATA04   0x10
+				MX6QDL_PAD_DISP0_DAT5__IPU1_DISP0_DATA05   0x10
+				MX6QDL_PAD_DISP0_DAT6__IPU1_DISP0_DATA06   0x10
+				MX6QDL_PAD_DISP0_DAT7__IPU1_DISP0_DATA07   0x10
+				MX6QDL_PAD_DISP0_DAT8__IPU1_DISP0_DATA08   0x10
+				MX6QDL_PAD_DISP0_DAT9__IPU1_DISP0_DATA09   0x10
+				MX6QDL_PAD_DISP0_DAT10__IPU1_DISP0_DATA10  0x10
+				MX6QDL_PAD_DISP0_DAT11__IPU1_DISP0_DATA11  0x10
+				MX6QDL_PAD_DISP0_DAT12__IPU1_DISP0_DATA12  0x10
+				MX6QDL_PAD_DISP0_DAT13__IPU1_DISP0_DATA13  0x10
+				MX6QDL_PAD_DISP0_DAT14__IPU1_DISP0_DATA14  0x10
+				MX6QDL_PAD_DISP0_DAT15__IPU1_DISP0_DATA15  0x10
+				MX6QDL_PAD_DISP0_DAT16__IPU1_DISP0_DATA16  0x10
+				MX6QDL_PAD_DISP0_DAT17__IPU1_DISP0_DATA17  0x10
+				MX6QDL_PAD_DISP0_DAT18__IPU1_DISP0_DATA18  0x10
+				MX6QDL_PAD_DISP0_DAT19__IPU1_DISP0_DATA19  0x10
+				MX6QDL_PAD_DISP0_DAT20__IPU1_DISP0_DATA20  0x10
+				MX6QDL_PAD_DISP0_DAT21__IPU1_DISP0_DATA21  0x10
+				MX6QDL_PAD_DISP0_DAT22__IPU1_DISP0_DATA22  0x10
+				MX6QDL_PAD_DISP0_DAT23__IPU1_DISP0_DATA23  0x10
+			>;
+		};
+
 		pinctrl_pwm1: pwm1grp {
 			fsl,pins = <
 				MX6QDL_PAD_SD1_DAT3__PWM1_OUT 0x1b0b1
@@ -421,6 +491,10 @@
 	};
 };
 
+&ipu1_di0_disp0 {
+	remote-endpoint = <&lcd_display_in>;
+};
+
 &ldb {
 	status = "okay";
 
-- 
2.4.6

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
