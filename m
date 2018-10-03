From: Alan Douglas <adouglas@cadence.com>
Subject: [PATCH 1/2] dt-bindings: phy: Document cadence Sierra PHY bindings
Date: Wed, 3 Oct 2018 17:02:25 +0100
Message-ID: <1538582545-22041-1-git-send-email-adouglas@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: kishon@ti.com, linux-kernel@vger.kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, devicetree@vger.kernel.org
Cc: Alan Douglas <adouglas@cadence.com>
List-Id: devicetree@vger.kernel.org

Add DT binding documentation for Sierra PHY.  The PHY supports
a number of different protocols, including PCIe and USB.

The PHY lanes may be configured as single or multi-lane links.
Each link is treated as a separate sub-node.  For example, if
there are 4 lanes in total the first 2 might be configured as
a multi-lane PCIe link while the other two are single lane
USB links, and in this case there would be 3 sub-nodes.

There are two resets for the PHY block (one for APB register
access, one for the PHY link) and separate resets for each
link.  For multi-lane links, the reset corresponds to the
reset line on the master lane, the resets on other lanes
have no effect.

Signed-off-by: Alan Douglas <adouglas@cadence.com>
---
 .../devicetree/bindings/phy/cdns-sierra-phy.txt    | 68 ++++++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/cdns-sierra-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/cdns-sierra-phy.txt b/Documentation/devicetree/bindings/phy/cdns-sierra-phy.txt
new file mode 100644
index 0000000..0e2f3e3
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/cdns-sierra-phy.txt
@@ -0,0 +1,68 @@
+Cadence Sierra PHY
+-----------------------
+
+Required properties:
+- compatible:	cdns,sierra-phy-t0
+- clocks:	Must contain an entry in clock-names.
+		See ../clocks/clock-bindings.txt for details.
+- clock-names:	Must be "phy_clk"
+- resets:	Must contain an entry for each in reset-names.
+		See ../reset/reset.txt for details.
+- reset-names:	Must include "sierra_reset" and "sierra_apb" and one for each
+		sub-node.
+		"sierra_reset" must control the reset line to the PHY.
+		"sierra_apb" must control the reset line to the APB PHY
+		interface.
+		The name of the reset for each sub-node should match the full
+		name of the sub-node.  The sub-node resets must control the
+		reset line for the master lane of the sub-node.
+- reg:		register range for the PHY.
+- #address-cells: Must be 1
+- #size-cells:	Must be 0
+
+Optional properties:
+- cdns,autoconf:	A boolean property whose presence indicates that the
+			PHY registers will be configured by hardware. If not
+			present, all sub-node optional properties must be
+			provided.
+
+Sub-nodes:
+  Each group of PHY lanes with a single master lane should be represented as
+  a sub-node. Note that the actual configuration of each lane is determined by
+  hardware strapping, and must match the configuration specified here.
+
+Sub-node required properties:
+- #phy-cells:	Generic PHY binding; must be 0.
+
+Sub-node optional properties:
+- reg:			The master lane number.  This is the lowest numbered
+			lane in the lane group.
+- cdns,num-lanes:	Number of lanes in this group.  From 1 to 4.  The
+			group is made up of consecutive lanes.
+- cdns,phy-type:	Can be PHY_TYPE_PCIE or PHY_TYPE_USB3, depending on
+			configuration of lanes.
+
+Example:
+	pcie_phy4: pcie-phy@fd240000 {
+		compatible = "cdns,sierra-phy-t0";
+		reg = <0x0 0xfd240000 0x0 0x40000>;
+		resets = <&phyrst 0>, <&phyrst 1>, <&phyrst 2>, <&phyrst 4>;
+		reset-names = "sierra_reset", "sierra_apb",
+				"pcie_phy@0", "pcie_phy@2";
+		clocks = <&phyclock>;
+		clock-names = "phy_clk";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		pcie0_phy0: pcie-phy@0 {
+				reg = <0>;
+				cdns,num-lanes = <2>;
+				#phy-cells = <0>;
+				cdns,phy-type = <PHY_TYPE_PCIE>;
+		};
+		pcie0_phy1: pcie-phy@2 {
+				reg = <2>;
+				cdns,num-lanes = <1>;
+				#phy-cells = <0>;
+				cdns,phy-type = <PHY_TYPE_PCIE>;
+		};
+
-- 
1.9.0
