From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Subject: [PATCH v2 5/7] ARM: dts: imx6q-icore-ofcap12: Switch LVDS timings from panel-simple
Date: Thu,  4 Jan 2018 11:42:23 +0530
Message-ID: <1515046345-15881-6-git-send-email-jagan@amarulasolutions.com>
References: <1515046345-15881-1-git-send-email-jagan@amarulasolutions.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1515046345-15881-1-git-send-email-jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Matteo Lisi <matteo.lisi-4s7YQHO/iPVBDgjK7y7TUQ@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Switch to use koe_tx31d200vm0baa LVDS timings from
panel-simple instead hard coding the same in dts.

Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
---
Changes for v2:
- none

 arch/arm/boot/dts/imx6q-icore-ofcap12.dts | 31 +++++++++++++++++--------------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/imx6q-icore-ofcap12.dts b/arch/arm/boot/dts/imx6q-icore-ofcap12.dts
index 9e230f5..6e27c81 100644
--- a/arch/arm/boot/dts/imx6q-icore-ofcap12.dts
+++ b/arch/arm/boot/dts/imx6q-icore-ofcap12.dts
@@ -48,28 +48,31 @@
 / {
 	model = "Engicam i.CoreM6 Quad/Dual OpenFrame Capacitive touch 12 Kit";
 	compatible = "engicam,imx6-icore", "fsl,imx6q";
+
+	panel {
+		compatible = "koe,tx31d200vm0baa";
+		backlight = <&backlight_lvds>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&lvds0_out>;
+			};
+		};
+	};
 };
 
 &ldb {
 	status = "okay";
 
 	lvds-channel@0 {
-		fsl,data-mapping = "spwg";
-		fsl,data-width = <18>;
+		reg = <0>;
 		status = "okay";
 
-		display-timings {
-			native-mode = <&timing0>;
-			timing0: timing0 {
-				clock-frequency = <46800000>;
-				hactive = <1280>;
-				vactive = <480>;
-				hback-porch = <353>;
-				hfront-porch = <47>;
-				vback-porch = <39>;
-				vfront-porch = <4>;
-				hsync-len = <8>;
-				vsync-len = <2>;
+		port@4 {
+			reg = <4>;
+
+			lvds0_out: endpoint {
+				remote-endpoint = <&panel_in>;
 			};
 		};
 	};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
