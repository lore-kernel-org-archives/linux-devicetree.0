From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v3 1/5] dt-bindings: net: Add Qualcomm ethqos binding
Date: Mon, 21 Jan 2019 14:43:14 +0530
Message-ID: <20190121091318.20079-2-vkoul@kernel.org>
References: <20190121091318.20079-1-vkoul@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190121091318.20079-1-vkoul@kernel.org>
Sender: netdev-owner@vger.kernel.org
To: David S Miller <davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, Niklas Cassel <niklas.cassel@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add support for Qualcomm ethqos found in some SoCs like QCS404.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 .../devicetree/bindings/net/qcom,ethqos.txt   | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/qcom,ethqos.txt

diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.txt b/Documentation/devicetree/bindings/net/qcom,ethqos.txt
new file mode 100644
index 000000000000..fcf5035810b5
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/qcom,ethqos.txt
@@ -0,0 +1,64 @@
+Qualcomm Ethernet ETHQOS device
+
+This documents dwmmac based ethernet device which supports Gigabit
+ethernet for version v2.3.0 onwards.
+
+This device has following properties:
+
+Required properties:
+
+- compatible: Should be qcom,qcs404-ethqos"
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
+	compatible = "qcom,qcs404-ethqos";
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
+
+	snps,txpbl = <8>;
+	snps,rxpbl = <2>;
+	snps,aal;
+	snps,tso;
+
+	phy-handle = <&phy1>;
+	phy-mode = "rgmii";
+
+	mdio {
+		#address-cells = <0x1>;
+		#size-cells = <0x0>;
+		compatible = "snps,dwmac-mdio";
+		phy1: phy@4 {
+			device_type = "ethernet-phy";
+			reg = <0x4>;
+		};
+	};
+
+};
-- 
2.20.1
