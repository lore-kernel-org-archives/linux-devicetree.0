From: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Subject: [PATCH V2 RESEND 4/4] ARM: bcm2835: Use pinctrl header
Date: Thu, 29 Jan 2015 18:10:50 +0000
Message-ID: <1422555050-28509-5-git-send-email-stefan.wahren@i2se.com>
References: <1422555050-28509-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422555050-28509-1-git-send-email-stefan.wahren-eS4NqCHxEME@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch converts all bcm2835 dts and dtsi files to use the pinctrl
header file.

Signed-off-by: Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
---
 arch/arm/boot/dts/bcm2835-rpi-b-plus.dts |    4 ++--
 arch/arm/boot/dts/bcm2835-rpi-b.dts      |    4 ++--
 arch/arm/boot/dts/bcm2835-rpi.dtsi       |    8 ++++----
 arch/arm/boot/dts/bcm2835.dtsi           |    3 ++-
 4 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts b/arch/arm/boot/dts/bcm2835-rpi-b-plus.dts
index e479515..668442b 100644
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
+		brcm,function = <BCM2835_FSEL_ALT0>;
 	};
 };
diff --git a/arch/arm/boot/dts/bcm2835-rpi-b.dts b/arch/arm/boot/dts/bcm2835-rpi-b.dts
index bafa46f..ee89b79 100644
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
+		brcm,function = <BCM2835_FSEL_ALT2>;
 	};
 };
diff --git a/arch/arm/boot/dts/bcm2835-rpi.dtsi b/arch/arm/boot/dts/bcm2835-rpi.dtsi
index c706448..46780bb 100644
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
+		brcm,function = <BCM2835_FSEL_GPIO_OUT>;
 	};
 
 	alt0: alt0 {
 		brcm,pins = <0 1 2 3 4 5 7 8 9 10 11 14 15 40 45>;
-		brcm,function = <4>; /* alt0 */
+		brcm,function = <BCM2835_FSEL_ALT0>;
 	};
 
 	alt3: alt3 {
 		brcm,pins = <48 49 50 51 52 53>;
-		brcm,function = <7>; /* alt3 */
+		brcm,function = <BCM2835_FSEL_ALT3>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/bcm2835.dtsi b/arch/arm/boot/dts/bcm2835.dtsi
index 3342cb1..be9c914 100644
--- a/arch/arm/boot/dts/bcm2835.dtsi
+++ b/arch/arm/boot/dts/bcm2835.dtsi
@@ -1,4 +1,5 @@
-/include/ "skeleton.dtsi"
+#include <dt-bindings/pinctrl/bcm2835.h>
+#include "skeleton.dtsi"
 
 / {
 	compatible = "brcm,bcm2835";
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
