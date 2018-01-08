From: Stefan Riedmueller <s.riedmueller-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v4 3/6] ARM: dts: imx6: Add support for phyBOARD-Mira i.MX 6Quad/Dual RDK
Date: Mon, 8 Jan 2018 15:29:15 +0100
Message-ID: <1515421758-4240-4-git-send-email-s.riedmueller@phytec.de>
References: <1515421758-4240-1-git-send-email-s.riedmueller@phytec.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1515421758-4240-1-git-send-email-s.riedmueller-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Christian Hemp <c.hemp-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>, Stefan Christ <s.christ-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>, Stefan Riedmueller <s.riedmueller-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Christian Hemp <c.hemp-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>

Add support for the PHYTEC phyBOARD-Mira Rapid Development Kit with
i.MX 6Quad/Dual with eMMC or NAND.

Following interfaces are supported:
- Gigabit Ethernet
- USB Host
- CAN
- RS232
- PCIe
- LVDS
- HDMI

Signed-off-by: Christian Hemp <c.hemp-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Signed-off-by: Stefan Christ <s.christ-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Signed-off-by: Stefan Riedmueller <s.riedmueller-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Reviewed-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
---
 arch/arm/boot/dts/Makefile                       |  2 +
 arch/arm/boot/dts/imx6q-phytec-mira-rdk-emmc.dts | 72 ++++++++++++++++++++++++
 arch/arm/boot/dts/imx6q-phytec-mira-rdk-nand.dts | 72 ++++++++++++++++++++++++
 3 files changed, 146 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6q-phytec-mira-rdk-emmc.dts
 create mode 100644 arch/arm/boot/dts/imx6q-phytec-mira-rdk-nand.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index d0381e9..b793617 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -449,6 +449,8 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-nitrogen6_max.dtb \
 	imx6q-nitrogen6_som2.dtb \
 	imx6q-novena.dtb \
+	imx6q-phytec-mira-rdk-emmc.dtb \
+	imx6q-phytec-mira-rdk-nand.dtb \
 	imx6q-phytec-pbab01.dtb \
 	imx6q-pistachio.dtb \
 	imx6q-rex-pro.dtb \
diff --git a/arch/arm/boot/dts/imx6q-phytec-mira-rdk-emmc.dts b/arch/arm/boot/dts/imx6q-phytec-mira-rdk-emmc.dts
new file mode 100644
index 0000000..8132d73
--- /dev/null
+++ b/arch/arm/boot/dts/imx6q-phytec-mira-rdk-emmc.dts
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2018 PHYTEC Messtechnik GmbH
+ * Author: Christian Hemp <c.hemp-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
+ */
+
+/dts-v1/;
+#include "imx6q.dtsi"
+#include "imx6qdl-phytec-phycore-som.dtsi"
+#include "imx6qdl-phytec-mira.dtsi"
+
+/ {
+	model = "PHYTEC phyBOARD-Mira Quad Carrier-Board with eMMC";
+	compatible = "phytec,imx6q-pbac06-emmc", "phytec,imx6q-pbac06",
+		     "phytec,imx6qdl-pcm058", "fsl,imx6q";
+
+	chosen {
+		linux,stdout-path = &uart2;
+	};
+};
+
+&can1 {
+	status = "okay";
+};
+
+&fec {
+	status = "okay";
+};
+
+&m25p80 {
+	status = "okay";
+};
+
+&hdmi {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+};
+
+&i2c2 {
+	status = "okay";
+};
+
+&i2c_rtc {
+	status = "okay";
+};
+
+&pcie {
+	status = "okay";
+};
+
+&uart3 {
+	status = "okay";
+};
+
+&usbh1 {
+	status = "okay";
+};
+
+&usbotg {
+	status = "okay";
+};
+
+&usdhc1 {
+	status = "okay";
+};
+
+&usdhc4 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/imx6q-phytec-mira-rdk-nand.dts b/arch/arm/boot/dts/imx6q-phytec-mira-rdk-nand.dts
new file mode 100644
index 0000000..974b269
--- /dev/null
+++ b/arch/arm/boot/dts/imx6q-phytec-mira-rdk-nand.dts
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2018 PHYTEC Messtechnik GmbH
+ * Author: Christian Hemp <c.hemp-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
+ */
+
+/dts-v1/;
+#include "imx6q.dtsi"
+#include "imx6qdl-phytec-phycore-som.dtsi"
+#include "imx6qdl-phytec-mira.dtsi"
+
+/ {
+	model = "PHYTEC phyBOARD-Mira Quad Carrier-Board with NAND";
+	compatible = "phytec,imx6q-pbac06-nand", "phytec,imx6q-pbac06",
+		     "phytec,imx6qdl-pcm058", "fsl,imx6q";
+
+	chosen {
+		linux,stdout-path = &uart2;
+	};
+};
+
+&can1 {
+	status = "okay";
+};
+
+&fec {
+	status = "okay";
+};
+
+&m25p80 {
+	status = "okay";
+};
+
+&gpmi {
+	status = "okay";
+};
+
+&hdmi {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+};
+
+&i2c2 {
+	status = "okay";
+};
+
+&i2c_rtc {
+	status = "okay";
+};
+
+&pcie {
+	status = "okay";
+};
+
+&uart3 {
+	status = "okay";
+};
+
+&usbh1 {
+	status = "okay";
+};
+
+&usbotg {
+	status = "okay";
+};
+
+&usdhc1 {
+	status = "okay";
+};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
