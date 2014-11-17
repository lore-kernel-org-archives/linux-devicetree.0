From: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v3 01/11] ARM: STi: DT: STiH416: Add pinctl setup for usb controllers.
Date: Mon, 17 Nov 2014 16:47:54 +0000
Message-ID: <1416242884-5261-2-git-send-email-peter.griffin@linaro.org>
References: <1416242884-5261-1-git-send-email-peter.griffin@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416242884-5261-1-git-send-email-peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, maxime.coquelin-qxv4g6HH51o@public.gmane.org, srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, patrice.chotard-qxv4g6HH51o@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
Cc: peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds the required pin config for all usb controllers
on the stih416.

Signed-off-by: Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/stih416-pinctrl.dtsi | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/stih416-pinctrl.dtsi b/arch/arm/boot/dts/stih416-pinctrl.dtsi
index c2025bc..9cccf2d 100644
--- a/arch/arm/boot/dts/stih416-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stih416-pinctrl.dtsi
@@ -147,6 +147,15 @@
 				};
 			};
 
+			usb {
+				pinctrl_usb3: usb3 {
+					st,pins {
+						oc-detect = <&pio40 0 ALT1 IN>;
+						pwr-enable = <&pio40 1 ALT1 OUT>;
+					};
+				};
+			};
+
 			sbc_i2c1 {
 				pinctrl_sbc_i2c1_default: sbc_i2c1-default {
 					st,pins {
@@ -318,6 +327,16 @@
 				};
 			};
 
+			usb {
+				pinctrl_usb0: usb0 {
+					st,pins {
+						oc-detect = <&pio9 4 ALT1 IN>;
+						pwr-enable = <&pio9 5 ALT1 OUT>;
+					};
+				};
+			};
+
+
 			i2c1 {
 				pinctrl_i2c1_default: i2c1-default {
 					st,pins {
@@ -506,6 +525,21 @@
 					};
 				};
 			};
+
+			usb {
+				pinctrl_usb1: usb1 {
+					st,pins {
+						oc-detect = <&pio18 0 ALT1 IN>;
+						pwr-enable = <&pio18 1 ALT1 OUT>;
+					};
+				};
+				pinctrl_usb2: usb2 {
+					st,pins {
+						oc-detect = <&pio18 2 ALT1 IN>;
+						pwr-enable = <&pio18 3 ALT1 OUT>;
+					};
+				};
+			};
 		};
 
 		pin-controller-fvdp-fe {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
