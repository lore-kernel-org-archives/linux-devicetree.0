From: Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>
Subject: [PATCH] ARM: DTS: kirkwood-openrd: provide template for RS-232/485 configuration
Date: Sat, 23 Jan 2016 22:37:17 +0200
Message-ID: <1453581437-14135-1-git-send-email-aaro.koskinen@iki.fi>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Martin Michlmayr <tbm-R+vWnYXSFMfQT0dZR+AlfA@public.gmane.org>, Rick Thomas <rbthomas-e+AXbWqSrlAAvxtiuMwx3w@public.gmane.org>
Cc: Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Some OpenRD boards have RS-232 and RS-486 connectors wired, but using them
needs a custom DTB as the current DTB configures SD card slot instead.

This patch adds documentation into the DTS on how to change
the configuration.

Signed-off-by: Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>
---
 arch/arm/boot/dts/kirkwood-openrd.dtsi | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/kirkwood-openrd.dtsi b/arch/arm/boot/dts/kirkwood-openrd.dtsi
index f65b727..24f1d30 100644
--- a/arch/arm/boot/dts/kirkwood-openrd.dtsi
+++ b/arch/arm/boot/dts/kirkwood-openrd.dtsi
@@ -40,7 +40,7 @@
 			pinctrl-0 = <&pmx_select28 &pmx_sdio_cd &pmx_select34>;
 			pinctrl-names = "default";
 
-			pmx_select28: pmx-select-rs232-rs484 {
+			pmx_select28: pmx-select-rs232-rs485 {
 				marvell,pins = "mpp28";
 				marvell,function = "gpio";
 			};
@@ -65,10 +65,39 @@
 			status = "okay";
 			cd-gpios = <&gpio0 29 9>;
 		};
+		gpio@10100 {
+			p28 {
+				gpio-hog;
+				gpios = <28 GPIO_ACTIVE_HIGH>;
+				/*
+				 * SelRS232or485 selects between RS-232 or RS-485
+				 * mode for the second UART.
+				 *
+				 * Low: RS-232
+				 * High: RS-485
+				 *
+				 * To use the second UART, you need to change also
+				 * the SelUARTorSD.
+				 */
+				output-low;
+				line-name = "SelRS232or485";
+			};
+		};
 		gpio@10140 {
 			p2 {
 				gpio-hog;
 				gpios = <2 GPIO_ACTIVE_HIGH>;
+				/*
+				 * SelUARTorSD selects between the second UART
+				 * (serial@12100) and SD (mvsdio@90000).
+				 *
+				 * Low: UART
+				 * High: SD
+				 *
+				 * When changing this line make sure the newly
+				 * selected device node is enabled and the
+				 * previously selected device node is disabled.
+				 */
 				output-high; /* Select SD by default */
 				line-name = "SelUARTorSD";
 			};
-- 
2.4.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
