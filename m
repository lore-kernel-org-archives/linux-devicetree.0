From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 1/2] dt-bindings: msm8996-pcie-phy: add support for msm8996 pcie phy
Date: Wed,  7 Sep 2016 11:55:32 +0100
Message-ID: <1473245733-17260-2-git-send-email-srinivas.kandagatla@linaro.org>
References: <1473245733-17260-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1473245733-17260-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

This patch adds bindings for pcie phy on MSM8996.

This PHY has 3 Ports, including a common block. Each port is connected
to one root complex. Each port has dedicated reset control lines apart
from common reset and clocks for common block.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 .../bindings/phy/qcom-msm8996-pcie-phy.txt         | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom-msm8996-pcie-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/qcom-msm8996-pcie-phy.txt b/Documentation/devicetree/bindings/phy/qcom-msm8996-pcie-phy.txt
new file mode 100644
index 0000000..51930ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom-msm8996-pcie-phy.txt
@@ -0,0 +1,62 @@
+Qualcomm msm8996 pcie PHY
+------------------------
+
+Required properties:
+- compatible: compatible list, contains "qcom,msm8996-pcie-phy".
+- reg: offset and length of the pcie PHY register set;
+- #phy-cells: must be one
+- clocks: a list of phandles and clock-specifier pairs, one for each entry in
+  clock-names.
+- clock-names: must be "cfg" for phy config clock,
+	"aux" for phy aux clock,
+	"ref_clk" for 19.2 MHz ref clk and
+	"ref_clk_src" reference clock source.
+
+
+- resets: a list of phandles and reset controller specifier pairs, one for
+  each entry in reset-names.
+- reset-names: must be "phy" for reset of pcie phy block and "common" for
+  phy common reset.
+
+Required properties: (Child node)
+- reg: lane numer of the pcie phy.
+- resets: a list of phandles and reset controller specifier pairs, one for
+  each entry in reset-names.
+- reset-names: must be "phy" for reset of pcie phy lane.
+
+Example:
+
+	pcie_phy: qcom,pciephy@34000 {
+		compatible = "qcom,msm8996-pcie-phy";
+		reg = <0x00034000 0x4000>;
+		#phy-cells = <1>;
+		clocks = <&gcc GCC_PCIE_PHY_CFG_AHB_CLK>,
+			<&gcc GCC_PCIE_PHY_AUX_CLK>,
+			<&gcc GCC_PCIE_CLKREF_CLK>,
+			<&rpmcc MSM8996_RPM_SMD_LN_BB_CLK>;
+		clock-names = "cfg", "aux", "ref_clk", "ref_clk_src";
+
+		resets = <&gcc GCC_PCIE_PHY_BCR>,
+			<&gcc GCC_PCIE_PHY_COM_BCR>;
+		reset-names = "phy",  "common";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+		pcie_phy@0{
+			reg = <0>;
+			resets = <&gcc GCC_PCIE_0_PHY_BCR>;
+			reset-names = "phy";
+		};
+
+		pcie_phy@1{
+			reg = <1>;
+			resets = <&gcc GCC_PCIE_1_PHY_BCR>;
+			reset-names = "phy";
+		};
+
+		pcie_phy@2{
+			reg = <2>;
+			resets = <&gcc GCC_PCIE_2_PHY_BCR>;
+			reset-names = "phy";
+		};
+	};
-- 
2.7.4
