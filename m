From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH 2/2] ARM: dts: imx7: add DMA properties for ECSPI
Date: Mon,  7 Jan 2019 14:22:26 +0100
Message-ID: <20190107132226.16216-2-stefan@agner.ch>
References: <20190107132226.16216-1-stefan@agner.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190107132226.16216-1-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, s.hauer@pengutronix.de
Cc: kernel@pengutronix.de, fabio.estevam@nxp.com, linux-imx@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: devicetree@vger.kernel.org

Allow to use DMA for SPI by adding the appropriate DMA properites
to the ecspi nodes.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/boot/dts/imx7s.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
index a052198f6e96..b9330176c3af 100644
--- a/arch/arm/boot/dts/imx7s.dtsi
+++ b/arch/arm/boot/dts/imx7s.dtsi
@@ -653,6 +653,8 @@
 				clocks = <&clks IMX7D_ECSPI4_ROOT_CLK>,
 					<&clks IMX7D_ECSPI4_ROOT_CLK>;
 				clock-names = "ipg", "per";
+				dmas = <&sdma 6 7 1>, <&sdma 7 7 2>;
+				dma-names = "rx", "tx";
 				status = "disabled";
 			};
 
@@ -734,6 +736,8 @@
 					clocks = <&clks IMX7D_ECSPI1_ROOT_CLK>,
 						<&clks IMX7D_ECSPI1_ROOT_CLK>;
 					clock-names = "ipg", "per";
+					dmas = <&sdma 0 7 1>, <&sdma 1 7 2>;
+					dma-names = "rx", "tx";
 					status = "disabled";
 				};
 
@@ -746,6 +750,8 @@
 					clocks = <&clks IMX7D_ECSPI2_ROOT_CLK>,
 						<&clks IMX7D_ECSPI2_ROOT_CLK>;
 					clock-names = "ipg", "per";
+					dmas = <&sdma 2 7 1>, <&sdma 3 7 2>;
+					dma-names = "rx", "tx";
 					status = "disabled";
 				};
 
@@ -758,6 +764,8 @@
 					clocks = <&clks IMX7D_ECSPI3_ROOT_CLK>,
 						<&clks IMX7D_ECSPI3_ROOT_CLK>;
 					clock-names = "ipg", "per";
+					dmas = <&sdma 4 7 1>, <&sdma 5 7 2>;
+					dma-names = "rx", "tx";
 					status = "disabled";
 				};
 
-- 
2.20.1
