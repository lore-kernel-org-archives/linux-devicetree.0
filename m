From: Quentin Schulz <quentin.schulz@bootlin.com>
Subject: [PATCH 07/10] dt-bindings: phy: add DT binding for Microsemi Ocelot SerDes muxing
Date: Mon, 30 Jul 2018 14:43:52 +0200
Message-ID: <cd75c96640cc7fe306ee355acb1db85adb5b796f.1532954208.git-series.quentin.schulz@bootlin.com>
References: <cover.aa759035f6eefdd0bb2a5ae335dab5bd5399bd46.1532954208.git-series.quentin.schulz@bootlin.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.aa759035f6eefdd0bb2a5ae335dab5bd5399bd46.1532954208.git-series.quentin.schulz@bootlin.com>
In-Reply-To: <cover.aa759035f6eefdd0bb2a5ae335dab5bd5399bd46.1532954208.git-series.quentin.schulz@bootlin.com>
References: <cover.aa759035f6eefdd0bb2a5ae335dab5bd5399bd46.1532954208.git-series.quentin.schulz@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: alexandre.belloni@bootlin.com, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, davem@davemloft.net
Cc: kishon@ti.com, andrew@lunn.ch, f.fainelli@gmail.com, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, allan.nielsen@microsemi.com, thomas.petazzoni@bootlin.com, Quentin Schulz <quentin.schulz@bootlin.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Quentin Schulz <quentin.schulz@bootlin.com>
---
 Documentation/devicetree/bindings/phy/phy-ocelot-serdes.txt | 42 +++++++-
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-ocelot-serdes.txt

diff --git a/Documentation/devicetree/bindings/phy/phy-ocelot-serdes.txt b/Documentation/devicetree/bindings/phy/phy-ocelot-serdes.txt
new file mode 100644
index 0000000..25b102d
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/phy-ocelot-serdes.txt
@@ -0,0 +1,42 @@
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
+Required properties:
+
+- compatible: should be "mscc,vsc7514-serdes"
+- #phy-cells : from the generic phy bindings, must be 3. The first number
+               defines the kind of Serdes (1 for SERDES1G_X, 6 for
+	       SERDES6G_X), the second defines the macros in the specified
+	       kind of Serdes (X for SERDES1G_X or SERDES6G_X) and the
+	       last one defines the input port to use for a given SerDes
+	       macro,
+
+Example:
+
+	serdes: serdes {
+		compatible = "mscc,vsc7514-serdes";
+		#phy-cells = <3>;
+	};
+
+	ethernet {
+		port1 {
+			phy-handle = <&phy_foo>;
+			/* Link SERDES1G_5 to port1 */
+			phys = <&serdes 1 5 1>;
+		};
+	};
-- 
git-series 0.9.1
