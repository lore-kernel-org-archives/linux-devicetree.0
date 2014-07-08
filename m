From: Robert Nelson <robertcnelson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/2] ARM: dts: add initial Rex Basic board support
Date: Tue,  8 Jul 2014 09:49:23 -0500
Message-ID: <1404830963-18274-2-git-send-email-robertcnelson@gmail.com>
References: <1404830963-18274-1-git-send-email-robertcnelson@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404830963-18274-1-git-send-email-robertcnelson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Robert Nelson <robertcnelson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add initial Rex Pro i.mx6dl board support. Ethernet, UART, USB, I2C, SPI, HDMI,
Audio, and SDHC cards are working.  Currently no mainline u-boot, so boot with
cat zImage imx6dl-rex-basic.dtb > zImage.dtb, then using mkimage create uImage

Signed-off-by: Robert Nelson <robertcnelson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/Makefile             |  1 +
 arch/arm/boot/dts/imx6dl-rex-basic.dts | 30 ++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6dl-rex-basic.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index fb79bf5..cee0067 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -199,6 +199,7 @@ dtb-$(CONFIG_ARCH_MXC) += \
 	imx6dl-hummingboard.dtb \
 	imx6dl-nitrogen6x.dtb \
 	imx6dl-phytec-pbab01.dtb \
+	imx6dl-rex-basic.dtb \
 	imx6dl-riotboard.dtb \
 	imx6dl-sabreauto.dtb \
 	imx6dl-sabrelite.dtb \
diff --git a/arch/arm/boot/dts/imx6dl-rex-basic.dts b/arch/arm/boot/dts/imx6dl-rex-basic.dts
new file mode 100644
index 0000000..b13845c
--- /dev/null
+++ b/arch/arm/boot/dts/imx6dl-rex-basic.dts
@@ -0,0 +1,30 @@
+/*
+ * Copyright 2014 FEDEVEL, Inc.
+ *
+ * Author: Robert Nelson <robertcnelson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ */
+/dts-v1/;
+#include "imx6dl.dtsi"
+#include "imx6qdl-rex.dtsi"
+
+/ {
+	model = "Rex Basic i.MX6 Dual Lite Board";
+	compatible = "rex,imx6dl-rex-basic", "fsl,imx6dl";
+
+	memory {
+		reg = <0x10000000 0x20000000>;
+	};
+};
+
+&ecspi3 {
+	flash: m25p80@0 {
+		compatible = "sst,sst25vf016b";
+		spi-max-frequency = <20000000>;
+		reg = <0>;
+	};
+};
-- 
2.0.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
