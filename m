From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH net-next v2 1/7] dt-bindings: net: add DT bindings for Microsemi MIIM
Date: Thu, 26 Apr 2018 21:59:25 +0200
Message-ID: <20180426195931.5393-2-alexandre.belloni@bootlin.com>
References: <20180426195931.5393-1-alexandre.belloni@bootlin.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180426195931.5393-1-alexandre.belloni@bootlin.com>
Sender: netdev-owner@vger.kernel.org
To: "David S . Miller" <davem@davemloft.net>
Cc: Allan Nielsen <Allan.Nielsen@microsemi.com>, razvan.stefanescu@nxp.com, po.liu@nxp.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

DT bindings for the Microsemi MII Management Controller found on Microsemi
SoCs

Cc: Rob Herring <robh+dt@kernel.org>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 .../devicetree/bindings/net/mscc-miim.txt     | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/mscc-miim.txt

diff --git a/Documentation/devicetree/bindings/net/mscc-miim.txt b/Documentation/devicetree/bindings/net/mscc-miim.txt
new file mode 100644
index 000000000000..7104679cf59d
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/mscc-miim.txt
@@ -0,0 +1,26 @@
+Microsemi MII Management Controller (MIIM) / MDIO
+=================================================
+
+Properties:
+- compatible: must be "mscc,ocelot-miim"
+- reg: The base address of the MDIO bus controller register bank. Optionally, a
+  second register bank can be defined if there is an associated reset register
+  for internal PHYs
+- #address-cells: Must be <1>.
+- #size-cells: Must be <0>.  MDIO addresses have no size component.
+- interrupts: interrupt specifier (refer to the interrupt binding)
+
+Typically an MDIO bus might have several children.
+
+Example:
+	mdio@107009c {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		compatible = "mscc,ocelot-miim";
+		reg = <0x107009c 0x36>, <0x10700f0 0x8>;
+		interrupts = <14>;
+
+		phy0: ethernet-phy@0 {
+			reg = <0>;
+		};
+	};
-- 
2.17.0
