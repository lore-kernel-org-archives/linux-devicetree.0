From: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH] ARM: dts: imx6qdl-sabresd: Add power key support
Date: Thu, 19 Dec 2013 12:25:34 -0500
Message-ID: <1387473934-10188-1-git-send-email-b20788@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds support for imx6qdl-sabresd board's power
key, the key is named "SW1" on board, press it can wake up
system from suspend.

Signed-off-by: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/arm/boot/dts/imx6qdl-sabresd.dtsi |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
index e75e11b..85e3487 100644
--- a/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
+++ b/arch/arm/boot/dts/imx6qdl-sabresd.dtsi
@@ -47,6 +47,13 @@
 	gpio-keys {
 		compatible = "gpio-keys";
 
+		power {
+			label = "Power Button";
+			gpios = <&gpio3 29 0>;
+			linux,code = <116>; /* KEY_POWER */
+			gpio-key,wakeup;
+		};
+
 		volume-up {
 			label = "Volume Up";
 			gpios = <&gpio1 4 0>;
@@ -182,6 +189,7 @@
 				MX6QDL_PAD_ENET_TXD1__GPIO1_IO29 0x80000000
 				MX6QDL_PAD_EIM_D22__GPIO3_IO22  0x80000000
 				MX6QDL_PAD_ENET_CRS_DV__GPIO1_IO25 0x80000000
+				MX6QDL_PAD_EIM_D29__GPIO3_IO29 0x80000000
 			>;
 		};
 	};
-- 
1.7.9.5


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
