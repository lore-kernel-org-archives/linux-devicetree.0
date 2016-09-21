From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/3] ARM: BCM5301X: Add separated DTS include file for BCM47094
Date: Wed, 21 Sep 2016 22:58:32 +0200
Message-ID: <20160921205838.15627-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "maintainer:BROADCOM BCM5301X ARM
        ARCHITECTURE" <bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "open list:BROADCOM BCM5301X ARM
        ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>

Use it to store BCM47094 specific properties/values and avoid repeating
them in device DTS files.

Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
---
 arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts |  3 +--
 arch/arm/boot/dts/bcm47094-netgear-r8500.dts  |  3 +--
 arch/arm/boot/dts/bcm47094.dtsi               | 11 +++++++++++
 3 files changed, 13 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/boot/dts/bcm47094.dtsi

diff --git a/arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts b/arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts
index c8c0b36..661348d 100644
--- a/arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts
+++ b/arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts
@@ -9,7 +9,7 @@
 
 /dts-v1/;
 
-#include "bcm4708.dtsi"
+#include "bcm47094.dtsi"
 #include "bcm5301x-nand-cs0-bch1.dtsi"
 
 / {
@@ -107,7 +107,6 @@
 
 &uart0 {
 	status = "okay";
-	clock-frequency = <125000000>;
 };
 
 &usb3 {
diff --git a/arch/arm/boot/dts/bcm47094-netgear-r8500.dts b/arch/arm/boot/dts/bcm47094-netgear-r8500.dts
index 10db4f8..521b415 100644
--- a/arch/arm/boot/dts/bcm47094-netgear-r8500.dts
+++ b/arch/arm/boot/dts/bcm47094-netgear-r8500.dts
@@ -6,7 +6,7 @@
 
 /dts-v1/;
 
-#include "bcm4708.dtsi"
+#include "bcm47094.dtsi"
 #include "bcm5301x-nand-cs0-bch8.dtsi"
 
 / {
@@ -100,5 +100,4 @@
 
 &uart0 {
 	status = "okay";
-	clock-frequency = <125000000>;
 };
diff --git a/arch/arm/boot/dts/bcm47094.dtsi b/arch/arm/boot/dts/bcm47094.dtsi
new file mode 100644
index 0000000..f039765
--- /dev/null
+++ b/arch/arm/boot/dts/bcm47094.dtsi
@@ -0,0 +1,11 @@
+/*
+ * Copyright (C) 2016 Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
+ *
+ * Licensed under the ISC license.
+ */
+
+#include "bcm4708.dtsi"
+
+&uart0 {
+	clock-frequency = <125000000>;
+};
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
