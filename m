From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH 3/3] arm: dts: owl-s500: Add Sparky
Date: Tue, 14 Nov 2017 19:01:14 +0100
Message-ID: <20171114180114.26408-4-afaerber@suse.de>
References: <20171114180114.26408-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171114180114.26408-1-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Thomas Liau <thomas.liau-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, Jeff Chen <jeff.chen-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, =?UTF-8?q?=E5=BC=A0=E4=B8=9C=E9=A3=8E?= <zhangdf-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, =?UTF-8?q?=E5=88=98=E7=82=9C?= <liuwei-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, =?UTF-8?q?=E5=BC=A0=E5=A4=A9=E7=9B=8A?= <tyzhang-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, =?UTF-8?q?=E6=A2=85=E5=88=A9?= <harrymei-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org>, Ioan B <ioan-HmMszb9TTf4@public.gmane.org>, Sudeep Kumar <sudeepkumar-/0wLYENt7sWikuSvNLsyVV6hYfS7NtTn@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add a Device Tree for the Allo.com Sparky SBC.

Signed-off-by: Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org>
---
 arch/arm/boot/dts/Makefile            |  3 ++-
 arch/arm/boot/dts/owl-s500-sparky.dts | 44 +++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/owl-s500-sparky.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index d0381e9caf21..ad77f7656a70 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -707,7 +707,8 @@ dtb-$(CONFIG_ARCH_ORION5X) += \
 	orion5x-rd88f5182-nas.dtb
 dtb-$(CONFIG_ARCH_ACTIONS) += \
 	owl-s500-cubieboard6.dtb \
-	owl-s500-guitar-bb-rev-b.dtb
+	owl-s500-guitar-bb-rev-b.dtb \
+	owl-s500-sparky.dtb
 dtb-$(CONFIG_ARCH_PRIMA2) += \
 	prima2-evb.dtb
 dtb-$(CONFIG_ARCH_OXNAS) += \
diff --git a/arch/arm/boot/dts/owl-s500-sparky.dts b/arch/arm/boot/dts/owl-s500-sparky.dts
new file mode 100644
index 000000000000..f620548c6c0b
--- /dev/null
+++ b/arch/arm/boot/dts/owl-s500-sparky.dts
@@ -0,0 +1,44 @@
+/*
+ * Allo.com Sparky
+ *
+ * Copyright (c) 2017 Andreas Färber
+ *
+ * SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+ */
+
+/dts-v1/;
+
+#include "owl-s500.dtsi"
+
+/ {
+	compatible = "allo,sparky", "actions,s500";
+	model = "Allo.com Sparky";
+
+	aliases {
+		serial3 = &uart3;
+	};
+
+	chosen {
+		stdout-path = "serial3:115200n8";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x40000000>; /* 1 or 2 GiB */
+	};
+
+	uart3_clk: uart3-clk {
+		compatible = "fixed-clock";
+		clock-frequency = <921600>;
+		#clock-cells = <0>;
+	};
+};
+
+&timer {
+	clocks = <&hosc>;
+};
+
+&uart3 {
+	status = "okay";
+	clocks = <&uart3_clk>;
+};
-- 
2.13.6

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
