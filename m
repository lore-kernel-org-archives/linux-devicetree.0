From: Dan Haab <riproute-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] ARM: dts: BCM53573: Add DT for Luxul XAP-1440
Date: Mon,  9 Oct 2017 09:47:00 -0600
Message-ID: <1507564020-7394-2-git-send-email-riproute@gmail.com>
References: <1507564020-7394-1-git-send-email-riproute@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1507564020-7394-1-git-send-email-riproute-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Jon Mason <jonmason-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dan Haab <dhaab-RSK6WAzFx3QAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Dan Haab <dhaab-RSK6WAzFx3QAvxtiuMwx3w@public.gmane.org>

This is BCM53573 WiSoC based outdoor access point with an extra BCM43217
chipset used for 2.4 GHz.

Signed-off-by: Dan Haab <dhaab-RSK6WAzFx3QAvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/Makefile                    |  1 +
 arch/arm/boot/dts/bcm47189-luxul-xap-1440.dts | 50 +++++++++++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm47189-luxul-xap-1440.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 5cac283..1e1ad2f 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -110,6 +110,7 @@ dtb-$(CONFIG_ARCH_BCM_5301X) += \
 	bcm953012hr.dtb \
 	bcm953012k.dtb
 dtb-$(CONFIG_ARCH_BCM_53573) += \
+	bcm47189-luxul-xap-1440.dtb \
 	bcm47189-luxul-xap-810.dtb \
 	bcm47189-tenda-ac9.dtb \
 	bcm947189acdbmr.dtb
diff --git a/arch/arm/boot/dts/bcm47189-luxul-xap-1440.dts b/arch/arm/boot/dts/bcm47189-luxul-xap-1440.dts
new file mode 100644
index 0000000..74c83b0
--- /dev/null
+++ b/arch/arm/boot/dts/bcm47189-luxul-xap-1440.dts
@@ -0,0 +1,50 @@
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
+	compatible = "luxul,xap-1440-v1", "brcm,bcm47189", "brcm,bcm53573";
+	model = "Luxul XAP-1440 V1";
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
+		wlan {
+			label = "bcm53xx:blue:wlan";
+			gpios = <&chipcommon 10 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "default-off";
+		};
+
+		system {
+			label = "bcm53xx:green:system";
+			gpios = <&chipcommon 11 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "timer";
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
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
