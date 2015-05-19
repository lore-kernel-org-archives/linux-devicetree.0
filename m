From: Eric Nelson <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Subject: [PATCH V2 1/2] ARM: dts: nitrogen6x: use simple-panel instead of display-timings for LVDS0
Date: Tue, 19 May 2015 08:50:15 -0700
Message-ID: <1432050616-11465-2-git-send-email-eric.nelson@boundarydevices.com>
References: <20150518075844.7e1b5916@ipc1.ka-ro>
 <1432050616-11465-1-git-send-email-eric.nelson@boundarydevices.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432050616-11465-1-git-send-email-eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org, Eric Nelson <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Also add label for backlight_lvds and connect it to the display.

Signed-off-by: Eric Nelson <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
---
V2 changes 'alias' in commit message to 'label'

 arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi b/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi
index fd096dc..712c5ec 100644
--- a/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi
@@ -122,7 +122,7 @@
 		status = "okay";
 	};
 
-	backlight_lvds {
+	backlight_lvds: backlight_lvds {
 		compatible = "pwm-backlight";
 		pwms = <&pwm4 0 5000000>;
 		brightness-levels = <0 4 8 16 32 64 128 255>;
@@ -130,6 +130,17 @@
 		power-supply = <&reg_3p3v>;
 		status = "okay";
 	};
+
+	panel {
+		compatible = "hannstar,hsd100pxn1";
+		backlight = <&backlight_lvds>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&lvds0_out>;
+			};
+		};
+	};
 };
 
 &audmux {
@@ -379,18 +390,11 @@
 		fsl,data-width = <18>;
 		status = "okay";
 
-		display-timings {
-			native-mode = <&timing0>;
-			timing0: hsd100pxn1 {
-				clock-frequency = <65000000>;
-				hactive = <1024>;
-				vactive = <768>;
-				hback-porch = <220>;
-				hfront-porch = <40>;
-				vback-porch = <21>;
-				vfront-porch = <7>;
-				hsync-len = <60>;
-				vsync-len = <10>;
+		port@4 {
+			reg = <4>;
+
+			lvds0_out: endpoint {
+				remote-endpoint = <&panel_in>;
 			};
 		};
 	};
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
