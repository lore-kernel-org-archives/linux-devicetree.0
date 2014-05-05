From: Gabriel FERNANDEZ <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH 2/4] ARM: STi: DT: add keyscan for stih416
Date: Mon,  5 May 2014 17:38:38 +0200
Message-ID: <1399304320-18197-3-git-send-email-gabriel.fernandez@linaro.org>
References: <1399304320-18197-1-git-send-email-gabriel.fernandez@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399304320-18197-1-git-send-email-gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srinivas Kandagatla <srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Giuseppe Condorelli <giuseppe.condorelli-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add keyscan support for stih416.
It is disabled by default given that it is not enabled on all boards.
Also there are PIOs conflict with already claimed lines.

Signed-off-by: Giuseppe Condorelli <giuseppe.condorelli-qxv4g6HH51o@public.gmane.org>
Signed-off-by: Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/stih416-pinctrl.dtsi | 16 ++++++++++++++++
 arch/arm/boot/dts/stih416.dtsi         | 12 ++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/stih416-pinctrl.dtsi b/arch/arm/boot/dts/stih416-pinctrl.dtsi
index 250d5ec..ee6c119 100644
--- a/arch/arm/boot/dts/stih416-pinctrl.dtsi
+++ b/arch/arm/boot/dts/stih416-pinctrl.dtsi
@@ -122,6 +122,22 @@
 				};
 			};
 
+			keyscan {
+				pinctrl_keyscan: keyscan {
+					st,pins {
+						keyin0 = <&PIO0 2 ALT2 IN>;
+						keyin1 = <&PIO0 3 ALT2 IN>;
+						keyin2 = <&PIO0 4 ALT2 IN>;
+						keyin3 = <&PIO2 6 ALT2 IN>;
+
+						keyout0 = <&PIO1 6 ALT2 OUT>;
+						keyout1 = <&PIO1 7 ALT2 OUT>;
+						keyout2 = <&PIO0 6 ALT2 OUT>;
+						keyout3 = <&PIO2 7 ALT2 OUT>;
+					};
+				};
+			};
+
 			sbc_i2c0 {
 				pinctrl_sbc_i2c0_default: sbc_i2c0-default {
 					st,pins {
diff --git a/arch/arm/boot/dts/stih416.dtsi b/arch/arm/boot/dts/stih416.dtsi
index 78746d2..d3bc263 100644
--- a/arch/arm/boot/dts/stih416.dtsi
+++ b/arch/arm/boot/dts/stih416.dtsi
@@ -224,5 +224,17 @@
 
 			status = "disabled";
 		};
+
+		keyscan: keyscan@fe4b0000 {
+			compatible = "st,sti-keyscan";
+			status = "disabled";
+			reg = <0xfe4b0000 0x2000>;
+			interrupts = <GIC_SPI 212 IRQ_TYPE_NONE>;
+			clocks = <&CLK_SYSIN>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_keyscan>;
+			resets	= <&powerdown STIH416_KEYSCAN_POWERDOWN>,
+				  <&softreset STIH416_KEYSCAN_SOFTRESET>;
+		};
 	};
 };
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
