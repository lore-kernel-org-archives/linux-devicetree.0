From: Eric Nelson <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Subject: [PATCH 1/2] ARM: dts: imx6qdl-sabrelite: add supported LVDS displays
Date: Thu, 19 Feb 2015 16:53:21 -0700
Message-ID: <1424390002-8726-1-git-send-email-eric.nelson@boundarydevices.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, troy.kisky-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org, Eric Nelson <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The BD-SL-i.MX6 (SABRE Lite board) supports three companion displays:
	Okaya 1024x600
	Hannstar 1024x768
	LG 1280x800

This patch adds timing entries into the LDB device tree and aliases
for them and HDMI to make it easy for the boot loader to configure them.

Signed-off-by: Eric Nelson <eric.nelson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
---
 arch/arm/boot/dts/imx6qdl-sabrelite.dtsi | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi b/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi
index 3bddc8f..5f77dc0 100644
--- a/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-sabrelite.dtsi
@@ -13,6 +13,13 @@
 #include <dt-bindings/input/input.h>
 
 / {
+	aliases {
+		hdmi = &hdmi;
+		hannstar = &hannstar;
+		lg1280x800 = &lg1280x800;
+		okaya1024x600 = &okaya1024x600;
+	};
+
 	chosen {
 		stdout-path = &uart2;
 	};
@@ -361,8 +368,29 @@
 		status = "okay";
 
 		display-timings {
-			native-mode = <&timing0>;
-			timing0: hsd100pxn1 {
+			lg1280x800: lp101wx1 {
+				clock-frequency = <72000000>;
+				hactive = <1280>;
+				vactive = <800>;
+				hback-porch = <48>;
+				hfront-porch = <80>;
+				vback-porch = <15>;
+				vfront-porch = <2>;
+				hsync-len = <32>;
+				vsync-len = <6>;
+			};
+			okaya1024x600: okaya7x0WP {
+				clock-frequency = <52000000>;
+				hactive = <1024>;
+				vactive = <600>;
+				hback-porch = <220>;
+				hfront-porch = <40>;
+				vback-porch = <7>;
+				vfront-porch = <21>;
+				hsync-len = <60>;
+				vsync-len = <10>;
+			};
+			hannstar: hsd100pxn1 {
 				clock-frequency = <65000000>;
 				hactive = <1024>;
 				vactive = <768>;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
