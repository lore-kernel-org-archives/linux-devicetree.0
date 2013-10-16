From: Aida Mynzhasova <aida.mynzhasova-Fmhy8gsqeTEvJsYlp49lxw@public.gmane.org>
Subject: [PATCH] ARM: dts: mxs: add auart2 pinmux to imx28.dtsi
Date: Wed, 16 Oct 2013 20:04:03 +0400
Message-ID: <1381939443-7318-1-git-send-email-aida.mynzhasova@skitlab.ru>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add auart2 pins configuration on its main pads

Signed-off-by: Aida Mynzhasova <aida.mynzhasova-Fmhy8gsqeTEvJsYlp49lxw@public.gmane.org>
---
 arch/arm/boot/dts/imx28.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/imx28.dtsi b/arch/arm/boot/dts/imx28.dtsi
index 7363fde..81102b2 100644
--- a/arch/arm/boot/dts/imx28.dtsi
+++ b/arch/arm/boot/dts/imx28.dtsi
@@ -320,6 +320,19 @@
 					fsl,pull-up = <0>;
 				};
 
+				auart2_pins_a: auart2@0 {
+					reg = <0>;
+					fsl,pinmux-ids = <
+						0x3080 /* MX28_PAD_AUART2_RX__AUART2_RX	*/
+						0x3090 /* MX28_PAD_AUART2_TX__AUART2_TX */
+						0x30a0 /* MX28_PAD_AUART2_CTS__AUART2_CTS */
+						0x30b0 /* MX28_PAD_AUART2_RTS__AUART2_RTS */
+					>;
+					fsl,drive-strength = <0>;
+					fsl,voltage = <1>;
+					fsl,pull-up = <0>;
+				};
+
 				auart2_2pins_a: auart2-2pins@0 {
 					reg = <0>;
 					fsl,pinmux-ids = <
-- 
1.8.1.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
