From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH v5 1/5] dt-bindings: Add usb3.0 phy binding for MT65xx SoCs
Date: Fri, 7 Aug 2015 20:30:40 +0800
Message-ID: <1438950644-27290-2-git-send-email-chunfeng.yun@mediatek.com>
References: <1438950644-27290-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438950644-27290-1-git-send-email-chunfeng.yun@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Felipe Balbi <balbi@ti.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org, John Crispin <blogic@openwrt.org>, Daniel Kurtz <djkurtz@chromium.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Kishon Vijay Abraham I <kishon@ti.com>
List-Id: devicetree@vger.kernel.org

add a DT binding documentation of usb3.0 phy for MT65xx
SoCs from Mediatek.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 .../devicetree/bindings/phy/phy-mt65xx-usb.txt     | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-mt65xx-usb.txt

diff --git a/Documentation/devicetree/bindings/phy/phy-mt65xx-usb.txt b/Documentation/devicetree/bindings/phy/phy-mt65xx-usb.txt
new file mode 100644
index 0000000..5812d20
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/phy-mt65xx-usb.txt
@@ -0,0 +1,69 @@
+mt65xx USB3.0 PHY binding
+--------------------------
+
+This binding describes a usb3.0 phy for mt65xx platforms of Medaitek SoC.
+
+Required properties (controller (parent) node):
+ - compatible	: should be "mediatek,mt8173-u3phy"
+ - reg		: offset and length of register for phy, exclude port's
+		  register.
+ - clocks	: a list of phandle + clock-specifier pairs, one for each
+		  entry in clock-names
+ - clock-names	: must contain
+		  "u3phya_ref": for reference clock of usb3.0 analog phy.
+
+Required nodes	: a sub-node is required for each port the controller
+		  provides. Address range information including the usual
+		  'reg' property is used inside these nodes to describe
+		  the controller's topology. These nodes are translated
+		  by the driver's .xlate() function.
+
+Required properties (port (child) node):
+- reg		: address and length of the register set for the port.
+- #phy-cells	: should be 1 (See second example)
+		  cell after port phandle is phy type from:
+			- PHY_TYPE_USB2
+			- PHY_TYPE_USB3
+
+Example:
+
+u3phy: usb-phy@11290000 {
+	compatible = "mediatek,mt8173-u3phy";
+	reg = <0 0x11290000 0 0x800>;
+	clocks = <&apmixedsys CLK_APMIXED_REF2USB_TX>;
+	clock-names = "u3phya_ref";
+	#address-cells = <2>;
+	#size-cells = <2>;
+	ranges;
+	status = "okay";
+
+	phy_port0: port@11290800 {
+		reg = <0 0x11290800 0 0x800>;
+		#phy-cells = <1>;
+		status = "okay";
+	};
+
+	phy_port1: port@11291000 {
+		reg = <0 0x11291000 0 0x800>;
+		#phy-cells = <1>;
+		status = "okay";
+	};
+};
+
+Specifying phy control of devices
+---------------------------------
+
+Device nodes should specify the configuration required in their "phys"
+property, containing a phandle to the phy port node and a device type;
+phy-names for each port are optional.
+
+Example:
+
+#include <dt-bindings/phy/phy.h>
+
+usb30: usb@11270000 {
+	...
+	phys = <&phy_port0 PHY_TYPE_USB3>;
+	phy-names = "usb3-0";
+	...
+};
-- 
1.8.1.1.dirty
