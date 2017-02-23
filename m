From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH V2] ARM: dts: BCM5301X: Add basic DT for Linksys EA9500
Date: Thu, 23 Feb 2017 13:56:12 +0100
Message-ID: <20170223125612.2394-1-zajec5@gmail.com>
References: <20170223104025.5755-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170223104025.5755-1-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>

It's tri-band wireless home router based on BCM47094 AKA BCM4709C0. It
uses 3 x BCM4366 chipsets for wireless.
Panamera seems to be board name used by Linksys.

Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
---
V2: Use panamera board name
---
 arch/arm/boot/dts/Makefile                      |  1 +
 arch/arm/boot/dts/bcm47094-linksys-panamera.dts | 36 +++++++++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm47094-linksys-panamera.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 52a05289c538..2feabbe16d53 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -93,6 +93,7 @@ dtb-$(CONFIG_ARCH_BCM_5301X) += \
 	bcm4709-netgear-r8000.dtb \
 	bcm4709-tplink-archer-c9-v1.dtb \
 	bcm47094-dlink-dir-885l.dtb \
+	bcm47094-linksys-panamera.dtb \
 	bcm47094-luxul-xwr-3100.dtb \
 	bcm47094-netgear-r8500.dtb \
 	bcm94708.dtb \
diff --git a/arch/arm/boot/dts/bcm47094-linksys-panamera.dts b/arch/arm/boot/dts/bcm47094-linksys-panamera.dts
new file mode 100644
index 000000000000..31639e5b8c72
--- /dev/null
+++ b/arch/arm/boot/dts/bcm47094-linksys-panamera.dts
@@ -0,0 +1,36 @@
+/*
+ * Copyright (C) 2017 Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
+ *
+ * Licensed under the ISC license.
+ */
+
+/dts-v1/;
+
+#include "bcm47094.dtsi"
+#include "bcm5301x-nand-cs0-bch8.dtsi"
+
+/ {
+	compatible = "linksys,ea9500", "brcm,bcm47094", "brcm,bcm4708";
+	model = "Linksys EA9500";
+
+	chosen {
+		bootargs = "console=ttyS0,115200";
+	};
+
+	memory {
+		reg = <0x00000000 0x08000000
+		       0x88000000 0x08000000>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		wps {
+			label = "WPS";
+			linux,code = <KEY_WPS_BUTTON>;
+			gpios = <&chipcommon 3 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
