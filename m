From: Christian Lamparter <chunkeey@gmail.com>
Subject: [PATCH v3 2/3] dt-bindings: net: dsa: qca8k: support internal mdio-bus
Date: Tue, 19 Mar 2019 20:54:18 +0100
Message-ID: <20190319195419.12746-2-chunkeey@gmail.com>
References: <20190319195419.12746-1-chunkeey@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190319195419.12746-1-chunkeey@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: netdev@vger.kernel.org, devicetree@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

This patch updates the qca8k's binding to document to the
approach for using the internal mdio-bus of the supported
qca8k switches.

Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
---
 .../devicetree/bindings/net/dsa/qca8k.txt     | 69 +++++++++++++++++--
 1 file changed, 64 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/qca8k.txt b/Documentation/devicetree/bindings/net/dsa/qca8k.txt
index 5eda99e6c86e..93a7469e70d4 100644
--- a/Documentation/devicetree/bindings/net/dsa/qca8k.txt
+++ b/Documentation/devicetree/bindings/net/dsa/qca8k.txt
@@ -12,10 +12,15 @@ Required properties:
 Subnodes:
 
 The integrated switch subnode should be specified according to the binding
-described in dsa/dsa.txt. As the QCA8K switches do not have a N:N mapping of
-port and PHY id, each subnode describing a port needs to have a valid phandle
-referencing the internal PHY connected to it. The CPU port of this switch is
-always port 0.
+described in dsa/dsa.txt. If the QCA8K switch is connect to a SoC's external
+mdio-bus each subnode describing a port needs to have a valid phandle
+referencing the internal PHY it is connected to. This is because there's no
+N:N mapping of port and PHY id.
+
+Don't use mixed external and internal mdio-bus configurations, as this is
+not supported by the hardware.
+
+The CPU port of this switch is always port 0.
 
 A CPU port node has the following optional node:
 
@@ -31,8 +36,9 @@ For QCA8K the 'fixed-link' sub-node supports only the following properties:
 - 'full-duplex' (boolean, optional), to indicate that full duplex is
   used. When absent, half duplex is assumed.
 
-Example:
+Examples:
 
+for the external mdio-bus configuration:
 
 	&mdio0 {
 		phy_port1: phy@0 {
@@ -108,3 +114,56 @@ Example:
 			};
 		};
 	};
+
+for the internal master mdio-bus configuration:
+
+	&mdio0 {
+		switch@10 {
+			compatible = "qca,qca8337";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			reg = <0x10>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					label = "cpu";
+					ethernet = <&gmac1>;
+					phy-mode = "rgmii";
+					fixed-link {
+						speed = 1000;
+						full-duplex;
+					};
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
+					label = "lan4";
+				};
+
+				port@5 {
+					reg = <5>;
+					label = "wan";
+				};
+			};
+		};
+	};
-- 
2.20.1
