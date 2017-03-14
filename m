From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH V2] ARM: dts: BCM5301X: Add support for TP-LINK Archer C5 V2
Date: Tue, 14 Mar 2017 11:39:41 +0100
Message-ID: <20170314103941.1478-1-zajec5@gmail.com>
References: <20170311121453.18534-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170311121453.18534-1-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>

This is BCM47081A0 based home router with BCM43217 and BCM4352 wireless
chipsets.

Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
---
V2: Don't specify console parameters in bootargs. A separated patch has been
    sent to handle this properly:
    [PATCH 1/2] ARM: dts: BCM5301X: Specify serial console parameters
---
 arch/arm/boot/dts/Makefile                         |  1 +
 arch/arm/boot/dts/bcm47081-tplink-archer-c5-v2.dts | 98 ++++++++++++++++++++++
 2 files changed, 99 insertions(+)
 create mode 100644 arch/arm/boot/dts/bcm47081-tplink-archer-c5-v2.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 595c74a35a7b..1e24f5db4835 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -88,6 +88,7 @@ dtb-$(CONFIG_ARCH_BCM_5301X) += \
 	bcm47081-buffalo-wzr-900dhp.dtb \
 	bcm47081-luxul-xap-1410.dtb \
 	bcm47081-luxul-xwr-1200.dtb \
+	bcm47081-tplink-archer-c5-v2.dtb \
 	bcm4709-asus-rt-ac87u.dtb \
 	bcm4709-buffalo-wxr-1900dhp.dtb \
 	bcm4709-linksys-ea9200.dtb \
diff --git a/arch/arm/boot/dts/bcm47081-tplink-archer-c5-v2.dts b/arch/arm/boot/dts/bcm47081-tplink-archer-c5-v2.dts
new file mode 100644
index 000000000000..a854a5174b7f
--- /dev/null
+++ b/arch/arm/boot/dts/bcm47081-tplink-archer-c5-v2.dts
@@ -0,0 +1,98 @@
+/*
+ * Copyright (C) 2017 Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
+ *
+ * Licensed under the ISC license.
+ */
+
+/dts-v1/;
+
+#include "bcm47081.dtsi"
+
+/ {
+	compatible = "tplink,archer-c5-v2", "brcm,bcm47081", "brcm,bcm4708";
+	model = "TP-LINK Archer C5 V2";
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
+		2ghz {
+			label = "bcm53xx:green:2ghz";
+			gpios = <&chipcommon 0 GPIO_ACTIVE_HIGH>;
+		};
+
+		lan {
+			label = "bcm53xx:green:lan";
+			gpios = <&chipcommon 1 GPIO_ACTIVE_HIGH>;
+		};
+
+		usb2-port1 {
+			label = "bcm53xx:green:usb2-port1";
+			gpios = <&chipcommon 2 GPIO_ACTIVE_HIGH>;
+		};
+
+		power {
+			label = "bcm53xx:green:power";
+			gpios = <&chipcommon 4 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "default-on";
+		};
+
+		wan-green {
+			label = "bcm53xx:green:wan";
+			gpios = <&chipcommon 5 GPIO_ACTIVE_HIGH>;
+		};
+
+		wps {
+			label = "bcm53xx:green:wps";
+			gpios = <&chipcommon 6 GPIO_ACTIVE_HIGH>;
+		};
+
+		wan-amber {
+			label = "bcm53xx:amber:wan";
+			gpios = <&chipcommon 8 GPIO_ACTIVE_HIGH>;
+		};
+
+		5ghz {
+			label = "bcm53xx:green:5ghz";
+			gpios = <&chipcommon 12 GPIO_ACTIVE_HIGH>;
+		};
+
+		usb2-port2 {
+			label = "bcm53xx:green:usb2-port2";
+			gpios = <&chipcommon 13 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		rfkill {
+			label = "WiFi";
+			linux,code = <KEY_RFKILL>;
+			gpios = <&chipcommon 3 GPIO_ACTIVE_LOW>;
+		};
+
+		restart {
+			label = "Reset";
+			linux,code = <KEY_RESTART>;
+			gpios = <&chipcommon 7 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
+&spi_nor {
+	status = "okay";
+};
+
+&usb2 {
+	vcc-gpio = <&chipcommon 9 GPIO_ACTIVE_HIGH>;
+};
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
