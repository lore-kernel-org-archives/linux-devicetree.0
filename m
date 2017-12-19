From: Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH 5/6] ARM: dts: imx6: Add support for phyBOARD-Mira with i.MX
 6QuadPlus
Date: Tue, 19 Dec 2017 16:49:47 +0100
Message-ID: <1513698588-13325-6-git-send-email-s.riedmueller@phytec.de>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Stefan Riedmueller <s.riedmueller@phytec.de>, Enrico Scholz <enrico.scholz@sigma-chemnitz.de>, Stefan Lengfeld <s.lengfeld@phytec.de>, robh+dt@kernel.org, Christian Hemp <c.hemp@phytec.de>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

Add support for the PHYTEC phyBOARD-Mira with i.MX 6QuadPlus with NAND.
It is based on the phyBOARD-Mira with i.MX 6Quad/Dual and supports the
same interfaces.

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Signed-off-by: Stefan Lengfeld <s.lengfeld@phytec.de>
Signed-off-by: Christian Hemp <c.hemp@phytec.de>
Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
---
 arch/arm/boot/dts/Makefile                        |  1 +
 arch/arm/boot/dts/imx6qp-phytec-mira-rdk-nand.dts | 76 +++++++++++++++++++++++
 2 files changed, 77 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6qp-phytec-mira-rdk-nand.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 07d99a1..d42b522 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -479,6 +479,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-zii-rdu2.dtb \
 	imx6qp-nitrogen6_max.dtb \
 	imx6qp-nitrogen6_som2.dtb \
+	imx6qp-phytec-mira-rdk-nand.dtb \
 	imx6qp-sabreauto.dtb \
 	imx6qp-sabresd.dtb \
 	imx6qp-tx6qp-8037.dtb \
diff --git a/arch/arm/boot/dts/imx6qp-phytec-mira-rdk-nand.dts b/arch/arm/boot/dts/imx6qp-phytec-mira-rdk-nand.dts
new file mode 100644
index 0000000..397871c
--- /dev/null
+++ b/arch/arm/boot/dts/imx6qp-phytec-mira-rdk-nand.dts
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2017 PHYTEC Messtechnik GmbH
+ * Author: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
+ */
+
+/dts-v1/;
+#include "imx6qp.dtsi"
+#include "imx6qdl-phytec-phycore-som.dtsi"
+#include "imx6qdl-phytec-mira.dtsi"
+
+/ {
+	model = "PHYTEC phyBOARD-Mira QuadPlus Carrier-Board with NAND";
+	compatible = "phytec,imx6qp-pbac06-nand", "phytec,imx6qp-pbac06",
+		     "phytec,imx6qdl-pcm058", "fsl,imx6qp";
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
