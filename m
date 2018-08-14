From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v2 1/2] ARM: dts: imx6qdl: Add Engicam i.Core 1.5 MX6
Date: Tue, 14 Aug 2018 15:21:45 +0200
Message-ID: <1534252906-29554-2-git-send-email-jacopo+renesas@jmondi.org>
References: <1534252906-29554-1-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1534252906-29554-1-git-send-email-jacopo+renesas@jmondi.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, fabio.estevam@nxp.com, linux-imx@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, jagan@amarulasolutions.com
Cc: devicetree@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Jacopo Mondi <jacopo@jmondi.org>

The 1.5 version of Engicam's i.Core MX6 CPU module features a different clock
provider for the ethernet's PHY interface. Adjust the FEC ptp clock to
reference CLK_ENET_REF clock source, and set SION bit of
MX6QDL_PAD_GPIO_16__ENET_REF_CLK to adjust the input path of that pin.

The newly introduced imx6ql-icore-1.5.dtsi allows to collect in a single
place differences between version '1.0' and '1.5' of the module.

Reviewed-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 arch/arm/boot/dts/imx6qdl-icore-1.5.dtsi | 34 ++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 arch/arm/boot/dts/imx6qdl-icore-1.5.dtsi

diff --git a/arch/arm/boot/dts/imx6qdl-icore-1.5.dtsi b/arch/arm/boot/dts/imx6qdl-icore-1.5.dtsi
new file mode 100644
index 0000000..d91d46b
--- /dev/null
+++ b/arch/arm/boot/dts/imx6qdl-icore-1.5.dtsi
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2018 Jacopo Mondi <jacopo@jmondi.org>
+ */
+
+#include "imx6qdl-icore.dtsi"
+
+&iomuxc {
+	pinctrl_enet: enetgrp {
+		fsl,pins = <
+			MX6QDL_PAD_ENET_CRS_DV__ENET_RX_EN	0x1b0b0
+			MX6QDL_PAD_GPIO_16__ENET_REF_CLK	0x4001b0b0
+			MX6QDL_PAD_ENET_TX_EN__ENET_TX_EN	0x1b0b0
+			MX6QDL_PAD_ENET_RXD1__ENET_RX_DATA1	0x1b0b0
+			MX6QDL_PAD_ENET_RXD0__ENET_RX_DATA0	0x1b0b0
+			MX6QDL_PAD_ENET_TXD1__ENET_TX_DATA1	0x1b0b0
+			MX6QDL_PAD_ENET_TXD0__ENET_TX_DATA0	0x1b0b0
+			MX6QDL_PAD_ENET_MDC__ENET_MDC		0x1b0b0
+			MX6QDL_PAD_ENET_MDIO__ENET_MDIO		0x1b0b0
+			MX6QDL_PAD_GPIO_17__GPIO7_IO12		0x1b0b0
+		>;
+	};
+};
+
+&fec {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_enet>;
+	phy-reset-gpios = <&gpio7 12 GPIO_ACTIVE_LOW>;
+	clocks = <&clks IMX6QDL_CLK_ENET>,
+		 <&clks IMX6QDL_CLK_ENET>,
+		 <&clks IMX6QDL_CLK_ENET_REF>;
+	phy-mode = "rmii";
+	status = "okay";
+};
-- 
2.7.4
