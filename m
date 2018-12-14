From: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH 1/2] arm64: dts: imx8mq: move watchdog nodes to correct
 location
Date: Fri, 14 Dec 2018 11:55:09 +0100
Message-ID: <20181214105510.1174-1-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, patchwork-lst@pengutronix.de, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The were added at the end of the AIPS1 address space, while they
are in fact in the middle.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 48 +++++++++++------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index 8e9d6d5ed7b2..a55b9329376b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -199,6 +199,30 @@
 				#interrupt-cells = <2>;
 			};
 
+			wdog1: watchdog@30280000 {
+				compatible = "fsl,imx8mq-wdt", "fsl,imx21-wdt";
+				reg = <0x30280000 0x10000>;
+				interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk IMX8MQ_CLK_WDOG1_ROOT>;
+				status = "disabled";
+			};
+
+			wdog2: watchdog@30290000 {
+				compatible = "fsl,imx8mq-wdt", "fsl,imx21-wdt";
+				reg = <0x30290000 0x10000>;
+				interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk IMX8MQ_CLK_WDOG2_ROOT>;
+				status = "disabled";
+			};
+
+			wdog3: watchdog@302a0000 {
+				compatible = "fsl,imx8mq-wdt", "fsl,imx21-wdt";
+				reg = <0x302a0000 0x10000>;
+				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk IMX8MQ_CLK_WDOG3_ROOT>;
+				status = "disabled";
+			};
+
 			iomuxc: iomuxc@30330000 {
 				compatible = "fsl,imx8mq-iomuxc";
 				reg = <0x30330000 0x10000>;
@@ -228,30 +252,6 @@
 				              "clk_ext1", "clk_ext2",
 				              "clk_ext3", "clk_ext4";
 			};
-
-			wdog1: watchdog@30280000 {
-				compatible = "fsl,imx8mq-wdt", "fsl,imx21-wdt";
-				reg = <0x30280000 0x10000>;
-				interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX8MQ_CLK_WDOG1_ROOT>;
-				status = "disabled";
-			};
-
-			wdog2: watchdog@30290000 {
-				compatible = "fsl,imx8mq-wdt", "fsl,imx21-wdt";
-				reg = <0x30290000 0x10000>;
-				interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX8MQ_CLK_WDOG2_ROOT>;
-				status = "disabled";
-			};
-
-			wdog3: watchdog@302a0000 {
-				compatible = "fsl,imx8mq-wdt", "fsl,imx21-wdt";
-				reg = <0x302a0000 0x10000>;
-				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&clk IMX8MQ_CLK_WDOG3_ROOT>;
-				status = "disabled";
-			};
 		};
 
 		bus@30400000 { /* AIPS2 */
-- 
2.19.1
