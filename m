From: Vivek Gautam <vivek.gautam@codeaurora.org>
Subject: [PATCH v2 3/4] dt-bindings: phy: Add support for QMP phy
Date: Tue, 22 Nov 2016 17:32:42 +0530
Message-ID: <1479816163-5260-4-git-send-email-vivek.gautam@codeaurora.org>
References: <1479816163-5260-1-git-send-email-vivek.gautam@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1479816163-5260-1-git-send-email-vivek.gautam@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: kishon@ti.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: srinivas.kandagatla@linaro.org, sboyd@codeaurora.org, linux-arm-msm@vger.kernel.org, Vivek Gautam <vivek.gautam@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Qualcomm chipsets have QMP phy controller that provides
support to a number of controller, viz. PCIe, UFS, and USB.
Adding dt binding information for the same.

Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
Acked-by: Rob Herring <robh@kernel.org>
---

Changes since v1:
 - New patch, forked out of the original driver patch:
   "phy: qcom-qmp: new qmp phy driver for qcom-chipsets"
 - updated bindings to include mem resource as a list of
   offset - length pair for serdes block and for each lane.
 - added a new binding for 'lane-offsets' that contains offsets
   to tx, rx and pcs blocks from each lane base address.

 .../devicetree/bindings/phy/qcom-qmp-phy.txt       | 74 ++++++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
new file mode 100644
index 0000000..ffb173b
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
@@ -0,0 +1,74 @@
+Qualcomm QMP PHY
+----------------
+
+QMP phy controller supports physical layer functionality for a number of
+controllers on Qualcomm chipsets, such as, PCIe, UFS, and USB.
+
+Required properties:
+ - compatible: compatible list, contains:
+	       "qcom,msm8996-qmp-pcie-phy" for 14nm PCIe phy on msm8996,
+	       "qcom,msm8996-qmp-usb3-phy" for 14nm USB3 phy on msm8996.
+ - reg: list of offset and length pair of the PHY register sets.
+	at index 0: offset and length of register set for PHY common
+		    serdes block.
+	from index 1 - N: offset and length of register set for each lane,
+			  for N number of phy lanes (ports).
+ - lane-offsets: array of offsets to tx, rx and pcs blocks for phy lanes.
+ - #phy-cells: must be 1
+    - Cell after phy phandle should be the port (lane) number.
+ - clocks: a list of phandles and clock-specifier pairs,
+	   one for each entry in clock-names.
+ - clock-names: must be "cfg_ahb" for phy config clock,
+			"aux" for phy aux clock,
+			"ref_clk" for 19.2 MHz ref clk,
+			"ref_clk_src" for reference clock source,
+			"pipe<port-number>" for pipe clock specific to
+			each port/lane (Optional).
+ - resets: a list of phandles and reset controller specifier pairs,
+	   one for each entry in reset-names.
+ - reset-names: must be "phy" for reset of phy block,
+			"common" for phy common block reset,
+			"cfg" for phy's ahb cfg block reset (Optional).
+			"port<port-number>" for reset specific to
+			each port/lane (Optional).
+ - vdda-phy-supply: Phandle to a regulator supply to PHY core block.
+ - vdda-pll-supply: Phandle to 1.8V regulator supply to PHY refclk pll block.
+
+Optional properties:
+ - vddp-ref-clk-supply: Phandle to a regulator supply to any specific refclk
+			pll block.
+
+Example:
+	pcie_phy: pciephy@34000 {
+		compatible = "qcom,msm8996-qmp-pcie-phy";
+		reg = <0x034000 0x48f>,
+			<0x035000 0x5bf>,
+			<0x036000 0x5bf>,
+			<0x037000 0x5bf>;
+				/* tx, rx, pcs */
+		lane-offsets = <0x0 0x200 0x400>;
+		#phy-cells = <1>;
+
+		clocks = <&gcc GCC_PCIE_PHY_AUX_CLK>,
+			<&gcc GCC_PCIE_PHY_CFG_AHB_CLK>,
+			<&rpmcc MSM8996_RPM_SMD_LN_BB_CLK>,
+			<&gcc GCC_PCIE_CLKREF_CLK>,
+			<&gcc GCC_PCIE_0_PIPE_CLK>,
+			<&gcc GCC_PCIE_1_PIPE_CLK>,
+			<&gcc GCC_PCIE_2_PIPE_CLK>;
+		clock-names = "aux", "cfg_ahb",
+				"ref_clk_src", "ref_clk",
+				"pipe0", "pipe1", "pipe2";
+
+		vdda-phy-supply = <&pm8994_l28>;
+		vdda-pll-supply = <&pm8994_l12>;
+
+		resets = <&gcc GCC_PCIE_PHY_BCR>,
+			<&gcc GCC_PCIE_PHY_COM_BCR>,
+			<&gcc GCC_PCIE_PHY_COM_NOCSR_BCR>,
+			<&gcc GCC_PCIE_0_PHY_BCR>,
+			<&gcc GCC_PCIE_1_PHY_BCR>,
+			<&gcc GCC_PCIE_2_PHY_BCR>;
+		reset-names = "phy", "common", "cfg",
+				"lane0", "lane1", "lane2";
+	};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
