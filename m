From: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH] arm64: dts: imx8mq: add GPU node
Date: Thu,  4 Apr 2019 18:52:11 +0200
Message-ID: <20190404165211.29297-1-l.stach@pengutronix.de>
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
Cc: devicetree@vger.kernel.org, patchwork-lst@pengutronix.de, NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This enables the Vivante GC7000L GPU on the i.MX8MQ SoC.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index 4300781558f6..79d418b4f585 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -792,6 +792,28 @@
 			};
 		};
 
+		gpu: gpu@38000000 {
+			compatible = "vivante,gc";
+			reg = <0x38000000 0x40000>;
+			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk IMX8MQ_CLK_GPU_ROOT>,
+			         <&clk IMX8MQ_CLK_GPU_SHADER_DIV>,
+			         <&clk IMX8MQ_CLK_GPU_AXI>,
+			         <&clk IMX8MQ_CLK_GPU_AHB>;
+			clock-names = "core", "shader", "bus", "reg";
+			assigned-clocks = <&clk IMX8MQ_CLK_GPU_CORE_SRC>,
+			                  <&clk IMX8MQ_CLK_GPU_SHADER_SRC>,
+			                  <&clk IMX8MQ_CLK_GPU_AXI>,
+			                  <&clk IMX8MQ_CLK_GPU_AHB>;
+			assigned-clock-parents = <&clk IMX8MQ_GPU_PLL_OUT>,
+			                         <&clk IMX8MQ_GPU_PLL_OUT>,
+			                         <&clk IMX8MQ_GPU_PLL_OUT>,
+			                         <&clk IMX8MQ_GPU_PLL_OUT>;
+			assigned-clock-rates = <800000000>, <800000000>,
+			                       <800000000>, <800000000>;
+			power-domains = <&pgc_gpu>;
+		};
+
 		usb_dwc3_0: usb@38100000 {
 			compatible = "fsl,imx8mq-dwc3", "snps,dwc3";
 			reg = <0x38100000 0x10000>;
-- 
2.20.1
