From: Aisheng Dong <aisheng.dong@nxp.com>
Subject: [PATCH 1/4] dt-bindings: firmware: imx-scu: new binding to parse
 clocks from device tree
Date: Thu, 21 Feb 2019 18:03:43 +0000
Message-ID: <1550771836-10014-2-git-send-email-aisheng.dong@nxp.com>
References: <1550771836-10014-1-git-send-email-aisheng.dong@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1550771836-10014-1-git-send-email-aisheng.dong@nxp.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, Rob Herring <robh@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "sboyd@kernel.org" <sboyd@kernel.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

There's a few limitations on one cell clock binding (#clock-cells = <1>)
that we have to define all clock IDs for device tree to reference.
This may cause troubles if we want to use common clock IDs for multi
platforms support when the clock of those platforms are mostly the same.
e.g. Current clock IDs name are defined with SS prefix. However the device
may reside in different SS across CPUs, that means the SS prefix may
not valid anymore for a new SoC. Furthermore, the device availability of
those clocks may also vary a bit.

For such situation, We formerly planned to add all new IDs for each SS
and dynamically check availability for different SoC in driver. That can
be done but that may involve a lot effort and may result in more changes
and duplicated code in driver, also make device tree upstreaming hard which
depends on Clock IDs.

To relief this situation, we want to move the clock definition into
device tree which can fully decouple the dependency of Clock ID definition
from device tree. And no frequent changes required in clock driver any more.

Then we can use the existence of clock nodes in device tree to address the
device and clock availability differences across different SoCs.

For SCU clocks, only two params required, thus two new property created:
rsrc-id = <IMX_SC_R_UART_0>;
clk-type = <IMX_SC_PM_CLK_PER>;

And as we want to support clock set parent function, 'clocks' property
is also used to pass all the possible input parents.

Cc: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <kernel@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: devicetree@vger.kernel.org
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 .../devicetree/bindings/arm/freescale/fsl,scu.txt  | 29 ++++++++++++++++------
 include/dt-bindings/firmware/imx/rsrc.h            | 17 +++++++++++++
 2 files changed, 38 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
index 72d481c..2816789 100644
--- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
+++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
@@ -78,6 +78,19 @@ Required properties:
 			  "fsl,imx8qm-clock"
 			  "fsl,imx8qxp-clock"
 			followed by "fsl,scu-clk"
+- #clock-cells:		Should be 0.
+- rsrc-id:		Resource ID associated with this clock
+- clk-type:		Type of this clock.
+			Refer to <include/dt-bindings/firmware/imx/rsrc.h> for
+			available clock types supported by SCU.
+- clock-output-names:	Shall be the corresponding names of the outputs.
+
+Optional properties:
+- clocks:		Shall be the input parent clock(s) phandle for the clock.
+			For multiplexed clocks, the list order must match the hardware
+			programming order.
+
+Legacy Clock binding (DEPRECATED):
 - #clock-cells:		Should be 1. Contains the Clock ID value.
 - clocks:		List of clock specifiers, must contain an entry for
 			each required entry in clock-names
@@ -129,6 +142,13 @@ lsio_mu1: mailbox@5d1c0000 {
 	#mbox-cells = <2>;
 };
 
+uart0_clk: uart0-clock-controller {
+	compatible = "fsl,imx8qxp-scu-pd", "fsl,scu-clk";
+	#clock-cells = <0>;
+	rsrc-id = <IMX_SC_R_UART_0>;
+	clk-type = <IMX_SC_PM_CLK_PER>;
+};
+
 firmware {
 	scu {
 		compatible = "fsl,imx-scu";
@@ -143,11 +163,6 @@ firmware {
 			  &lsio_mu1 1 2
 			  &lsio_mu1 1 3>;
 
-		clk: clk {
-			compatible = "fsl,imx8qxp-clk", "fsl,scu-clk";
-			#clock-cells = <1>;
-		};
-
 		iomuxc {
 			compatible = "fsl,imx8qxp-iomuxc";
 
@@ -175,8 +190,6 @@ serial@5a060000 {
 	...
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_lpuart0>;
-	clocks = <&clk IMX8QXP_UART0_CLK>,
-		 <&clk IMX8QXP_UART0_IPG_CLK>;
-	clock-names = "per", "ipg";
+	clocks = <&uart0_clk>;
 	power-domains = <&pd IMX_SC_R_UART_0>;
 };
diff --git a/include/dt-bindings/firmware/imx/rsrc.h b/include/dt-bindings/firmware/imx/rsrc.h
index 4481f2d..f650fc3 100644
--- a/include/dt-bindings/firmware/imx/rsrc.h
+++ b/include/dt-bindings/firmware/imx/rsrc.h
@@ -556,4 +556,21 @@
 #define IMX_SC_R_VPU			540
 #define IMX_SC_R_LAST			541
 
+/*
+ * Defines for SC PM CLK
+ */
+#define IMX_SC_PM_CLK_SLV_BUS		0	/* Slave bus clock */
+#define IMX_SC_PM_CLK_MST_BUS		1	/* Master bus clock */
+#define IMX_SC_PM_CLK_PER		2	/* Peripheral clock */
+#define IMX_SC_PM_CLK_PHY		3	/* Phy clock */
+#define IMX_SC_PM_CLK_MISC		4	/* Misc clock */
+#define IMX_SC_PM_CLK_MISC0		0	/* Misc 0 clock */
+#define IMX_SC_PM_CLK_MISC1		1	/* Misc 1 clock */
+#define IMX_SC_PM_CLK_MISC2		2	/* Misc 2 clock */
+#define IMX_SC_PM_CLK_MISC3		3	/* Misc 3 clock */
+#define IMX_SC_PM_CLK_MISC4		4	/* Misc 4 clock */
+#define IMX_SC_PM_CLK_CPU		2	/* CPU clock */
+#define IMX_SC_PM_CLK_PLL		4	/* PLL */
+#define IMX_SC_PM_CLK_BYPASS		4	/* Bypass clock */
+
 #endif /* __DT_BINDINGS_RSCRC_IMX_H */
-- 
2.7.4
