From: Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v2 03/10] arm: dts: mt2701: add display subsystem related nodes
Date: Tue, 26 Sep 2017 10:02:54 +0800
Message-ID: <b1874b93aac73ebdc4e6cd5b6507cac0b116ddd7.1506390597.git.ryder.lee@mediatek.com>
References: <cover.1506390597.git.ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1506390597.git.ryder.lee@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Erin Lo <erin.lo@mediatek.com>, YT Shen <yt.shen@mediatek.com>, Ryder Lee <ryder.lo@mediatek.com>
List-Id: devicetree@vger.kernel.org

From: YT Shen <yt.shen@mediatek.com>

This patch adds the device nodes for MT2701 DISP function blocks.

Signed-off-by: YT Shen <yt.shen@mediatek.com>
Signed-off-by: Erin Lo <erin.lo@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lo@mediatek.com>
---
 arch/arm/boot/dts/mt2701.dtsi | 75 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
index 3c85879..8c9fbe5 100644
--- a/arch/arm/boot/dts/mt2701.dtsi
+++ b/arch/arm/boot/dts/mt2701.dtsi
@@ -26,6 +26,11 @@
 	compatible = "mediatek,mt2701";
 	interrupt-parent = <&cirq>;
 
+	aliases {
+		rdma0 = &rdma0;
+		rdma1 = &rdma1;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -203,6 +208,16 @@
 		power-domains = <&scpsys MT2701_POWER_DOMAIN_DISP>;
 	};
 
+	mipi_tx0: mipi-dphy@10010000 {
+		compatible = "mediatek,mt2701-mipi-tx";
+		reg = <0 0x10010000 0 0x90>;
+		clocks = <&clk26m>;
+		clock-output-names = "mipi_tx0_pll";
+		#clock-cells = <0>;
+		#phy-cells = <0>;
+		status = "disabled";
+	};
+
 	sysirq: interrupt-controller@10200100 {
 		compatible = "mediatek,mt2701-sysirq",
 			     "mediatek,mt6577-sysirq";
@@ -530,6 +545,30 @@
 		#clock-cells = <1>;
 	};
 
+	display_components: dispsys@14000000 {
+		compatible = "mediatek,mt2701-mmsys";
+		reg = <0 0x14000000 0 0x1000>;
+		power-domains = <&scpsys MT2701_POWER_DOMAIN_DISP>;
+	};
+
+	ovl: ovl@14007000 {
+		compatible = "mediatek,mt2701-disp-ovl";
+		reg = <0 0x14007000 0 0x1000>;
+		interrupts = <GIC_SPI 153 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&mmsys CLK_MM_DISP_OVL>;
+		iommus = <&iommu MT2701_M4U_PORT_DISP_OVL_0>;
+		mediatek,larb = <&larb0>;
+	};
+
+	rdma0: rdma@14008000 {
+		compatible = "mediatek,mt2701-disp-rdma";
+		reg = <0 0x14008000 0 0x1000>;
+		interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&mmsys CLK_MM_DISP_RDMA>;
+		iommus = <&iommu MT2701_M4U_PORT_DISP_RDMA>;
+		mediatek,larb = <&larb0>;
+	};
+
 	bls: pwm@1400a000 {
 		compatible = "mediatek,mt2701-disp-pwm";
 		reg = <0 0x1400a000 0 0x1000>;
@@ -539,6 +578,33 @@
 		status = "disabled";
 	};
 
+	color: color@1400b000 {
+		compatible = "mediatek,mt2701-disp-color";
+		reg = <0 0x1400b000 0 0x1000>;
+		interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&mmsys CLK_MM_DISP_COLOR>;
+	};
+
+	dsi: dsi@1400c000 {
+		compatible = "mediatek,mt2701-dsi";
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
+		compatible = "mediatek,mt2701-disp-mutex";
+		reg = <0 0x1400e000 0 0x1000>;
+		interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&mmsys CLK_MM_MUTEX_32K>;
+	};
+
 	larb0: larb@14010000 {
 		compatible = "mediatek,mt2701-smi-larb";
 		reg = <0 0x14010000 0 0x1000>;
@@ -550,6 +616,15 @@
 		power-domains = <&scpsys MT2701_POWER_DOMAIN_DISP>;
 	};
 
+	rdma1: rdma@14012000 {
+		compatible = "mediatek,mt2701-disp-rdma";
+		reg = <0 0x14012000 0 0x1000>;
+		interrupts = <GIC_SPI 164 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&mmsys CLK_MM_DISP_RDMA1>;
+		iommus = <&iommu MT2701_M4U_PORT_DISP_RDMA1>;
+		mediatek,larb = <&larb0>;
+	};
+
 	imgsys: syscon@15000000 {
 		compatible = "mediatek,mt2701-imgsys", "syscon";
 		reg = <0 0x15000000 0 0x1000>;
-- 
1.9.1
