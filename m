From: Evan Green <evgreen@chromium.org>
Subject: [PATCH v7 1/5] dt-bindings: phy-qcom-qmp: Fix register underspecification
Date: Mon, 10 Dec 2018 11:28:22 -0800
Message-ID: <20181210192826.241350-2-evgreen@chromium.org>
References: <20181210192826.241350-1-evgreen@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181210192826.241350-1-evgreen@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>, Evan Green <evgreen@chromium.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add register regions for the second lane of dual-lane nodes.
This additional specification is needed so that the driver can stop
reaching beyond the tx and rx register allocations to get at the
second lane registers in a dual-lane PHY.

While in there, document #clock-cells as optional for PHYs that don't
provide a pipe clock. Also, document the pcs_misc register region, which
was being quietly supplied and used.

Signed-off-by: Evan Green <evgreen@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>

---

Changes in v7: None
Changes in v6: None
Changes in v5:
- Fix incorrect register value in example, copied from real life!

Changes in v4:
- Remove "status" from DT binding example (Rob)

Changes in v3: None
Changes in v2:
- Added dt bindings change, corresponding driver fixup, and USB PHY fixup

 .../devicetree/bindings/phy/qcom-qmp-phy.txt  | 69 +++++++++++++++++--
 1 file changed, 62 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
index adf20b2bdf715..c7a71e67ebdf5 100644
--- a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
+++ b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
@@ -25,7 +25,7 @@ Required properties:
   - For all others:
     - The reg-names property shouldn't be defined.
 
- - #clock-cells: must be 1
+ - #clock-cells: must be 1 (PCIe and USB3 PHYs only)
     - Phy pll outputs a bunch of clocks for Tx, Rx and Pipe
       interface (for pipe based PHYs). These clock are then gate-controlled
       by gcc.
@@ -70,22 +70,26 @@ Required nodes:
  - Each device node of QMP phy is required to have as many child nodes as
    the number of lanes the PHY has.
 
-Required properties for child node:
+Required properties for child nodes of PCIe PHYs (one child per lane):
  - reg: list of offset and length pairs of register sets for PHY blocks -
-	- index 0: tx
-	- index 1: rx
-	- index 2: pcs
-	- index 3: pcs_misc (optional)
+	tx, rx, pcs, and pcs_misc (optional).
+ - #phy-cells: must be 0
 
+Required properties for a single "lanes" child node of non-PCIe PHYs:
+ - reg: list of offset and length pairs of register sets for PHY blocks
+	For 1-lane devices:
+		tx, rx, pcs, and (optionally) pcs_misc
+	For 2-lane devices:
+		tx0, rx0, pcs, tx1, rx1, and (optionally) pcs_misc
  - #phy-cells: must be 0
 
+Required properties for child node of PCIe and USB3 qmp phys:
  - clocks: a list of phandles and clock-specifier pairs,
 	   one for each entry in clock-names.
  - clock-names: Must contain following for pcie and usb qmp phys:
 		 "pipe<lane-number>" for pipe clock specific to each lane.
  - clock-output-names: Name of the PHY clock that will be the parent for
 		       the above pipe clock.
-
 	For "qcom,ipq8074-qmp-pcie-phy":
 		- "pcie20_phy0_pipe_clk"	Pipe Clock parent
 			(or)
@@ -135,3 +139,54 @@ Example:
 		...
 		...
 	};
+
+	phy@88eb000 {
+		compatible = "qcom,sdm845-qmp-usb3-uni-phy";
+		reg = <0x88eb000 0x18c>;
+		#clock-cells = <1>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		clocks = <&gcc GCC_USB3_SEC_PHY_AUX_CLK>,
+			 <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
+			 <&gcc GCC_USB3_SEC_CLKREF_CLK>,
+			 <&gcc GCC_USB3_SEC_PHY_COM_AUX_CLK>;
+		clock-names = "aux", "cfg_ahb", "ref", "com_aux";
+
+		resets = <&gcc GCC_USB3PHY_PHY_SEC_BCR>,
+			 <&gcc GCC_USB3_PHY_SEC_BCR>;
+		reset-names = "phy", "common";
+
+		lane@88eb200 {
+			reg = <0x88eb200 0x128>,
+			      <0x88eb400 0x1fc>,
+			      <0x88eb800 0x218>,
+			      <0x88eb600 0x70>;
+			#phy-cells = <0>;
+			clocks = <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
+			clock-names = "pipe0";
+			clock-output-names = "usb3_uni_phy_pipe_clk_src";
+		};
+	};
+
+	phy@1d87000 {
+		compatible = "qcom,sdm845-qmp-ufs-phy";
+		reg = <0x1d87000 0x18c>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		clock-names = "ref",
+			      "ref_aux";
+		clocks = <&gcc GCC_UFS_MEM_CLKREF_CLK>,
+			 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>;
+
+		lanes@1d87400 {
+			reg = <0x1d87400 0x108>,
+			      <0x1d87600 0x1e0>,
+			      <0x1d87c00 0x1dc>,
+			      <0x1d87800 0x108>,
+			      <0x1d87a00 0x1e0>;
+			#phy-cells = <0>;
+		};
+	};
-- 
2.18.1
