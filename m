From: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
Subject: [PATCH] ARM: bcm2835: dt: Add Raspberry Pi Zero
Date: Thu,  4 Feb 2016 08:39:06 +0100
Message-ID: <1454571546-25481-1-git-send-email-lkundrak@v3.sk>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Notable difference from the other Raspberry Pi boards is the lack of PWR LED.

Signed-off-by: Lubomir Rintel <lkundrak-NGH9Lh4a5iE@public.gmane.org>
---
 arch/arm/boot/dts/Makefile             |  3 ++-
 arch/arm/boot/dts/bcm2835-rpi-zero.dts | 24 ++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/bcm2835-rpi-zero.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index d000814..5d38b88 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -64,7 +64,8 @@ dtb-$(CONFIG_ARCH_BCM2835) += \
 	bcm2835-rpi-b-rev2.dtb \
 	bcm2835-rpi-b-plus.dtb \
 	bcm2835-rpi-a-plus.dtb \
-	bcm2836-rpi-2-b.dtb
+	bcm2836-rpi-2-b.dtb \
+	bcm2835-rpi-zero.dtb
 dtb-$(CONFIG_ARCH_BCM_5301X) += \
 	bcm4708-asus-rt-ac56u.dtb \
 	bcm4708-asus-rt-ac68u.dtb \
diff --git a/arch/arm/boot/dts/bcm2835-rpi-zero.dts b/arch/arm/boot/dts/bcm2835-rpi-zero.dts
new file mode 100644
index 0000000..f9afc1a
--- /dev/null
+++ b/arch/arm/boot/dts/bcm2835-rpi-zero.dts
@@ -0,0 +1,24 @@
+/dts-v1/;
+#include "bcm2835.dtsi"
+#include "bcm2835-rpi.dtsi"
+
+/ {
+	compatible = "raspberrypi,model-zero", "brcm,bcm2835";
+	model = "Raspberry Pi Zero";
+
+	leds {
+		act {
+			gpios = <&gpio 47 0>;
+		};
+	};
+};
+
+&gpio {
+	pinctrl-0 = <&gpioout &alt0 &i2s_alt0 &alt3>;
+
+	/* I2S interface */
+	i2s_alt0: i2s_alt0 {
+		brcm,pins = <18 19 20 21>;
+		brcm,function = <BCM2835_FSEL_ALT0>;
+	};
+};
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
