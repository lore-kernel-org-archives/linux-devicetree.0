From: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 4/4] ARM: dts: da850-evm: add the UI expander node
Date: Thu, 16 Feb 2017 19:15:32 +0100
Message-ID: <1487268932-6469-5-git-send-email-bgolaszewski@baylibre.com>
References: <1487268932-6469-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1487268932-6469-1-git-send-email-bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, David Lechner <david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Patrick Titiano <ptitiano-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

If we're using the UI board and want vpif capture, we need to select
the video capture functionality by driving the sel_c pin low on the
tca6416 expander and sel_a & sel_b pins high. Do it statically by
hogging relevant GPIOs in the device tree.

Signed-off-by: Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/da850-evm.dts | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm/boot/dts/da850-evm.dts b/arch/arm/boot/dts/da850-evm.dts
index b549861..a90c764 100644
--- a/arch/arm/boot/dts/da850-evm.dts
+++ b/arch/arm/boot/dts/da850-evm.dts
@@ -9,6 +9,7 @@
  */
 /dts-v1/;
 #include "da850.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	compatible = "ti,da850-evm", "ti,da850";
@@ -78,7 +79,33 @@
 				DRVDD-supply = <&vbat>;
 				DVDD-supply = <&vbat>;
 			};
+			ui_expander: tca6416@20 {
+				compatible = "ti,tca6416";
+				reg = <0x20>;
+				gpio-controller;
+				#gpio-cells = <2>;
 
+				sel_a {
+					gpio-hog;
+					gpios = <7 GPIO_ACTIVE_HIGH>;
+					output-high;
+					line-name = "sel_a";
+				};
+
+				sel_b {
+					gpio-hog;
+					gpios = <6 GPIO_ACTIVE_HIGH>;
+					output-high;
+					line-name = "sel_b";
+				};
+
+				sel_c {
+					gpio-hog;
+					gpios = <5 GPIO_ACTIVE_HIGH>;
+					output-low;
+					line-name = "sel_c";
+				};
+			};
 		};
 		wdt: wdt@21000 {
 			status = "okay";
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
