From: Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>
Subject: [PATCH v3 1/6] ARM: dts: imx51-apf51dev: Fix 'backlight@bl1' node with unit name and no reg property
Date: Fri, 20 Oct 2017 13:48:22 -0200
Message-ID: <1508514507-30736-1-git-send-email-marco.franchi@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, marcofrk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The following build warning is seen with W=1:

Warning (unit_address_vs_reg): Node /backlight@bl1 has a unit name, but no reg property

Fix this warning by removing '@bl1'from such node and change 'bl1grp' to 
'backlightgrp', once there is only one backlight in this dts.

Signed-off-by: Marco Franchi <marco.franchi-3arQi8VN3Tc@public.gmane.org>
---
Changes since v2:
-change message log
-change backlight-bl1 to backlight
-change bl1grp to backlightgrp
-add missed space
 arch/arm/boot/dts/imx51-apf51dev.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx51-apf51dev.dts b/arch/arm/boot/dts/imx51-apf51dev.dts
index 2f1a9d2..3e1846a 100644
--- a/arch/arm/boot/dts/imx51-apf51dev.dts
+++ b/arch/arm/boot/dts/imx51-apf51dev.dts
@@ -16,7 +16,7 @@
 	model = "Armadeus Systems APF51Dev docking/development board";
 	compatible = "armadeus,imx51-apf51dev", "armadeus,imx51-apf51", "fsl,imx51";
 
-	backlight@bl1{
+	backlight {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_backlight>;
 		compatible = "gpio-backlight";
@@ -120,7 +120,7 @@
 	pinctrl-0 = <&pinctrl_hog>;
 
 	imx51-apf51dev {
-		pinctrl_backlight: bl1grp {
+		pinctrl_backlight: backlightgrp {
 			fsl,pins = <
 				MX51_PAD_DI1_D1_CS__GPIO3_4 0x1F5
 			>;
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
