From: Abel Vesa <abel.vesa@nxp.com>
Subject: [PATCH] arm64: dts: imx8mq: Default parents for PCIE1 clocks
Date: Thu,  4 Jul 2019 13:24:24 +0300
Message-ID: <1562235864-12953-1-git-send-email-abel.vesa@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Leonard Crestez <leonard.crestez@nxp.com>, Andrey Smirnov <andrew.smirnov@gmail.com>, Sascha Hauer <kernel@pengutronix.de>
Cc: NXP Linux Team <linux-imx@nxp.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Abel Vesa <abel.vesa@nxp.com>
List-Id: devicetree@vger.kernel.org

Set default parents for PCIE1_CTRL and PCIE1_PHY clocks.

Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
index e3df9b8..23bf85f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
@@ -235,6 +235,10 @@
 		 <&clk IMX8MQ_CLK_PCIE1_PHY>,
 		 <&pcie0_refclk>;
 	clock-names = "pcie", "pcie_aux", "pcie_phy", "pcie_bus";
+	assigned-clocks = <&clk IMX8MQ_CLK_PCIE1_CTRL>,
+			  <&clk IMX8MQ_CLK_PCIE1_PHY>;
+	assigned-clock-parents = <&clk IMX8MQ_SYS2_PLL_250M>,
+				 <&clk IMX8MQ_SYS2_PLL_100M>;
 	status = "okay";
 };
 
-- 
2.7.4
