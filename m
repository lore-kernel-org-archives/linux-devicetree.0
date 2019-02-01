Return-Path: <vkoul@kernel.org>
From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 1/2] arm64: dts: qcom: qcs404: Add Ethernet node
Date: Fri,  1 Feb 2019 23:33:30 +0530
Message-Id: <20190201180331.6960-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Niklas Cassel <niklas.cassel@linaro.org>
List-ID: <devicetree@vger.kernel.org>

Add the ethernet node found in QCS404 platform.

Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
changes in v2:
	- add queues and mtl config

 arch/arm64/boot/dts/qcom/qcs404.dtsi | 71 ++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 76699435c8bd..e4f6bba0c7f2 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -646,6 +646,77 @@
 			status = "disabled";
 		};
 
+		ethernet: ethernet@7a80000 {
+			compatible = "qcom,qcs404-ethqos";
+			reg = <0x07a80000 0x10000>,
+				<0x07a96000 0x100>;
+			reg-names = "stmmaceth", "rgmii";
+			clock-names = "stmmaceth", "pclk", "ptp_ref", "rgmii";
+			clocks = <&gcc GCC_ETH_AXI_CLK>,
+				<&gcc GCC_ETH_SLAVE_AHB_CLK>,
+				<&gcc GCC_ETH_PTP_CLK>,
+				<&gcc GCC_ETH_RGMII_CLK>;
+			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
+					<GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "eth_lpi";
+
+			snps,axi-config = <&stmmac_axi_setup>;
+			snps,mtl-rx-config = <&mtl_rx_setup>;
+			snps,mtl-tx-config = <&mtl_tx_setup>;
+
+			snps,txpbl = <8>;
+			snps,rxpbl = <2>;
+			snps,aal;
+			snps,tso;
+			rx-fifo-depth = <16384>;
+			tx-fifo-depth = <20480>;
+
+			status = "disabled";
+
+			stmmac_axi_setup: stmmac-axi-setup {
+				snps,rd_osr_lmt = <2>;
+				snps,blen = <0 0 0 0 16 8 4>;
+			};
+
+			mtl_rx_setup: rx-queues-config {
+				snps,rx-queues-to-use = <0x4>;
+				snps,rx-sched-sp;
+
+				queue0 {
+					snps,dcb-algorithm;
+				};
+				queue1 {
+					snps,dcb-algorithm;
+				};
+				queue2 {
+					snps,dcb-algorithm;
+				};
+				queue3 {
+					snps,dcb-algorithm;
+				};
+			};
+			mtl_tx_setup: tx-queues-config {
+				snps,tx-queues-to-use = <0x5>;
+				snps,tx-sched-sp;
+
+				queue0 {
+					snps,dcb-algorithm;
+				};
+				queue1 {
+					snps,dcb-algorithm;
+				};
+				queue2 {
+					snps,dcb-algorithm;
+				};
+				queue3 {
+					snps,dcb-algorithm;
+				};
+				queue4 {
+					snps,dcb-algorithm;
+				};
+			};
+		};
+
 		blsp2_dma: dma@7ac4000 {
 			compatible = "qcom,bam-v1.7.0";
 			reg = <0x07ac4000 0x17000>;
-- 
2.20.1
