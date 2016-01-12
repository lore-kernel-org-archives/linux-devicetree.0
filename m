From: Jagan Teki <jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] arm: dts: zynq: Add MicroZed board support
Date: Tue, 12 Jan 2016 11:23:46 +0530
Message-ID: <1452578026-4496-1-git-send-email-jteki@openedev.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jagan Teki <jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>, Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Added basic dts support for MicroZed board.

Cc: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Jagan Teki <jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
---
 arch/arm/boot/dts/Makefile          |  1 +
 arch/arm/boot/dts/zynq-microzed.dts | 45 +++++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 arch/arm/boot/dts/zynq-microzed.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 30bbc37..9eb52fa 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -725,6 +725,7 @@ dtb-$(CONFIG_ARCH_VT8500) += \
 	wm8750-apc8750.dtb \
 	wm8850-w70v2.dtb
 dtb-$(CONFIG_ARCH_ZYNQ) += \
+	zynq-microzed.dtb \
 	zynq-parallella.dtb \
 	zynq-zc702.dtb \
 	zynq-zc706.dtb \
diff --git a/arch/arm/boot/dts/zynq-microzed.dts b/arch/arm/boot/dts/zynq-microzed.dts
new file mode 100644
index 0000000..a8c7d2b
--- /dev/null
+++ b/arch/arm/boot/dts/zynq-microzed.dts
@@ -0,0 +1,45 @@
+/*
+ * Copyright (C) 2015 Jagan Teki <jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
+ *
+ * This software is licensed under the terms of the GNU General Public
+ * License version 2, as published by the Free Software Foundation, and
+ * may be copied, distributed, and modified under those terms.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+/dts-v1/;
+/include/ "zynq-7000.dtsi"
+
+/ {
+	model = "Zynq MicroZED Development Board";
+	compatible = "xlnx,zynq-microzed", "xlnx,zynq-7000";
+
+	aliases {
+		serial0 = &uart1;
+	};
+
+	memory {
+		device_type = "memory";
+		reg = <0x0 0x40000000>;
+	};
+
+	chosen {
+		bootargs = "earlyprintk";
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&clkc {
+	ps-clk-frequency = <33333333>;
+};
+
+&sdhci0 {
+	status = "okay";
+};
+
+&uart1 {
+	status = "okay";
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
