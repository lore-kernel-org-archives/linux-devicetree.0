From: Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH v4 1/2] Documentation: bindings: add dt documentation for Rockchip PCIe PHY
Date: Fri, 29 Jul 2016 09:22:05 +0800
Message-ID: <1469755326-10263-1-git-send-email-shawn.lin@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, Heiko Stuebner <heiko@sntech.de>, Doug Anderson <dianders@chromium.org>, Brian Norris <briannorris@chromium.org>, Wenrui Li <wenrui.li@rock-chips.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>
List-Id: devicetree@vger.kernel.org

This patch adds a binding that describes the Rockchip PCIe PHY
found on Rockchip SoCs PCIe interface.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

---

Changes in v4: None
Changes in v3:
- rename the node to pcie_phy: pcie-phy suggested by Doug

Changes in v2:
- add clk and reset description
- remove unit-address

 .../devicetree/bindings/phy/rockchip-pcie-phy.txt  | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/rockchip-pcie-phy.txt

diff --git a/Documentation/devicetree/bindings/phy/rockchip-pcie-phy.txt b/Documentation/devicetree/bindings/phy/rockchip-pcie-phy.txt
new file mode 100644
index 0000000..aedca29
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/rockchip-pcie-phy.txt
@@ -0,0 +1,32 @@
+Rockchip PCIE PHY
+-----------------------
+
+Required properties:
+ - compatible: rockchip,rk3399-pcie-phy
+ - #phy-cells: must be 0
+ - clocks: Must contain an entry in clock-names.
+	See ../clocks/clock-bindings.txt for details.
+ - clock-names: Must be "refclk"
+ - resets: Must contain an entry in reset-names.
+	See ../reset/reset.txt for details.
+ - reset-names: Must be "phy"
+
+Example:
+
+grf: syscon@ff770000 {
+	compatible = "rockchip,rk3399-grf", "syscon", "simple-mfd";
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	...
+
+	pcie_phy: pcie-phy {
+		compatible = "rockchip,rk3399-pcie-phy";
+		#phy-cells = <0>;
+		clocks = <&cru SCLK_PCIEPHY_REF>;
+		clock-names = "refclk";
+		resets = <&cru SRST_PCIEPHY>;
+		reset-names = "phy";
+	};
+};
+
-- 
2.3.7
