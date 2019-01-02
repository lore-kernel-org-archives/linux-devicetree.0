From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 1/7] dt-bindings: net: Add Qualcomm ethqos binding
Date: Wed,  2 Jan 2019 14:47:23 +0530
Message-ID: <20190102091729.18582-2-vkoul@kernel.org>
References: <20190102091729.18582-1-vkoul@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190102091729.18582-1-vkoul@kernel.org>
Sender: netdev-owner@vger.kernel.org
To: "David S . Miller" <davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Niklas Cassel <niklas.cassel@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add support for Qualcomm ethqos found in some SoCs like QCS404.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 .../devicetree/bindings/net/qcom,dwmac.txt    | 129 ++++++++++++++++++
 1 file changed, 129 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/qcom,dwmac.txt

diff --git a/Documentation/devicetree/bindings/net/qcom,dwmac.txt b/Documentation/devicetree/bindings/net/qcom,dwmac.txt
new file mode 100644
index 000000000000..e3a412695afb
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/qcom,dwmac.txt
@@ -0,0 +1,129 @@
+Qualcomm Ethernet ETHQOS device
+
+This device has following properties:
+
+Required properties:
+
+- compatible: Should be qcom,ethqos-qcs404"
+
+- reg: Address and length of the register set for the device
+
+- reg-names: Should contain register names "stmmaceth", "rgmii"
+
+- clocks: Should contain phandle to clocks
+
+- clock-names: Should contain clock names "stmmaceth", "pclk",
+		"ptp_ref", "rgmii"
+
+- interrupts: Should contain phandle to interrupts
+
+- interrupt-names: Should contain interrupt names "macirq", "eth_lpi"
+
+Rest of the properties are defined in stmmac.txt file in same directory
+
+
+Example:
+
+ethernet: ethernet@7a80000 {
+	compatible = "qcom,ethqos-qcs404";
+	reg = <0x07a80000 0x10000>,
+		<0x07a96000 0x100>;
+	reg-names = "stmmaceth", "rgmii";
+	clock-names = "stmmaceth", "pclk", "ptp_ref", "rgmii";
+	clocks = <&gcc GCC_ETH_AXI_CLK>,
+		<&gcc GCC_ETH_SLAVE_AHB_CLK>,
+		<&gcc GCC_ETH_PTP_CLK>,
+		<&gcc GCC_ETH_RGMII_CLK>;
+	interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
+			<GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
+	interrupt-names = "macirq", "eth_lpi";
+	snps,reset-gpio = <&tlmm 60 GPIO_ACTIVE_LOW>;
+	snps,reset-active-low;
+	snps,axi-config = <&stmmac_axi_setup>;
+	snps,mtl-rx-config = <&mtl_rx_setup>;
+	snps,mtl-tx-config = <&mtl_tx_setup>;
+
+	snps,txpbl = <8>;
+	snps,rxpbl = <2>;
+	snps,aal;
+	snps,tso;
+
+	phy-handle = <&phy1>;
+	phy-mode = "rgmii";
+
+	stmmac_axi_setup: stmmac-axi-config {
+		snps,wr_osr_lmt = <15>;
+		snps,rd_osr_lmt = <15>;
+		snps,blen = <256 128 64 32 0 0 0>;
+	};
+
+	mtl_rx_setup: rx-queues-config {
+		snps,rx-queues-to-use = <4>;
+		snps,rx-sched-sp;
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,priority = <0x0>;
+		};
+		queue1 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x1>;
+			snps,priority = <0x1>;
+		};
+		queue2 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x2>;
+			snps,priority = <0x1>;
+		};
+		queue3 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x3>;
+			snps,priority = <0x1>;
+		};
+	};
+
+	mtl_tx_setup: tx-queues-config {
+		snps,tx-queues-to-use = <4>;
+		snps,tx-sched-wrr;
+		queue0 {
+			snps,weight = <0x10>;
+			snps,dcb-algorithm;
+			snps,priority = <0x0>;
+		};
+		queue1 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3E800>;
+			snps,low_credit = <0xFFC18000>;
+			snps,priority = <0x1>;
+		};
+		queue2 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3E800>;
+			snps,low_credit = <0xFFC18000>;
+			snps,priority = <0x1>;
+		};
+		queue3 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3E800>;
+			snps,low_credit = <0xFFC18000>;
+			snps,priority = <0x1>;
+		};
+	};
+
+	mdio {
+		#address-cells = <0x1>;
+		#size-cells = <0x0>;
+		compatible = "snps,dwmac-mdio";
+		phy1: phy@1 {
+			device_type = "ethernet-phy";
+			reg = <0x4>;
+		};
+	};
+
+};
-- 
2.20.1
