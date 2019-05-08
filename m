From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v4 2/3] arm64: dts: qcom: qcs404: Add PCIe related nodes
Date: Wed,  8 May 2019 15:43:08 -0700
Message-ID: <20190508224309.5744-3-bjorn.andersson@linaro.org>
References: <20190508224309.5744-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190508224309.5744-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The QCS404 has a PCIe2 PHY and a Qualcomm PCIe controller, define these
to for the platform.

Reviewed-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v3:
- Split single patch, no functional change

 arch/arm64/boot/dts/qcom/qcs404.dtsi | 65 ++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
index 65a2cbeb28be..f97e9c96b7f7 100644
--- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
@@ -412,6 +412,21 @@
 			#interrupt-cells = <4>;
 		};
 
+		pcie_phy: phy@7786000 {
+			compatible = "qcom,qcs404-pcie2-phy", "qcom,pcie2-phy";
+			reg = <0x07786000 0xb8>;
+
+			clocks = <&gcc GCC_PCIE_0_PIPE_CLK>;
+			resets = <&gcc GCC_PCIEPHY_0_PHY_BCR>,
+				 <&gcc GCC_PCIE_0_PIPE_ARES>;
+			reset-names = "phy", "pipe";
+
+			clock-output-names = "pcie_0_pipe_clk";
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
 		sdcc1: sdcc@7804000 {
 			compatible = "qcom,sdhci-msm-v5";
 			reg = <0x07804000 0x1000>, <0x7805000 0x1000>;
@@ -797,6 +812,56 @@
 				status = "disabled";
 			};
 		};
+
+		pcie: pci@10000000 {
+			compatible = "qcom,pcie-qcs404", "snps,dw-pcie";
+			reg =  <0x10000000 0xf1d>,
+			       <0x10000f20 0xa8>,
+			       <0x07780000 0x2000>,
+			       <0x10001000 0x2000>;
+			reg-names = "dbi", "elbi", "parf", "config";
+			device_type = "pci";
+			linux,pci-domain = <0>;
+			bus-range = <0x00 0xff>;
+			num-lanes = <1>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			ranges = <0x81000000 0 0          0x10003000 0 0x00010000>, /* I/O */
+				 <0x82000000 0 0x10013000 0x10013000 0 0x007ed000>; /* memory */
+
+			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi";
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
+					<0 0 0 2 &intc GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
+					<0 0 0 3 &intc GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
+					<0 0 0 4 &intc GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
+			clocks = <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_0_AUX_CLK>,
+				 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
+				 <&gcc GCC_PCIE_0_SLV_AXI_CLK>;
+			clock-names = "iface", "aux", "master_bus", "slave_bus";
+
+			resets = <&gcc GCC_PCIE_0_AXI_MASTER_ARES>,
+				 <&gcc GCC_PCIE_0_AXI_SLAVE_ARES>,
+				 <&gcc GCC_PCIE_0_AXI_MASTER_STICKY_ARES>,
+				 <&gcc GCC_PCIE_0_CORE_STICKY_ARES>,
+				 <&gcc GCC_PCIE_0_BCR>,
+				 <&gcc GCC_PCIE_0_AHB_ARES>;
+			reset-names = "axi_m",
+				      "axi_s",
+				      "axi_m_sticky",
+				      "pipe_sticky",
+				      "pwr",
+				      "ahb";
+
+			phys = <&pcie_phy>;
+			phy-names = "pciephy";
+
+			status = "disabled";
+		};
 	};
 
 	timer {
-- 
2.18.0
