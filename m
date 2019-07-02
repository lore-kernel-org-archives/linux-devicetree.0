From: Andra Danciu <andradanciu1997@gmail.com>
Subject: [PATCH] arm64: dts: imx8mq: Add sai6 node
Date: Tue,  2 Jul 2019 14:41:02 +0300
Message-ID: <20190702114102.1254-1-andradanciu1997@gmail.com>
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
To: shawnguo@kernel.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, abel.vesa@nxp.com, Anson.Huang@nxp.com, ccaione@baylibre.com, andrew.smirnov@gmail.com, s.hauer@pengutronix.de, angus@akkea.ca, linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, festevam@gmail.com, agx@sigxcpu.org, linux-arm-kernel@lists.infradead.org, l.stach@pengutronix.de
List-Id: devicetree@vger.kernel.org

Cc: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Andra Danciu <andradanciu1997@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index d09b808eff87..1ff664523f56 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -278,6 +278,20 @@
 			#size-cells = <1>;
 			ranges = <0x30000000 0x30000000 0x400000>;
 
+			sai6: sai@30030000 {
+				compatible = "fsl,imx8mq-sai",
+					"fsl,imx6sx-sai";
+				reg = <0x30030000 0x10000>;
+				interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk IMX8MQ_CLK_SAI6_IPG>,
+					<&clk IMX8MQ_CLK_SAI6_ROOT>,
+					<&clk IMX8MQ_CLK_DUMMY>, <&clk IMX8MQ_CLK_DUMMY>;
+				clock-names = "bus", "mclk1", "mclk2", "mclk3";
+				dmas = <&sdma2 4 24 0>, <&sdma2 5 24 0>;
+				dma-names = "rx", "tx";
+				status = "disabled";
+			};
+
 			gpio1: gpio@30200000 {
 				compatible = "fsl,imx8mq-gpio", "fsl,imx35-gpio";
 				reg = <0x30200000 0x10000>;
-- 
2.11.0
