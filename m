From: Evan Green <evgreen@chromium.org>
Subject: [PATCH v2 1/4] dt-bindings: phy-qcom-qmp: Move #clock-cells to child
Date: Mon, 10 Dec 2018 11:32:04 -0800
Message-ID: <20181210193207.242080-2-evgreen@chromium.org>
References: <20181210193207.242080-1-evgreen@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181210193207.242080-1-evgreen@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Andy Gross <andy.gross@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>, Evan Green <evgreen@chromium.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The phy-qcom-qmp bindings specified #clock-cells as 1. This was never used
because of_clk_add_provider() was never called, so there was no way anybody
could reference these clocks from DT. Furthermore, even if they could be
accessed, the bindings never specified what should go in that additional
cell.

Fix these incomplete and broken bindings. Move the #clock-cells into the
child node, since that is the actual clock provider, and not all
instances of qcom-qmp-phy are clock providers. Also set #clock-cells to
zero, since there's nothing to pass to it.

Signed-off-by: Evan Green <evgreen@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---

Changes in v2: None

 .../devicetree/bindings/phy/qcom-qmp-phy.txt          | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
index c7a71e67ebdf5..68c67eeef7758 100644
--- a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
+++ b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
@@ -25,10 +25,6 @@ Required properties:
   - For all others:
     - The reg-names property shouldn't be defined.
 
- - #clock-cells: must be 1 (PCIe and USB3 PHYs only)
-    - Phy pll outputs a bunch of clocks for Tx, Rx and Pipe
-      interface (for pipe based PHYs). These clock are then gate-controlled
-      by gcc.
  - #address-cells: must be 1
  - #size-cells: must be 1
  - ranges: must be present
@@ -94,6 +90,9 @@ Required properties for child node of PCIe and USB3 qmp phys:
 		- "pcie20_phy0_pipe_clk"	Pipe Clock parent
 			(or)
 		  "pcie20_phy1_pipe_clk"
+ - #clock-cells: must be 0
+    - Phy pll outputs pipe clocks for pipe based PHYs. These clocks are then
+      gate-controlled by the gcc.
 
  - resets: a list of phandles and reset controller specifier pairs,
 	   one for each entry in reset-names.
@@ -104,7 +103,6 @@ Example:
 	phy@34000 {
 		compatible = "qcom,msm8996-qmp-pcie-phy";
 		reg = <0x34000 0x488>;
-		#clock-cells = <1>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges;
@@ -126,6 +124,7 @@ Example:
 			reg = <0x35000 0x130>,
 				<0x35200 0x200>,
 				<0x35400 0x1dc>;
+			#clock-cells = <0>;
 			#phy-cells = <0>;
 
 			clocks = <&gcc GCC_PCIE_0_PIPE_CLK>;
@@ -143,7 +142,6 @@ Example:
 	phy@88eb000 {
 		compatible = "qcom,sdm845-qmp-usb3-uni-phy";
 		reg = <0x88eb000 0x18c>;
-		#clock-cells = <1>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges;
@@ -163,6 +161,7 @@ Example:
 			      <0x88eb400 0x1fc>,
 			      <0x88eb800 0x218>,
 			      <0x88eb600 0x70>;
+			#clock-cells = <0>;
 			#phy-cells = <0>;
 			clocks = <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
 			clock-names = "pipe0";
-- 
2.18.1
