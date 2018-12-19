From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Subject: [PATCH v4] dt-bindings: net: dsa: ksz9477: add sample of switch bindings managed in i2c mode
Date: Wed, 19 Dec 2018 20:46:26 +0100
Message-ID: <20181219194626.25732-1-sergio.paracuellos@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: Woojung.Huh@microchip.com
Cc: UNGLinuxDriver@microchip.com, andrew@lunn.ch, vivien.didelot@savoirfairelinux.com, f.fainelli@gmail.com, driverdev-devel@linuxdriverproject.org, davem@davemloft.net, netdev@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add device-tree binding example of the ksz9477 switch managed in i2c mode.

Cc: devicetree@vger.kernel.org
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
Changes v4:
    - Use one tab formatting properly the binding sample.

Changes v3:
    - No changes. Just resent patches together.

Changes v2:
    - Use generic name for label of the switch and make sure reg and @X
      have the same value.
 .../devicetree/bindings/net/dsa/ksz.txt       | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/ksz.txt b/Documentation/devicetree/bindings/net/dsa/ksz.txt
index 0f407fb371ce..2f276aa42f0b 100644
--- a/Documentation/devicetree/bindings/net/dsa/ksz.txt
+++ b/Documentation/devicetree/bindings/net/dsa/ksz.txt
@@ -74,3 +74,54 @@ Ethernet switch connected via SPI to the host, CPU port wired to eth0:
                                                              };
                                              };
                              };
+
+Ethernet switch connected via I2C to the host, CPU port wired to eth0:
+
+	eth0: ethernet@10001000 {
+		fixed-link {
+			speed = <1000>;
+			full-duplex;
+		};
+	};
+
+	i2c0: i2c@f8008000 {
+		switch: ksz9897@5f {
+			compatible = "microchip,ksz9897";
+			reg = <5f>;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					label = "lan1";
+				};
+				port@1 {
+					reg = <1>;
+					label = "lan2";
+				};
+				port@2 {
+					reg = <2>;
+					label = "lan3";
+				};
+				port@3 {
+					reg = <3>;
+					label = "lan4";
+				};
+				port@4 {
+					reg = <4>;
+					label = "lan5";
+				};
+				port@6 {
+					reg = <6>;
+					label = "cpu";
+					ethernet = <&eth0>;
+					fixed-link {
+						speed = <1000>;
+						full-duplex;
+					};
+				};
+			};
+		};
+	};
-- 
2.19.1
