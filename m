From: Dan Haab <riproute-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] ARM: dts: BCM5301X: Add DT for Luxul XBR-4500
Date: Mon,  9 Oct 2017 09:46:22 -0600
Message-ID: <1507563983-7354-1-git-send-email-riproute@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dan Haab <dhaab-RSK6WAzFx3QAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Dan Haab <dhaab-RSK6WAzFx3QAvxtiuMwx3w@public.gmane.org>

This is BCM47094 (AKA BCM4709C0) based router with ports-on-the-front
board design.

Signed-off-by: Dan Haab <dhaab-RSK6WAzFx3QAvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/Makefile                    |  1 +
 arch/arm/boot/dts/bcm47094-luxul-xbr-4500.dts | 63 +++++++++++++++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm47094-luxul-xbr-4500.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index faf46ab..563f8a4 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -100,6 +100,7 @@ dtb-$(CONFIG_ARCH_BCM_5301X) += \
 	bcm4709-tplink-archer-c9-v1.dtb \
 	bcm47094-dlink-dir-885l.dtb \
 	bcm47094-linksys-panamera.dtb \
+	bcm47094-luxul-xbr-4500.dtb \
 	bcm47094-luxul-xwr-3100.dtb \
 	bcm47094-netgear-r8500.dtb \
 	bcm94708.dtb \
diff --git a/arch/arm/boot/dts/bcm47094-luxul-xbr-4500.dts b/arch/arm/boot/dts/bcm47094-luxul-xbr-4500.dts
new file mode 100644
index 0000000..15ffb1a
--- /dev/null
+++ b/arch/arm/boot/dts/bcm47094-luxul-xbr-4500.dts
@@ -0,0 +1,63 @@
+/*
+ * Copyright (C) 2017 Luxul Inc.
+ *
+ * Licensed under the ISC license.
+ */
+
+/dts-v1/;
+
+#include "bcm4708.dtsi"
+#include "bcm5301x-nand-cs0-bch8.dtsi"
+
+/ {
+	compatible = "luxul,xbr-4500-v1", "brcm,bcm47094", "brcm,bcm4708";
+	model = "Luxul XBR-4500 V1";
+
+	chosen {
+		bootargs = "earlycon";
+	};
+
+	memory {
+		reg = <0x00000000 0x08000000
+		       0x88000000 0x18000000>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		status {
+			label = "bcm53xx:green:status";
+			gpios = <&chipcommon 20 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "timer";
+		};
+
+		usb3 {
+			label = "bcm53xx:green:usb3";
+			gpios = <&chipcommon 19 GPIO_ACTIVE_HIGH>;
+			trigger-sources = <&ohci_port1>, <&ehci_port1>,
+				<&xhci_port1>;
+			linux,default-trigger = "usbport";
+		};
+
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
+			gpios = <&chipcommon 17 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
+&usb3 {
+	vcc-gpio = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
+};
+
+&spi_nor {
+	status = "okay";
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
