From: Claudiu Manoil <claudiu.manoil@nxp.com>
Subject: [PATCH net-next v4 4/4] dt-bindings: net: freescale: enetc: Add connection bindings for ENETC ethernet nodes
Date: Tue, 26 Feb 2019 15:42:23 +0200
Message-ID: <1551188543-28867-5-git-send-email-claudiu.manoil@nxp.com>
References: <1551188543-28867-1-git-send-email-claudiu.manoil@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551188543-28867-1-git-send-email-claudiu.manoil@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, "David S . Miller" <davem@davemloft.net>
Cc: alexandru.marginean@nxp.com, Andrew Lunn <andrew@lunn.ch>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Define connection bindings (external PHY connections and internal links)
for the ENETC on-chip ethernet controllers.

Signed-off-by: Claudiu Manoil <claudiu.manoil@nxp.com>
---
v3 - added this patch to the set
v4 - documented strictly the enetc node bindings, changed node type
     from "pci" to "ethernet" and added compatible string (Rob H.)

 .../devicetree/bindings/net/fsl-enetc.txt          | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/fsl-enetc.txt

diff --git a/Documentation/devicetree/bindings/net/fsl-enetc.txt b/Documentation/devicetree/bindings/net/fsl-enetc.txt
new file mode 100644
index 0000000..c812e25
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/fsl-enetc.txt
@@ -0,0 +1,69 @@
+* ENETC ethernet device tree bindings
+
+Depending on board design and ENETC port type (internal or
+external) there are two supported link modes specified by
+below device tree bindings.
+
+Required properties:
+
+- reg		: Specifies PCIe Device Number and Function
+		  Number of the ENETC endpoint device, according
+		  to parent node bindings.
+- compatible	: Should be "fsl,enetc".
+
+1) The ENETC external port is connected to a MDIO configurable phy:
+
+In this case, the ENETC node should include a "mdio" sub-node
+that in turn should contain the "ethernet-phy" node describing the
+external phy.  Below properties are required, their bindings
+already defined in ethernet.txt or phy.txt, under
+Documentation/devicetree/bindings/net/*.
+
+Required:
+
+- phy-handle		: Phandle to a PHY on the MDIO bus.
+			  Defined in ethernet.txt.
+
+- phy-connection-type	: Defined in ethernet.txt.
+
+- mdio			: "mdio" node, defined in mdio.txt.
+
+- ethernet-phy		: "ethernet-phy" node, defined in phy.txt.
+
+Example:
+
+	ethernet@0,0 {
+		compatible = "fsl,enetc";
+		reg = <0x000000 0 0 0 0>;
+		phy-handle = <&sgmii_phy0>;
+		phy-connection-type = "sgmii";
+
+		mdio {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			sgmii_phy0: ethernet-phy@2 {
+				reg = <0x2>;
+			};
+		};
+	};
+
+2) The ENETC port is an internal port or has a fixed-link external
+connection:
+
+In this case, the ENETC port node defines a fixed link connection,
+as specified by "fixed-link.txt", under
+Documentation/devicetree/bindings/net/*.
+
+Required:
+
+- fixed-link	: "fixed-link" node, defined in "fixed-link.txt".
+
+Example:
+	ethernet@0,2 {
+		compatible = "fsl,enetc";
+		reg = <0x000200 0 0 0 0>;
+		fixed-link {
+			speed = <1000>;
+			full-duplex;
+		};
+	};
-- 
2.7.4
