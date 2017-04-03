From: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Subject: [PATCH] ARM: dts: imx: ventana: fix DTC warnings
Date: Mon,  3 Apr 2017 13:42:48 -0700
Message-ID: <1491252168-7934-1-git-send-email-tharvey@gateworks.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "devicetree @ vger . kernel . org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Remove the sky2 ethernet device node from the pcie controller which was
invalid to begin with.

The original intent was to allow the bootloader to populate the MAC via
dt but this requires the PCI bus topology to be complete in dt as well
and as these boards have an expansion connector that topology is dynamic
and can't be represented here.

Signed-off-by: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
---
 arch/arm/boot/dts/imx6q-gw5400-a.dts  | 4 ----
 arch/arm/boot/dts/imx6qdl-gw53xx.dtsi | 4 ----
 arch/arm/boot/dts/imx6qdl-gw54xx.dtsi | 4 ----
 3 files changed, 12 deletions(-)

diff --git a/arch/arm/boot/dts/imx6q-gw5400-a.dts b/arch/arm/boot/dts/imx6q-gw5400-a.dts
index 8e84713..5b066c0 100644
--- a/arch/arm/boot/dts/imx6q-gw5400-a.dts
+++ b/arch/arm/boot/dts/imx6q-gw5400-a.dts
@@ -347,10 +347,6 @@
 &pcie {
 	reset-gpio = <&gpio1 29 GPIO_ACTIVE_LOW>;
 	status = "okay";
-
-	eth1: sky2@8 { /* MAC/PHY on bus 8 */
-		compatible = "marvell,sky2";
-	};
 };
 
 &ssi1 {
diff --git a/arch/arm/boot/dts/imx6qdl-gw53xx.dtsi b/arch/arm/boot/dts/imx6qdl-gw53xx.dtsi
index a208e7e..420a2f6 100644
--- a/arch/arm/boot/dts/imx6qdl-gw53xx.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-gw53xx.dtsi
@@ -342,10 +342,6 @@
 	pinctrl-0 = <&pinctrl_pcie>;
 	reset-gpio = <&gpio1 29 GPIO_ACTIVE_LOW>;
 	status = "okay";
-
-	eth1: sky2@8 { /* MAC/PHY on bus 8 */
-		compatible = "marvell,sky2";
-	};
 };
 
 &pwm2 {
diff --git a/arch/arm/boot/dts/imx6qdl-gw54xx.dtsi b/arch/arm/boot/dts/imx6qdl-gw54xx.dtsi
index 968fda9..e742153 100644
--- a/arch/arm/boot/dts/imx6qdl-gw54xx.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-gw54xx.dtsi
@@ -379,10 +379,6 @@
 	pinctrl-0 = <&pinctrl_pcie>;
 	reset-gpio = <&gpio1 29 GPIO_ACTIVE_LOW>;
 	status = "okay";
-
-	eth1: sky2@8 { /* MAC/PHY on bus 8 */
-		compatible = "marvell,sky2";
-	};
 };
 
 &pwm1 {
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
