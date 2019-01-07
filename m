From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH 1/2] ARM: dts: imx6ul: add DMA properties for ECSPI
Date: Mon,  7 Jan 2019 14:22:25 +0100
Message-ID: <20190107132226.16216-1-stefan@agner.ch>
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
To: shawnguo@kernel.org, s.hauer@pengutronix.de
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>, robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de, fabio.estevam@nxp.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Allow to use DMA for SPI by adding the appropriate DMA properites
to the ecspi nodes.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/boot/dts/imx6ul.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
index 6dc0b569acdf..b0193abf7005 100644
--- a/arch/arm/boot/dts/imx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul.dtsi
@@ -227,6 +227,8 @@
 					clocks = <&clks IMX6UL_CLK_ECSPI1>,
 						 <&clks IMX6UL_CLK_ECSPI1>;
 					clock-names = "ipg", "per";
+					dmas = <&sdma 3 7 1>, <&sdma 4 7 2>;
+					dma-names = "rx", "tx";
 					status = "disabled";
 				};
 
@@ -239,6 +241,8 @@
 					clocks = <&clks IMX6UL_CLK_ECSPI2>,
 						 <&clks IMX6UL_CLK_ECSPI2>;
 					clock-names = "ipg", "per";
+					dmas = <&sdma 5 7 1>, <&sdma 6 7 2>;
+					dma-names = "rx", "tx";
 					status = "disabled";
 				};
 
@@ -251,6 +255,8 @@
 					clocks = <&clks IMX6UL_CLK_ECSPI3>,
 						 <&clks IMX6UL_CLK_ECSPI3>;
 					clock-names = "ipg", "per";
+					dmas = <&sdma 7 7 1>, <&sdma 8 7 2>;
+					dma-names = "rx", "tx";
 					status = "disabled";
 				};
 
@@ -263,6 +269,8 @@
 					clocks = <&clks IMX6UL_CLK_ECSPI4>,
 						 <&clks IMX6UL_CLK_ECSPI4>;
 					clock-names = "ipg", "per";
+					dmas = <&sdma 9 7 1>, <&sdma 10 7 2>;
+					dma-names = "rx", "tx";
 					status = "disabled";
 				};
 
-- 
2.20.1
