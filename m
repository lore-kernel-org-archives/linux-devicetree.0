From: Claudiu Manoil <claudiu.manoil@nxp.com>
Subject: [PATCH net-next 5/6] dt-bindings: net: Add DT bindings for Microsemi Felix Switch
Date: Fri, 21 Jun 2019 18:38:51 +0300
Message-ID: <1561131532-14860-6-git-send-email-claudiu.manoil@nxp.com>
References: <1561131532-14860-1-git-send-email-claudiu.manoil@nxp.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1561131532-14860-1-git-send-email-claudiu.manoil@nxp.com>
Sender: netdev-owner@vger.kernel.org
To: "David S . Miller" <davem@davemloft.net>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, Allan Nielsen <Allan.Nielsen@microsemi.com>, alexandru.marginean@nxp.com, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com
List-Id: devicetree@vger.kernel.org

DT bindings for the Felix ethernet switch, consisting of the
VSC9959 switch core integrated as a PCIe endpoint device.

Signed-off-by: Claudiu Manoil <claudiu.manoil@nxp.com>
---
 .../devicetree/bindings/net/mscc-felix.txt    | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/mscc-felix.txt

diff --git a/Documentation/devicetree/bindings/net/mscc-felix.txt b/Documentation/devicetree/bindings/net/mscc-felix.txt
new file mode 100644
index 000000000000..c91c63ba524c
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/mscc-felix.txt
@@ -0,0 +1,77 @@
+Microsemi Felix network Switch
+==============================
+
+The Felix switch device is the Microsemi VSC9959 gigabit ethernet
+switch core integrated as a PCIe endpoint device.
+
+Required properties:
+- compatible	: Should be "mscc,felix-switch"
+- reg		: Specifies PCIe Device Number and Function
+		  Number of the integrated endpoint device,
+		  according to parent node bindings.
+- ethernet-ports: A container of child nodes representing
+		  switch ports.
+
+"ethernet-ports" container has the following required properties:
+- #address-cells: Must be 1
+- #size-cells	: Must be 0
+
+A list of child nodes representing switch ports is expected.
+Each child port node must have the following mandatory property:
+- reg		: port id (address) in the switch (0..N-1)
+
+Port nodes may also contain the following optional standardised
+properties, described in corresponding binding documents:
+
+- phy-handle	: Phandle to a PHY on a MDIO bus. See
+		  Documentation/devicetree/bindings/net/ethernet.txt
+
+or,
+- fixed-link	: "fixed-link" node, for internal ports or external
+		  fixed-link connections. See
+		  Documentation/devicetree/bindings/net/fixed-link.txt
+
+Example:
+
+	switch@0,5 {
+		compatible = "mscc,felix-switch"
+		reg = <0x000500 0 0 0 0>;
+
+		ethernet-ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/* external ports */
+			switch_port0: port@0 {
+				reg = <0>;
+				phy-handle = <&phy0>;
+			};
+			switch_port1: port@1 {
+				reg = <1>;
+				phy-handle = <&phy1>;
+			};
+			switch_port2: port@2 {
+				reg = <2>;
+				phy-handle = <&phy2>;
+			};
+			switch_port3: port@3 {
+				reg = <3>;
+				phy-handle = <&phy3>;
+			};
+			/* internal to-cpu ports */
+			port@4 {
+				reg = <4>;
+				fixed-link {
+					speed = <1000>;
+					full-duplex;
+				};
+			};
+			port@5 {
+				reg = <5>;
+				fixed-link {
+					speed = <1000>;
+					full-duplex;
+				};
+			};
+		};
+	};
-- 
2.17.1
