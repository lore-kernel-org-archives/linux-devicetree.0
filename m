From: Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v2 08/10] arm: dts: mt7623: add display subsystem related nodes
Date: Tue, 26 Sep 2017 10:02:59 +0800
Message-ID: <94d2dffcd55d85c5d58e8bf1db57708b06a00852.1506390597.git.ryder.lee@mediatek.com>
References: <cover.1506390597.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1506390597.git.ryder.lee@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Erin Lo <erin.lo@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>
List-Id: devicetree@vger.kernel.org

This patch adds the device nodes for the display function blocks.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 arch/arm/boot/dts/mt7623.dtsi | 94 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
index c3ce0b0..043bae6 100644
--- a/arch/arm/boot/dts/mt7623.dtsi
+++ b/arch/arm/boot/dts/mt7623.dtsi
@@ -29,6 +29,11 @@
 	compatible = "mediatek,mt7623";
 	interrupt-parent = <&sysirq>;
 
+	aliases {
+		rdma0 = &rdma0;
+		rdma1 = &rdma1;
+	};
+
 	cpu_opp_table: opp_table {
 		compatible = "operating-points-v2";
 		opp-shared;
@@ -298,6 +303,17 @@
 		clock-names = "spi", "wrap";
 	};
 
+	mipi_tx0: mipi-dphy@10010000 {
+		compatible = "mediatek,mt7623-mipi-tx",
+			     "mediatek,mt2701-mipi-tx";
+		reg = <0 0x10010000 0 0x90>;
+		clocks = <&clk26m>;
+		clock-output-names = "mipi_tx0_pll";
+		#clock-cells = <0>;
+		#phy-cells = <0>;
+		status = "disabled";
+	};
+
 	cir: cir@10013000 {
 		compatible = "mediatek,mt7623-cir";
 		reg = <0 0x10013000 0 0x1000>;
@@ -692,6 +708,74 @@
 		#clock-cells = <1>;
 	};
 
+	display_components: dispsys@14000000 {
+		compatible = "mediatek,mt7623-mmsys",
+			     "mediatek,mt2701-mmsys";
+		reg = <0 0x14000000 0 0x1000>;
+		power-domains = <&scpsys MT2701_POWER_DOMAIN_DISP>;
+	};
+
+	ovl: ovl@14007000 {
+		compatible = "mediatek,mt7623-disp-ovl",
+			     "mediatek,mt2701-disp-ovl";
+		reg = <0 0x14007000 0 0x1000>;
+		interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&mmsys CLK_MM_DISP_OVL>;
+		iommus = <&iommu MT2701_M4U_PORT_DISP_OVL_0>;
+		mediatek,larb = <&larb0>;
+	};
+
+	rdma0: rdma@14008000 {
+		compatible = "mediatek,mt7623-disp-rdma",
+			     "mediatek,mt2701-disp-rdma";
+		reg = <0 0x14008000 0 0x1000>;
+		interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&mmsys CLK_MM_DISP_RDMA>;
+		iommus = <&iommu MT2701_M4U_PORT_DISP_RDMA>;
+		mediatek,larb = <&larb0>;
+	};
+
+	bls: pwm@1400a000 {
+		compatible = "mediatek,mt7623-disp-pwm",
+			     "mediatek,mt2701-disp-pwm";
+		reg = <0 0x1400a000 0 0x1000>;
+		#pwm-cells = <2>;
+		clocks = <&mmsys CLK_MM_MDP_BLS_26M>,
+			 <&mmsys CLK_MM_DISP_BLS>;
+		clock-names = "main", "mm";
+		status = "disabled";
+	};
+
+	color: color@1400b000 {
+		compatible = "mediatek,mt7623-disp-color",
+			     "mediatek,mt2701-disp-color";
+		reg = <0 0x1400b000 0 0x1000>;
+		interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&mmsys CLK_MM_DISP_COLOR>;
+	};
+
+	dsi: dsi@1400c000 {
+		compatible = "mediatek,mt7623-dsi",
+			     "mediatek,mt2701-dsi";
+		reg = <0 0x1400c000 0 0x1000>;
+		interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&mmsys CLK_MM_DSI_ENGINE>,
+			 <&mmsys CLK_MM_DSI_DIG>,
+			 <&mipi_tx0>;
+		clock-names = "engine", "digital", "hs";
+		phys = <&mipi_tx0>;
+		phy-names = "dphy";
+		status = "disabled";
+	};
+
+	mutex: mutex@1400e000 {
+		compatible = "mediatek,mt7623-disp-mutex",
+			     "mediatek,mt2701-disp-mutex";
+		reg = <0 0x1400e000 0 0x1000>;
+		interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&mmsys CLK_MM_MUTEX_32K>;
+	};
+
 	larb0: larb@14010000 {
 		compatible = "mediatek,mt7623-smi-larb",
 			     "mediatek,mt2701-smi-larb";
@@ -704,6 +788,16 @@
 		power-domains = <&scpsys MT2701_POWER_DOMAIN_DISP>;
 	};
 
+	rdma1: rdma@14012000 {
+		compatible = "mediatek,mt7623-disp-rdma",
+			     "mediatek,mt2701-disp-rdma";
+		reg = <0 0x14012000 0 0x1000>;
+		interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&mmsys CLK_MM_DISP_RDMA1>;
+		iommus = <&iommu MT2701_M4U_PORT_DISP_RDMA1>;
+		mediatek,larb = <&larb0>;
+	};
+
 	imgsys: syscon@15000000 {
 		compatible = "mediatek,mt7623-imgsys",
 			     "mediatek,mt2701-imgsys",
-- 
1.9.1
