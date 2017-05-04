From: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v1 2/2] dt-bindings: phy: Add documentation for Mediatek PCIe PHY
Date: Thu, 4 May 2017 17:31:48 +0800
Message-ID: <1493890308-6159-3-git-send-email-ryder.lee@mediatek.com>
References: <1493890308-6159-1-git-send-email-ryder.lee@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1493890308-6159-1-git-send-email-ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add documentation for PCIe PHY available in MT7623 series SoCs.

Signed-off-by: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 .../devicetree/bindings/phy/phy-mt7623-pcie.txt    | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-mt7623-pcie.txt

diff --git a/Documentation/devicetree/bindings/phy/phy-mt7623-pcie.txt b/Documentation/devicetree/bindings/phy/phy-mt7623-pcie.txt
new file mode 100644
index 0000000..1309500
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/phy-mt7623-pcie.txt
@@ -0,0 +1,63 @@
+Mediatek MT7623 PCIe PHY
+-----------------------
+
+Required properties:
+ - compatible: Should contain "mediatek,mt7623-pcie-phy".
+ - reg: Base address and length of the registers.
+ - clocks: Must contain an entry in clock-names.
+   See ../clocks/clock-bindings.txt for details.
+ - clock-names: Must be "pciephya_ref"
+ - #phy-cells: Must be 0.
+
+Optional properties:
+ - mediatek,phy-switch: A phandle to the system controller, used to
+   switch the PHY on PCIe port2 which is shared with USB u3phy2.
+
+Example:
+
+	pcie0_phy: pcie-phy@1a149000 {
+		compatible = "mediatek,mt7623-pcie-phy";
+		reg = <0 0x1a149000 0 0x1000>;
+		clocks = <&clk26m>;
+		clock-names = "pciephya_ref";
+		#phy-cells = <0>;
+	};
+
+	pcie1_phy: pcie-phy@1a14a000 {
+		compatible = "mediatek,mt7623-pcie-phy";
+		reg = <0 0x1a14a000 0 0x1000>;
+		clocks = <&clk26m>;
+		clock-names = "pciephya_ref";
+		#phy-cells = <0>;
+	};
+
+	pcie2_phy: pcie-phy@1a244000 {
+		compatible = "mediatek,mt7623-pcie-phy";
+		reg = <0 0x1a244000 0 0x1000>;
+		clocks = <&clk26m>;
+		clock-names = "pciephya_ref";
+		#phy-cells = <0>;
+
+		mediatek,phy-switch = <&hifsys>;
+	};
+
+Specifying phy control of devices
+---------------------------------
+
+Device nodes should specify the configuration required in their "phys"
+property, containing a phandle to the phy node and phy-names.
+
+Example:
+
+#include <dt-bindings/phy/phy.h>
+
+pcie: pcie@1a140000 {
+	...
+	pcie@1,0 {
+		...
+		phys = <&pcie0_phy>;
+		phy-names = "pcie-phy0";
+	}
+	...
+};
+
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
