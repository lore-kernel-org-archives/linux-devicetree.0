Return-Path: <vkoul@kernel.org>
From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 1/3] arm64: dts: qcom: qcs404: Add Ethernet node
Date: Wed, 23 Jan 2019 23:18:37 +0530
Message-Id: <20190123174839.5321-1-vkoul@kernel.org>
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
 arch/arm64/boot/dts/qcom/qcs404.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index f3d77e7ee0d2..4696472bdc4e 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -346,6 +346,30 @@
 			status = "okay";
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
+			snps,txpbl = <8>;
+			snps,rxpbl = <2>;
+			snps,aal;
+			snps,tso;
+			rx-fifo-depth=<4096>;
+			tx-fifo-depth=<4096>;
+
+			status = "disabled";
+		};
+
 		wifi: wifi@a000000 {
 			compatible = "qcom,wcn3990-wifi";
 			reg = <0xa000000 0x800000>;
-- 
2.20.1
