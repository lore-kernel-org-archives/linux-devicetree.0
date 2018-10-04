From: Quentin Schulz <quentin.schulz@bootlin.com>
Subject: [PATCH net-next v4 07/11] dt-bindings: phy: add DT binding for Microsemi Ocelot SerDes muxing
Date: Thu,  4 Oct 2018 14:22:04 +0200
Message-ID: <20181004122208.32272-8-quentin.schulz@bootlin.com>
References: <20181004122208.32272-1-quentin.schulz@bootlin.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181004122208.32272-1-quentin.schulz@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: alexandre.belloni@bootlin.com, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, davem@davemloft.net, kishon@ti.com, andrew@lunn.ch, f.fainelli@gmail.com
Cc: allan.nielsen@microchip.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, thomas.petazzoni@bootlin.com, Quentin Schulz <quentin.schulz@bootlin.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
---
 .../bindings/phy/phy-ocelot-serdes.txt        | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-ocelot-serdes.txt

diff --git a/Documentation/devicetree/bindings/phy/phy-ocelot-serdes.txt b/Documentation/devicetree/bindings/phy/phy-ocelot-serdes.txt
new file mode 100644
index 000000000000..332219860187
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/phy-ocelot-serdes.txt
@@ -0,0 +1,43 @@
+Microsemi Ocelot SerDes muxing driver
+-------------------------------------
+
+On Microsemi Ocelot, there is a handful of registers in HSIO address
+space for setting up the SerDes to switch port muxing.
+
+A SerDes X can be "muxed" to work with switch port Y or Z for example.
+One specific SerDes can also be used as a PCIe interface.
+
+Hence, a SerDes represents an interface, be it an Ethernet or a PCIe one.
+
+There are two kinds of SerDes: SERDES1G supports 10/100Mbps in
+half/full-duplex and 1000Mbps in full-duplex mode while SERDES6G supports
+10/100Mbps in half/full-duplex and 1000/2500Mbps in full-duplex mode.
+
+Also, SERDES6G number (aka "macro") 0 is the only interface supporting
+QSGMII.
+
+This is a child of the HSIO syscon ("mscc,ocelot-hsio", see
+Documentation/devicetree/bindings/mips/mscc.txt) on the Microsemi Ocelot.
+
+Required properties:
+
+- compatible: should be "mscc,vsc7514-serdes"
+- #phy-cells : from the generic phy bindings, must be 2.
+	       The first number defines the input port to use for a given
+	       SerDes macro. The second defines the macro to use. They are
+	       defined in dt-bindings/phy/phy-ocelot-serdes.h
+
+Example:
+
+	serdes: serdes {
+		compatible = "mscc,vsc7514-serdes";
+		#phy-cells = <2>;
+	};
+
+	ethernet {
+		port1 {
+			phy-handle = <&phy_foo>;
+			/* Link SERDES1G_5 to port1 */
+			phys = <&serdes 1 SERDES1G_5>;
+		};
+	};
-- 
2.17.1
