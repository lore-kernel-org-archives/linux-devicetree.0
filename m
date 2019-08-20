From: Dong Aisheng <aisheng.dong@nxp.com>
Subject: [PATCH V4 02/11] dt-bindings: clock: imx-lpcg: add support to parse
 clocks from device tree
Date: Tue, 20 Aug 2019 07:13:16 -0400
Message-ID: <1566299605-15641-3-git-send-email-aisheng.dong@nxp.com>
References: <1566299605-15641-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1566299605-15641-1-git-send-email-aisheng.dong@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-clk@vger.kernel.org
Cc: Dong Aisheng <aisheng.dong@nxp.com>, devicetree@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com, Rob Herring <robh+dt@kernel.org>, linux-imx@nxp.com, kernel@pengutronix.de, fabio.estevam@nxp.com, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

MX8QM and MX8QXP LPCG Clocks are mostly the same except they may reside
in different subsystems across CPUs and also vary a bit on the availability.

Same as SCU clock, we want to move the clock definition into device tree
which can fully decouple the dependency of Clock ID definition from device
tree and make us be able to write a fully generic lpcg clock driver.

And we can also use the existence of clock nodes in device tree to address
the device and clock availability differences across different SoCs.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: devicetree@vger.kernel.org
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
ChangeLog:
v3->v4:
 * change bit-offset property to clock-indices
 * use constant macro to define clock indinces
 * drop hw-autogate property which is still not used by drivers
v2->v3:
 * no changes
v1->v2:
 * Update example
 * Add power domain property
---
 .../devicetree/bindings/clock/imx8qxp-lpcg.txt     | 36 ++++++++++++++++++----
 include/dt-bindings/clock/imx8-lpcg.h              | 14 +++++++++
 2 files changed, 44 insertions(+), 6 deletions(-)
 create mode 100644 include/dt-bindings/clock/imx8-lpcg.h

diff --git a/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt b/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt
index 965cfa4..cad8fc4 100644
--- a/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt
+++ b/Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt
@@ -11,6 +11,21 @@ enabled by these control bits, it might still not be running based
 on the base resource.
 
 Required properties:
+- compatible:		Should be one of:
+			  "fsl,imx8qxp-lpcg"
+			  "fsl,imx8qm-lpcg" followed by "fsl,imx8qxp-lpcg".
+- reg:			Address and length of the register set.
+- #clock-cells:		Should be 1. One LPCG supports multiple clocks.
+- clocks:		Input parent clocks phandle array for each clock.
+- clock-indices:	An integer array indicating the bit offset for each clock.
+			Refer to <include/dt-bindings/clock/imx8-lpcg.h> for the
+			supported LPCG clock indices.
+- clock-output-names:	Shall be the corresponding names of the outputs.
+			NOTE this property must be specified in the same order
+			as the clock-indices property.
+- power-domains:	Should contain the power domain used by this clock.
+
+Legacy binding (DEPRECATED):
 - compatible:	Should be one of:
 		  "fsl,imx8qxp-lpcg-adma",
 		  "fsl,imx8qxp-lpcg-conn",
@@ -33,10 +48,19 @@ Examples:
 
 #include <dt-bindings/clock/imx8qxp-clock.h>
 
-conn_lpcg: clock-controller@5b200000 {
-	compatible = "fsl,imx8qxp-lpcg-conn";
-	reg = <0x5b200000 0xb0000>;
+sdhc0_lpcg: clock-controller@5b200000 {
+	compatible = "fsl,imx8qxp-lpcg";
+	reg = <0x5b200000 0x10000>;
 	#clock-cells = <1>;
+	clocks = <&sdhc0_clk IMX_SC_PM_CLK_PER>,
+		 <&conn_ipg_clk>, <&conn_axi_clk>;
+	clock-indices = <IMX_LPCG_CLK_0>,
+			<IMX_LPCG_CLK_4>,
+			<IMX_LPCG_CLK_5>;
+	clock-output-names = "sdhc0_lpcg_per_clk",
+			     "sdhc0_lpcg_ipg_clk",
+			     "sdhc0_lpcg_ahb_clk";
+	power-domains = <&pd IMX_SC_R_SDHC_0>;
 };
 
 usdhc1: mmc@5b010000 {
@@ -44,8 +68,8 @@ usdhc1: mmc@5b010000 {
 	interrupt-parent = <&gic>;
 	interrupts = <GIC_SPI 232 IRQ_TYPE_LEVEL_HIGH>;
 	reg = <0x5b010000 0x10000>;
-	clocks = <&conn_lpcg IMX8QXP_CONN_LPCG_SDHC0_IPG_CLK>,
-		 <&conn_lpcg IMX8QXP_CONN_LPCG_SDHC0_PER_CLK>,
-		 <&conn_lpcg IMX8QXP_CONN_LPCG_SDHC0_HCLK>;
+	clocks = <&sdhc0_lpcg IMX_LPCG_CLK_4>,
+		 <&sdhc0_lpcg IMX_LPCG_CLK_0>,
+		 <&sdhc0_lpcg IMX_LPCG_CLK_5>;
 	clock-names = "ipg", "per", "ahb";
 };
diff --git a/include/dt-bindings/clock/imx8-lpcg.h b/include/dt-bindings/clock/imx8-lpcg.h
new file mode 100644
index 0000000..df90aad
--- /dev/null
+++ b/include/dt-bindings/clock/imx8-lpcg.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright 2019 NXP
+ *   Dong Aisheng <aisheng.dong@nxp.com>
+ */
+
+#define IMX_LPCG_CLK_0	0
+#define IMX_LPCG_CLK_1	4
+#define IMX_LPCG_CLK_2	8
+#define IMX_LPCG_CLK_3	12
+#define IMX_LPCG_CLK_4	16
+#define IMX_LPCG_CLK_5	20
+#define IMX_LPCG_CLK_6	24
+#define IMX_LPCG_CLK_7	28
-- 
2.7.4
