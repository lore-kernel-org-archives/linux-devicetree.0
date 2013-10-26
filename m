From: Aida Mynzhasova <aida.mynzhasova-Fmhy8gsqeTEvJsYlp49lxw@public.gmane.org>
Subject: [PATCH] ARM: dts: mxs: add additional can interface pinmuxes to imx28.dtsi
Date: Sat, 26 Oct 2013 19:15:30 +0400
Message-ID: <1382800530-3113-1-git-send-email-aida.mynzhasova@skitlab.ru>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add alternative pinmuxes for can interface.

Signed-off-by: Aida Mynzhasova <aida.mynzhasova-Fmhy8gsqeTEvJsYlp49lxw@public.gmane.org>
---
 arch/arm/boot/dts/imx28.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/imx28.dtsi b/arch/arm/boot/dts/imx28.dtsi
index cab4c22..dc49a5c 100644
--- a/arch/arm/boot/dts/imx28.dtsi
+++ b/arch/arm/boot/dts/imx28.dtsi
@@ -686,6 +686,17 @@
 					fsl,pull-up = <MXS_PULL_DISABLE>;
 				};
 
+				can0_pins_b: can0@1 {
+					reg = <1>;
+					fsl,pinmux-ids = <
+						MX28_PAD_AUART3_RX__CAN0_TX
+						MX28_PAD_AUART3_TX__CAN0_RX
+					>;
+					fsl,drive-strength = <0>;
+					fsl,voltage = <1>;
+					fsl,pull-up = <0>;
+				};
+
 				can1_pins_a: can1@0 {
 					reg = <0>;
 					fsl,pinmux-ids = <
@@ -697,6 +708,17 @@
 					fsl,pull-up = <MXS_PULL_DISABLE>;
 				};
 
+				can1_pins_b: can1@1 {
+					reg = <1>;
+					fsl,pinmux-ids = <
+						MX28_PAD_AUART3_CTS__CAN1_TX
+						MX28_PAD_AUART3_RTS__CAN1_RX
+					>;
+					fsl,drive-strength = <0>;
+					fsl,voltage = <1>;
+					fsl,pull-up = <0>;
+				};
+
 				spi2_pins_a: spi2@0 {
 					reg = <0>;
 					fsl,pinmux-ids = <
-- 
1.8.1.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
