From: Evan Green <evgreen@chromium.org>
Subject: [PATCH v1 1/4] dt-bindings: phy-qcom-qmp: Move #clock-cells to child
Date: Thu, 29 Nov 2018 14:13:54 -0800
Message-ID: <20181129221357.67417-2-evgreen@chromium.org>
References: <20181129221357.67417-1-evgreen@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181129221357.67417-1-evgreen@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>, Evan Green <evgreen@chromium.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
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
---

 .../devicetree/bindings/phy/qcom-qmp-phy.txt          | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qmp-phy.txt
index f7b532125a4d9..41a1074228ba7 100644
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
@@ -106,6 +102,9 @@ Required properties for child node of PCIe and USB3 qmp phys:
 		- "pcie20_phy0_pipe_clk"	Pipe Clock parent
 			(or)
 		  "pcie20_phy1_pipe_clk"
+ - #clock-cells: must be 0
+    - Phy pll outputs pipe clocks for pipe based PHYs. These clocks are then
+      gate-controlled by the gcc.
 
 Required properties for child node of PHYs with lane reset, AKA:
 	"qcom,msm8996-qmp-pcie-phy"
@@ -118,7 +117,6 @@ Example:
 	phy@34000 {
 		compatible = "qcom,msm8996-qmp-pcie-phy";
 		reg = <0x34000 0x488>;
-		#clock-cells = <1>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges;
@@ -140,6 +138,7 @@ Example:
 			reg = <0x35000 0x130>,
 				<0x35200 0x200>,
 				<0x35400 0x1dc>;
+			#clock-cells = <0>;
 			#phy-cells = <0>;
 
 			clocks = <&gcc GCC_PCIE_0_PIPE_CLK>;
@@ -157,7 +156,6 @@ Example:
 	phy@88eb000 {
 		compatible = "qcom,sdm845-qmp-usb3-uni-phy";
 		reg = <0x88eb000 0x18c>;
-		#clock-cells = <1>;
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges;
@@ -177,6 +175,7 @@ Example:
 			      <0x88eb400 0x1fc>,
 			      <0x88eb800 0x218>,
 			      <0x88eb600 0x70>;
+			#clock-cells = <0>;
 			#phy-cells = <0>;
 			clocks = <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
 			clock-names = "pipe0";
-- 
2.18.1
