From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH 2/2] ARM: dts: imx7: add USDHC NAND clock to SDHC instances
Date: Wed, 29 Mar 2017 17:50:29 -0700
Message-ID: <20170330005029.6472-2-stefan@agner.ch>
References: <20170330005029.6472-1-stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170330005029.6472-1-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, kernel@pengutronix.de, sboyd@codeaurora.org
Cc: aisheng.dong@nxp.com, fabio.estevam@nxp.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: devicetree@vger.kernel.org

The USDHC instances need the USDHC NAND clock in order to operate.
Add the clock as ahb bus clock.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/boot/dts/imx7s.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
index 5d3a43b8de20..5794febb19a4 100644
--- a/arch/arm/boot/dts/imx7s.dtsi
+++ b/arch/arm/boot/dts/imx7s.dtsi
@@ -936,7 +936,7 @@
 				reg = <0x30b40000 0x10000>;
 				interrupts = <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX7D_CLK_DUMMY>,
-					<&clks IMX7D_CLK_DUMMY>,
+					<&clks IMX7D_NAND_USDHC_BUS_ROOT_CLK>,
 					<&clks IMX7D_USDHC1_ROOT_CLK>;
 				clock-names = "ipg", "ahb", "per";
 				bus-width = <4>;
@@ -948,7 +948,7 @@
 				reg = <0x30b50000 0x10000>;
 				interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX7D_CLK_DUMMY>,
-					<&clks IMX7D_CLK_DUMMY>,
+					<&clks IMX7D_NAND_USDHC_BUS_ROOT_CLK>,
 					<&clks IMX7D_USDHC2_ROOT_CLK>;
 				clock-names = "ipg", "ahb", "per";
 				bus-width = <4>;
@@ -960,7 +960,7 @@
 				reg = <0x30b60000 0x10000>;
 				interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX7D_CLK_DUMMY>,
-					<&clks IMX7D_CLK_DUMMY>,
+					<&clks IMX7D_NAND_USDHC_BUS_ROOT_CLK>,
 					<&clks IMX7D_USDHC3_ROOT_CLK>;
 				clock-names = "ipg", "ahb", "per";
 				bus-width = <4>;
-- 
2.12.1
