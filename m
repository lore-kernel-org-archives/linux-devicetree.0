From: Alexander Stein <alexanders83-S0/GAf8tV78@public.gmane.org>
Subject: [PATCH 2/2] ARM: bcm2835: Use pinctrl defines
Date: Sun, 12 Apr 2015 14:33:56 +0200
Message-ID: <1428842036-14202-2-git-send-email-alexanders83@web.de>
References: <1428842036-14202-1-git-send-email-alexanders83@web.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1428842036-14202-1-git-send-email-alexanders83-S0/GAf8tV78@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Alexander Stein <alexanders83-S0/GAf8tV78@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Using the more descriptive defines rather than pure numbers we can rid
of the comments.
We need to use #include to use CPP for the new include directory.

Signed-off-by: Alexander Stein <alexanders83-S0/GAf8tV78@public.gmane.org>
---
 arch/arm/boot/dts/bcm2835-rpi-b-plus.dts | 4 ++--
 arch/arm/boot/dts/bcm2835-rpi-b.dts      | 6 +++---
 arch/arm/boot/dts/bcm2835-rpi.dtsi       | 8 ++++----
 arch/arm/boot/dts/bcm2835.dtsi           | 3 ++-
 4 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts b/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
index e479515099c3..672b8c5d6a62 100644
--- a/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
@@ -1,5 +1,5 @@
 /dts-v1/;
-/include/ "bcm2835-rpi.dtsi"
+#include "bcm2835-rpi.dtsi"
 
 / {
 	compatible = "raspberrypi,model-b-plus", "brcm,bcm2835";
@@ -25,6 +25,6 @@
 	/* I2S interface */
 	i2s_alt0: i2s_alt0 {
 		brcm,pins = <18 19 20 21>;
-		brcm,function = <4>; /* alt0 */
+		brcm,function = <BCM2835_GPIO_ALT0>;
 	};
 };
diff --git a/arch/arm/boot/dts/bcm2835-rpi-b.dts b/arch/arm/boot/dts/bcm2835-rpi-b.dts
index bafa46fc226a..ae0f1a930630 100644
--- a/arch/arm/boot/dts/bcm2835-rpi-b.dts
+++ b/arch/arm/boot/dts/bcm2835-rpi-b.dts
@@ -1,5 +1,5 @@
 /dts-v1/;
-/include/ "bcm2835-rpi.dtsi"
+#include "bcm2835-rpi.dtsi"
 
 / {
 	compatible = "raspberrypi,model-b", "brcm,bcm2835";
@@ -18,6 +18,6 @@
 	/* I2S interface */
 	i2s_alt2: i2s_alt2 {
 		brcm,pins = <28 29 30 31>;
-		brcm,function = <6>; /* alt2 */
+		brcm,function = <BCM2835_GPIO_ALT2>;
 	};
-};
+};
\ No newline at end of file
diff --git a/arch/arm/boot/dts/bcm2835-rpi.dtsi b/arch/arm/boot/dts/bcm2835-rpi.dtsi
index c7064487017d..1b484703f57c 100644
--- a/arch/arm/boot/dts/bcm2835-rpi.dtsi
+++ b/arch/arm/boot/dts/bcm2835-rpi.dtsi
@@ -1,4 +1,4 @@
-/include/ "bcm2835.dtsi"
+#include "bcm2835.dtsi"
 
 / {
 	memory {
@@ -21,17 +21,17 @@
 
 	gpioout: gpioout {
 		brcm,pins = <6>;
-		brcm,function = <1>; /* GPIO out */
+		brcm,function = <BCM2835_GPIO_OUTPUT>;
 	};
 
 	alt0: alt0 {
 		brcm,pins = <0 1 2 3 4 5 7 8 9 10 11 14 15 40 45>;
-		brcm,function = <4>; /* alt0 */
+		brcm,function = <BCM2835_GPIO_ALT0>;
 	};
 
 	alt3: alt3 {
 		brcm,pins = <48 49 50 51 52 53>;
-		brcm,function = <7>; /* alt3 */
+		brcm,function = <BCM2835_GPIO_ALT3>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/bcm2835.dtsi b/arch/arm/boot/dts/bcm2835.dtsi
index 3342cb1407bc..e39737ba47b4 100644
--- a/arch/arm/boot/dts/bcm2835.dtsi
+++ b/arch/arm/boot/dts/bcm2835.dtsi
@@ -1,4 +1,5 @@
-/include/ "skeleton.dtsi"
+#include "skeleton.dtsi"
+#include <dt-bindings/pinctrl/bcm2835.h>
 
 / {
 	compatible = "brcm,bcm2835";
-- 
2.3.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
