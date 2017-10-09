From: Dan Haab <riproute-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] ARM: dts: BCM53573: Add DT for Luxul XAP-810
Date: Mon,  9 Oct 2017 09:46:59 -0600
Message-ID: <1507564020-7394-1-git-send-email-riproute@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dan Haab <dhaab-RSK6WAzFx3QAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Dan Haab <dhaab-RSK6WAzFx3QAvxtiuMwx3w@public.gmane.org>

This is BCM53573 WiSoC based access point with an extra BCM43217 chipset
used for 2.4 GHz.

Signed-off-by: Dan Haab <dhaab-RSK6WAzFx3QAvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/Makefile                   |  1 +
 arch/arm/boot/dts/bcm47189-luxul-xap-810.dts | 87 ++++++++++++++++++++++++++++
 2 files changed, 88 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm47189-luxul-xap-810.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 2d964c9..5cac283 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -110,6 +110,7 @@ dtb-$(CONFIG_ARCH_BCM_5301X) += \
 	bcm953012hr.dtb \
 	bcm953012k.dtb
 dtb-$(CONFIG_ARCH_BCM_53573) += \
+	bcm47189-luxul-xap-810.dtb \
 	bcm47189-tenda-ac9.dtb \
 	bcm947189acdbmr.dtb
 dtb-$(CONFIG_ARCH_BCM_63XX) += \
diff --git a/arch/arm/boot/dts/bcm47189-luxul-xap-810.dts b/arch/arm/boot/dts/bcm47189-luxul-xap-810.dts
new file mode 100644
index 0000000..214df18
--- /dev/null
+++ b/arch/arm/boot/dts/bcm47189-luxul-xap-810.dts
@@ -0,0 +1,87 @@
+/*
+ * Copyright 2017 Luxul Inc.
+ *
+ * Licensed under the ISC license.
+ */
+
+/dts-v1/;
+
+#include "bcm53573.dtsi"
+
+/ {
+	compatible = "luxul,xap-810-v1", "brcm,bcm47189", "brcm,bcm53573";
+	model = "Luxul XAP-810 V1";
+
+	chosen {
+		bootargs = "earlycon";
+	};
+
+	memory {
+		reg = <0x00000000 0x08000000>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		5ghz {
+			label = "bcm53xx:blue:5ghz";
+			gpios = <&chipcommon 11 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "default-off";
+		};
+
+		system {
+			label = "bcm53xx:green:system";
+			gpios = <&chipcommon 15 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "timer";
+		};
+	};
+
+	pcie0_leds {
+		compatible = "gpio-leds";
+
+		2ghz {
+			label = "bcm53xx:blue:2ghz";
+			gpios = <&pcie0_chipcommon 3 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "default-off";
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
+			gpios = <&chipcommon 7 GPIO_ACTIVE_LOW>;
+		};
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
+
+			pcie0_chipcommon: chipcommon@0 {
+				reg = <0 0x1000>;
+
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+		};
+	};
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
