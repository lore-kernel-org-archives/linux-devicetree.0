From: Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2] ARM: dts: add initial VF610 Cosmic/Cosmic+ board support
Date: Mon, 23 Sep 2013 11:14:44 -0400
Message-ID: <1379949284-19936-1-git-send-email-matt.porter@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>
Cc: Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linaro Patches <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add initial PHYTEC VF610 Cosmic/Cosmic+ board support with
UART and FEC enabled.

Signed-off-by: Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
Changes since v1:
	- Add #clocks to the enet clock to comply with fixed-clock binding
	- Peripheral nodes in alphabetical order

 arch/arm/boot/dts/Makefile         |  1 +
 arch/arm/boot/dts/vf610-cosmic.dts | 47 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)
 create mode 100644 arch/arm/boot/dts/vf610-cosmic.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index cc0f1fb..b0d6156 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -142,6 +142,7 @@ dtb-$(CONFIG_ARCH_MXC) += \
 	imx6q-sbc6x.dtb \
 	imx6q-wandboard.dtb \
 	imx6sl-evk.dtb \
+	vf610-cosmic.dtb \
 	vf610-twr.dtb
 dtb-$(CONFIG_ARCH_MXS) += imx23-evk.dtb \
 	imx23-olinuxino.dtb \
diff --git a/arch/arm/boot/dts/vf610-cosmic.dts b/arch/arm/boot/dts/vf610-cosmic.dts
new file mode 100644
index 0000000..c42e4f9
--- /dev/null
+++ b/arch/arm/boot/dts/vf610-cosmic.dts
@@ -0,0 +1,47 @@
+/*
+ * Copyright 2013 Freescale Semiconductor, Inc.
+ * Copyright 2013 Linaro Limited
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ */
+
+/dts-v1/;
+#include "vf610.dtsi"
+
+/ {
+	model = "PHYTEC Cosmic/Cosmic+ Board";
+	compatible = "phytec,vf610-cosmic", "fsl,vf610";
+
+	chosen {
+		bootargs = "console=ttyLP1,115200";
+	};
+
+	memory {
+		reg = <0x80000000 0x10000000>;
+	};
+
+	clocks {
+		enet_ext {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <50000000>;
+		};
+	};
+
+};
+
+&fec1 {
+	phy-mode = "rmii";
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_fec1_1>;
+	status = "okay";
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart1_1>;
+	status = "okay";
+};
-- 
1.8.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
