From: Carlo Caione <ccaione@baylibre.com>
Subject: [PATCH v3 1/3] arm64: dts: imx8mq: Add QuadSPI controller
Date: Wed, 30 Jan 2019 12:05:09 +0000
Message-ID: <20190130120511.11555-2-ccaione@baylibre.com>
References: <20190130120511.11555-1-ccaione@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190130120511.11555-1-ccaione@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, l.stach@pengutronix.de, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Carlo Caione <ccaione@baylibre.com>
List-Id: devicetree@vger.kernel.org

Add a node for the Freescale/NXP QuadSPI controller and extend the AIPS3
memory range to accommodate the QuadSPI-memory region.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index dbedc4a5e7fb..2be302cb2f1f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -379,7 +379,8 @@
 			compatible = "fsl,imx8mq-aips-bus", "simple-bus";
 			#address-cells = <1>;
 			#size-cells = <1>;
-			ranges = <0x30800000 0x30800000 0x400000>;
+			ranges = <0x30800000 0x30800000 0x400000>,
+				 <0x08000000 0x08000000 0x10000000>;
 
 			uart1: serial@30860000 {
 				compatible = "fsl,imx8mq-uart",
@@ -497,6 +498,20 @@
 				status = "disabled";
 			};
 
+			qspi0: spi@30bb0000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "fsl,imx8mq-qspi", "fsl,imx7d-qspi";
+				reg = <0x30bb0000 0x10000>,
+				      <0x08000000 0x10000000>;
+				reg-names = "QuadSPI", "QuadSPI-memory";
+				interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&clk IMX8MQ_CLK_QSPI_ROOT>,
+					 <&clk IMX8MQ_CLK_QSPI_ROOT>;
+				clock-names = "qspi_en", "qspi";
+				status = "disabled";
+			};
+
 			fec1: ethernet@30be0000 {
 				compatible = "fsl,imx8mq-fec", "fsl,imx6sx-fec";
 				reg = <0x30be0000 0x10000>;
-- 
2.19.1
