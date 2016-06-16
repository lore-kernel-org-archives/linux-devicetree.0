From: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [PATCH v3 1/2] Documentation: bindings: add dt documentation for Rockchip PCIe PHY
Date: Thu, 16 Jun 2016 09:22:46 +0800
Message-ID: <1466040166-30926-1-git-send-email-shawn.lin@rock-chips.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Wenrui Li <wenrui.li-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds a binding that describes the Rockchip PCIe PHY
found on Rockchip SoCs PCIe interface.

Signed-off-by: Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>

---

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


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
