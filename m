From: Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH 3/6] ARM: dts: imx6: Add support for phyBOARD-Mira i.MX
 6Quad/Dual RDK
Date: Tue, 19 Dec 2017 16:49:45 +0100
Message-ID: <1513698588-13325-4-git-send-email-s.riedmueller@phytec.de>
References: <1513698588-13325-1-git-send-email-s.riedmueller@phytec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1513698588-13325-1-git-send-email-s.riedmueller@phytec.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org, kernel@pengutronix.de, fabio.estevam@nxp.com
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Stefan Riedmueller <s.riedmueller@phytec.de>, robh+dt@kernel.org, Christian Hemp <c.hemp@phytec.de>, Stefan Christ <s.christ@phytec.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Christian Hemp <c.hemp@phytec.de>

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

Signed-off-by: Christian Hemp <c.hemp@phytec.de>
Signed-off-by: Stefan Christ <s.christ@phytec.de>
Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
---
 arch/arm/boot/dts/Makefile                       |  2 +
 arch/arm/boot/dts/imx6q-phytec-mira-rdk-emmc.dts | 76 ++++++++++++++++++++++++
 arch/arm/boot/dts/imx6q-phytec-mira-rdk-nand.dts | 76 ++++++++++++++++++++++++
 3 files changed, 154 insertions(+)
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
index 0000000..6e6f694
--- /dev/null
+++ b/arch/arm/boot/dts/imx6q-phytec-mira-rdk-emmc.dts
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2017 PHYTEC Messtechnik GmbH
+ * Author: Christian Hemp <c.hemp@phytec.de>
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
+	aliases {
+		ipu1 = &ipu2;
+	};
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
+&flash {
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
index 0000000..6145e8e
--- /dev/null
+++ b/arch/arm/boot/dts/imx6q-phytec-mira-rdk-nand.dts
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2017 PHYTEC Messtechnik GmbH
+ * Author: Christian Hemp <c.hemp@phytec.de>
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
+	aliases {
+		ipu1 = &ipu2;
+	};
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
+&flash {
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
