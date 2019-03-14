From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [PATCH net-next 1/3] dt-bindings: net: phy: add g12a mdio mux documentation
Date: Thu, 14 Mar 2019 15:01:33 +0100
Message-ID: <20190314140135.19184-2-jbrunet@baylibre.com>
References: <20190314140135.19184-1-jbrunet@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190314140135.19184-1-jbrunet@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller" <davem@davemloft.net>, Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, netdev@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add documentation for the device tree bindings of the MDIO mux of Amlogic
g12a SoC family

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/net/mdio-mux-meson-g12a.txt      | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/mdio-mux-meson-g12a.txt

diff --git a/Documentation/devicetree/bindings/net/mdio-mux-meson-g12a.txt b/Documentation/devicetree/bindings/net/mdio-mux-meson-g12a.txt
new file mode 100644
index 000000000000..e738bba6a9de
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/mdio-mux-meson-g12a.txt
@@ -0,0 +1,48 @@
+Properties for the MDIO bus multiplexer/glue of Amlogic G12a SoC family.
+
+This is a special case of a MDIO bus multiplexer. It allows to choose between
+the internal mdio bus leading to the embedded 10/100 PHY or the external
+MDIO bus.
+
+Required properties in addition to the generic multiplexer properties:
+- compatible : amlogic,g12a-mdio-mux
+- reg: physical address and length of the multiplexer/glue registers
+- clocks: list of clock phandle, one for each entry clock-names.
+- clock-names: should contain the following:
+  * "pclk"   : peripheral clock.
+  * "clkin0" : platform crytal
+  * "clkin1" : SoC 50MHz MPLL
+
+Example :
+
+mdio-mux: mdio-multiplexer@4c000 {
+	compatible = "amlogic,g12a-mdio-mux";
+	reg = <0x0 0x4c000 0x0 0xa4>;
+	clocks = <&clkc CLKID_ETH_PHY>,
+		 <&xtal>,
+		 <&clkc CLKID_MPLL_5OM>;
+	clock-names = "pclk", "clkin0", "clkin1";
+	mdio-parent-bus = <&mdio0>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	ext_mdio: mdio@0 {
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+
+	int_mdio: mdio@1 {
+		reg = <1>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		internal_ephy: ethernet_phy@8 {
+			compatible = "ethernet-phy-id0180.3301",
+				     "ethernet-phy-ieee802.3-c22";
+			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+			reg = <8>;
+			max-speed = <100>;
+		};
+	};
+};
-- 
2.20.1
