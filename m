From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 02/13] ARM: STi: STiH416: Add Pinctrl settings for PWM
Date: Tue, 12 May 2015 13:51:39 +0100
Message-ID: <1431435110-22595-3-git-send-email-lee.jones@linaro.org>
References: <1431435110-22595-1-git-send-email-lee.jones@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431435110-22595-1-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Ajit Pal Singh <ajitpal.singh-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Supply the Pinctrl configuration to enable PWM{0,1} lines on STiH416
based development boards.

Signed-off-by: Ajit Pal Singh <ajitpal.singh-qxv4g6HH51o@public.gmane.org>
Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/stih416-pinctrl.dtsi | 50 ++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm/boot/dts/stih416-pinctrl.dtsi b/arch/arm/boot/dts/stih416-pinctrl.dtsi
index 9cccf2d..051fc16 100644
--- a/arch/arm/boot/dts/stih416-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stih416-pinctrl.dtsi
@@ -216,6 +216,29 @@
 					};
 				};
 			};
+
+			pwm1 {
+				pinctrl_pwm1_chan0_default: pwm1-0-default {
+					st,pins {
+						pwm-out    = <&pio3 0 ALT1 OUT>;
+					};
+				};
+				pinctrl_pwm1_chan1_default: pwm1-1-default {
+					st,pins {
+						pwm-out    = <&pio4 4 ALT1 OUT>;
+					};
+				};
+				pinctrl_pwm1_chan2_default: pwm1-2-default {
+					st,pins {
+						pwm-out    = <&pio4 6 ALT3 OUT>;
+					};
+				};
+				pinctrl_pwm1_chan3_default: pwm1-3-default {
+					st,pins {
+						pwm-out    = <&pio4 7 ALT3 OUT>;
+					};
+				};
+			};
 		};
 
 		pin-controller-front {
@@ -310,6 +333,14 @@
 				st,bank-name	= "PIO31";
 			};
 
+			pwm0 {
+				pinctrl_pwm0_chan0_default: pwm0-0-default {
+					st,pins {
+						pwm-out    = <&pio9 7 ALT2 OUT>;
+					};
+				};
+			};
+
 			serial2-oe {
 				pinctrl_serial2_oe: serial2-1 {
 					st,pins {
@@ -540,6 +571,25 @@
 					};
 				};
 			};
+
+			pwm0 {
+				pinctrl_pwm0_chan1_default: pwm0-1-default {
+					st,pins {
+						pwm-out    = <&pio13 2 ALT2 OUT>;
+					};
+				};
+				pinctrl_pwm0_chan2_default: pwm0-2-default {
+					st,pins {
+						pwm-out    = <&pio15 2 ALT4 OUT>;
+					};
+				};
+				pinctrl_pwm0_chan3_default: pwm0-3-default {
+					st,pins {
+						pwm-out    = <&pio17 4 ALT1 OUT>;
+					};
+				};
+			};
+
 		};
 
 		pin-controller-fvdp-fe {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
