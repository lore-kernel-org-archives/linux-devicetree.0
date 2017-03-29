From: <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH net-next v3 1/5] dt-bindings: net: dsa: add Mediatek MT7530 binding
Date: Wed, 29 Mar 2017 17:28:41 +0800
Message-ID: <1490779725-18304-2-git-send-email-sean.wang@mediatek.com>
References: <1490779725-18304-1-git-send-email-sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1490779725-18304-1-git-send-email-sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Add device-tree binding for Mediatek MT7530 switch.

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/net/dsa/mt7530.txt         | 92 ++++++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/dsa/mt7530.txt

diff --git a/Documentation/devicetree/bindings/net/dsa/mt7530.txt b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
new file mode 100644
index 0000000..a9bc27b
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
@@ -0,0 +1,92 @@
+Mediatek MT7530 Ethernet switch
+================================
+
+Required properties:
+
+- compatible: Must be compatible = "mediatek,mt7530";
+- #address-cells: Must be 1.
+- #size-cells: Must be 0.
+- mediatek,mcm: Boolean; if defined, indicates that either MT7530 is the part
+	on multi-chip module belong to MT7623A has or the remotely standalone
+	chip as the function MT7623N reference board provided for.
+- core-supply: Phandle to the regulator node necessary for the core power.
+- io-supply: Phandle to the regulator node necessary for the I/O power.
+	See Documentation/devicetree/bindings/regulator/mt6323-regulator.txt
+	for details for the regulator setup on these boards.
+
+If the property mediatek,mcm isn't defined, following property is required
+
+- reset-gpios: Should be a gpio specifier for a reset line.
+
+Else, following properties are required
+
+- resets : Phandle pointing to the system reset controller with
+	line index for the ethsys.
+- reset-names : Should be set to "mcm".
+
+Required properties for the child nodes within ports container:
+
+- reg: Port address described must be 6 for CPU port and from 0 to 5 for
+	user ports.
+- phy-mode: String, must be either "trgmii" or "rgmii" for port labeled
+	 "cpu".
+
+See Documentation/devicetree/bindings/dsa/dsa.txt for a list of additional
+required, optional properties and how the integrated switch subnodes must
+be specified.
+
+Example:
+
+	&mdio0 {
+		switch@0 {
+			compatible = "mediatek,mt7530";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+
+			core-supply = <&mt6323_vpa_reg>;
+			io-supply = <&mt6323_vemc3v3_reg>;
+			reset-gpios = <&pio 33 0>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reg = <0>;
+				port@0 {
+					reg = <0>;
+					label = "lan0";
+				};
+
+				port@1 {
+					reg = <1>;
+					label = "lan1";
+				};
+
+				port@2 {
+					reg = <2>;
+					label = "lan2";
+				};
+
+				port@3 {
+					reg = <3>;
+					label = "lan3";
+				};
+
+				port@4 {
+					reg = <4>;
+					label = "wan";
+				};
+
+				port@6 {
+					reg = <6>;
+					label = "cpu";
+					ethernet = <&gmac0>;
+					phy-mode = "trgmii";
+					fixed-link {
+						speed = <1000>;
+						full-duplex;
+					};
+				};
+			};
+		};
+	};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
