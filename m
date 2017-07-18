From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: dts: BCM53573: Add Broadcom BCM947189ACDBMR board support
Date: Tue, 18 Jul 2017 12:37:37 -0700
Message-ID: <20170718193740.8610-1-f.fainelli@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
Cc: rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM PORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Adds support for the Broadcom reference board BCM947189ACDMBR which
features the following:

* 128MB of DRAM
* External MoCA support through a Broadcom BCM6802 chip
* 1x external Gigabit PHY through the external BCM6802
* 1x USB 2.0 port
* 1x PCIE slot
* Few configurable buttons and LEDs

Signed-off-by: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/Makefile            |  3 +-
 arch/arm/boot/dts/bcm947189acdbmr.dts | 97 +++++++++++++++++++++++++++++++++++
 2 files changed, 99 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/bcm947189acdbmr.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 4b17f35dc9a7..236587e7f07d 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -106,7 +106,8 @@ dtb-$(CONFIG_ARCH_BCM_5301X) += \
 	bcm953012hr.dtb \
 	bcm953012k.dtb
 dtb-$(CONFIG_ARCH_BCM_53573) += \
-	bcm47189-tenda-ac9.dtb
+	bcm47189-tenda-ac9.dtb \
+	bcm947189acdbmr.dtb
 dtb-$(CONFIG_ARCH_BCM_63XX) += \
 	bcm963138dvt.dtb
 dtb-$(CONFIG_ARCH_BCM_CYGNUS) += \
diff --git a/arch/arm/boot/dts/bcm947189acdbmr.dts b/arch/arm/boot/dts/bcm947189acdbmr.dts
new file mode 100644
index 000000000000..ef263412fea5
--- /dev/null
+++ b/arch/arm/boot/dts/bcm947189acdbmr.dts
@@ -0,0 +1,97 @@
+/*
+ * Copyright (C) 2017 Broadcom
+ * Author: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+ *
+ * Licensed under the ISC license.
+ */
+
+/dts-v1/;
+
+#include "bcm53573.dtsi"
+
+/ {
+	compatible = "brcm,bcm947189acdbmr", "brcm,bcm47189", "brcm,bcm53573";
+	model = "Broadcom BCM947189ACDBMR";
+
+	chosen {
+		bootargs = "console=ttyS0,115200 earlycon";
+	};
+
+	memory {
+		reg = <0x00000000 0x08000000>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		wps {
+			label = "bcm53xx:blue:wps";
+			gpios = <&chipcommon 10 GPIO_ACTIVE_HIGH>;
+		};
+
+		5ghz {
+			label = "bcm53xx:blue:5ghz";
+			gpios = <&chipcommon 11 GPIO_ACTIVE_HIGH>;
+		};
+
+		2ghz {
+			label = "bcm53xx:blue:2ghz";
+			gpios = <&chipcommon 12 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		restart {
+			label = "Reset";
+			linux,code = <KEY_RESTART>;
+			gpios = <&chipcommon 7 GPIO_ACTIVE_HIGH>;
+		};
+
+		wps {
+			label = "WPS";
+			linux,code = <KEY_WPS_BUTTON>;
+			gpios = <&chipcommon 9 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	spi {
+		compatible = "spi-gpio";
+		num-chipselects = <1>;
+		gpio-sck = <&chipcommon 21 0>;
+		gpio-miso = <&chipcommon 22 0>;
+		gpio-mosi = <&chipcommon 23 0>;
+		cs-gpios = <&chipcommon 24 0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* External BCM6802 MoCA chip is connected */
+	};
+};
+
+&pcie0 {
+	ranges = <0x00000000 0 0 0 0 0x00100000>;
+	#address-cells = <3>;
+	#size-cells = <2>;
+
+	bridge@0,0,0 {
+		reg = <0x0000 0 0 0 0>;
+		ranges = <0x00000000 0 0 0 0 0 0 0x00100000>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+
+		wifi@0,1,0 {
+			reg = <0x0000 0 0 0 0>;
+			ranges = <0x00000000 0 0 0 0x00100000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+	};
+};
+
+&usb2 {
+	vcc-gpio = <&chipcommon 8 GPIO_ACTIVE_HIGH>;
+};
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
