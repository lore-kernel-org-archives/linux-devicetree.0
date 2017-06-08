From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH v6 2/3] ARM: dts: imx7: add GPMI NAND and APBH DMA
Date: Thu,  8 Jun 2017 15:34:48 -0700
Message-ID: <d4aaef68978524bb46eee79d639dde2b83e8bb5f.1496961128.git-series.stefan@agner.ch>
References: <cover.9fab78eaa869dbad4c9ad7e8578c9cef3e49daa8.1496961128.git-series.stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.9fab78eaa869dbad4c9ad7e8578c9cef3e49daa8.1496961128.git-series.stefan@agner.ch>
In-Reply-To: <cover.9fab78eaa869dbad4c9ad7e8578c9cef3e49daa8.1496961128.git-series.stefan@agner.ch>
References: <cover.9fab78eaa869dbad4c9ad7e8578c9cef3e49daa8.1496961128.git-series.stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, kernel@pengutronix.de, sboyd@codeaurora.org
Cc: aisheng.dong@nxp.com, dwmw2@infradead.org, computersforpeace@gmail.com, boris.brezillon@free-electrons.com, marek.vasut@gmail.com, richard@nod.at, robh+dt@kernel.org, mark.rutland@arm.com, han.xu@nxp.com, fabio.estevam@freescale.com, LW@KARO-electronics.de, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>
List-Id: devicetree@vger.kernel.org

Add i.MX 7 APBH DMA and GPMI NAND modules.

Signed-off-by: Stefan Agner <stefan@agner.ch>
Tested-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 arch/arm/boot/dts/imx7s.dtsi | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm/boot/dts/imx7s.dtsi b/arch/arm/boot/dts/imx7s.dtsi
index c4f12fd..4902f62 100644
--- a/arch/arm/boot/dts/imx7s.dtsi
+++ b/arch/arm/boot/dts/imx7s.dtsi
@@ -995,5 +995,36 @@
 				status = "disabled";
 			};
 		};
+
+		dma_apbh: dma-apbh@33000000 {
+			compatible = "fsl,imx7d-dma-apbh", "fsl,imx28-dma-apbh";
+			reg = <0x33000000 0x2000>;
+			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "gpmi0", "gpmi1", "gpmi2", "gpmi3";
+			#dma-cells = <1>;
+			dma-channels = <4>;
+			clocks = <&clks IMX7D_NAND_USDHC_BUS_RAWNAND_CLK>;
+		};
+
+		gpmi: gpmi-nand@33002000{
+			compatible = "fsl,imx7d-gpmi-nand";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0x33002000 0x2000>, <0x33004000 0x4000>;
+			reg-names = "gpmi-nand", "bch";
+			interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "bch";
+			clocks = <&clks IMX7D_NAND_RAWNAND_CLK>,
+				<&clks IMX7D_NAND_USDHC_BUS_RAWNAND_CLK>;
+			clock-names = "gpmi_io", "gpmi_bch_apb";
+			dmas = <&dma_apbh 0>;
+			dma-names = "rx-tx";
+			status = "disabled";
+			assigned-clocks = <&clks IMX7D_NAND_ROOT_SRC>;
+			assigned-clock-parents = <&clks IMX7D_PLL_ENET_MAIN_500M_CLK>;
+		};
 	};
 };
-- 
git-series 0.9.1
