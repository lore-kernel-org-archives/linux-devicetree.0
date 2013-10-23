From: Aida Mynzhasova <aida.mynzhasova-Fmhy8gsqeTEvJsYlp49lxw@public.gmane.org>
Subject: [PATCH v2] ARM: dts: mxs: add auart2 pinmux to imx28.dtsi
Date: Wed, 23 Oct 2013 10:58:57 +0400
Message-ID: <1382511537-5072-1-git-send-email-aida.mynzhasova@skitlab.ru>
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
index 918d419..cab4c22 100644
--- a/arch/arm/boot/dts/imx28.dtsi
+++ b/arch/arm/boot/dts/imx28.dtsi
@@ -343,6 +343,19 @@
 					fsl,pull-up = <MXS_PULL_DISABLE>;
 				};
 
+				auart2_pins_a: auart2-pins@0 {
+					reg = <0>;
+					fsl,pinmux-ids = <
+						MX28_PAD_AUART2_RX__AUART2_RX
+						MX28_PAD_AUART2_TX__AUART2_TX
+						MX28_PAD_AUART2_CTS__AUART2_CTS
+						MX28_PAD_AUART2_RTS__AUART2_RTS
+					>;
+					fsl,drive-strength = <MXS_DRIVE_4mA>;
+					fsl,voltage = <MXS_VOLTAGE_HIGH>;
+					fsl,pull-up = <MXS_PULL_DISABLE>;
+				};
+
 				auart3_pins_a: auart3@0 {
 					reg = <0>;
 					fsl,pinmux-ids = <
-- 
1.8.1.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
