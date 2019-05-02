From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v3 1/2] dt-bindings: phy: Add binding for Qualcomm PCIe2 PHY
Date: Wed,  1 May 2019 17:14:05 -0700
Message-ID: <20190502001406.10431-2-bjorn.andersson@linaro.org>
References: <20190502001406.10431-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190502001406.10431-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The Qualcomm PCIe2 PHY is a Synopsys based PCIe PHY found in a number of
Qualcomm platforms, add a binding to describe this.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- Add #clock-cells

 .../bindings/phy/qcom-pcie2-phy.txt           | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom-pcie2-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/qcom-pcie2-phy.txt b/Documentation/devicetree/bindings/phy/qcom-pcie2-phy.txt
new file mode 100644
index 000000000000..30064253f290
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom-pcie2-phy.txt
@@ -0,0 +1,42 @@
+Qualcomm PCIe2 PHY controller
+=============================
+
+The Qualcomm PCIe2 PHY is a Synopsys based phy found in a number of Qualcomm
+platforms.
+
+Required properties:
+ - compatible: compatible list, should be:
+	       "qcom,qcs404-pcie2-phy", "qcom,pcie2-phy"
+
+ - reg: offset and length of the PHY register set.
+ - #phy-cells: must be 0.
+
+ - clocks: a clock-specifier pair for the "pipe" clock
+
+ - vdda-vp-supply: phandle to low voltage regulator
+ - vdda-vph-supply: phandle to high voltage regulator
+
+ - resets: reset-specifier pairs for the "phy" and "pipe" resets
+ - reset-names: list of resets, should contain:
+		"phy" and "pipe"
+
+ - clock-output-names: name of the outgoing clock signal from the PHY PLL
+ - #clock-cells: must be 0
+
+Example:
+ phy@7786000 {
+	compatible = "qcom,qcs404-pcie2-phy", "qcom,pcie2-phy";
+	reg = <0x07786000 0xb8>;
+
+	clocks = <&gcc GCC_PCIE_0_PIPE_CLK>;
+	resets = <&gcc GCC_PCIEPHY_0_PHY_BCR>,
+	         <&gcc GCC_PCIE_0_PIPE_ARES>;
+	reset-names = "phy", "pipe";
+
+	vdda-vp-supply = <&vreg_l3_1p05>;
+	vdda-vph-supply = <&vreg_l5_1p8>;
+
+	clock-output-names = "pcie_0_pipe_clk";
+	#clock-cells = <0>;
+	#phy-cells = <0>;
+ };
-- 
2.18.0
