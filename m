From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Subject: [PATCH v2] dt-bindings: net: dsa: ksz9477: fix indentation for switch spi bindings
Date: Sun, 13 Jan 2019 09:56:48 +0100
Message-ID: <20190113085648.26091-1-sergio.paracuellos@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Woojung.Huh@microchip.com
Cc: UNGLinuxDriver@microchip.com, andrew@lunn.ch, vivien.didelot@gmail.com, f.fainelli@gmail.com, robh+dt@kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Switch bindings for spi managed mode are using spaces instead of tabs.
Fix them to get a file with a proper kernel indentation style.

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
Changes in v2:
    - Rebase onto net-next
    - Collect previous Reviewed-by tags

 .../devicetree/bindings/net/dsa/ksz.txt       | 102 +++++++++---------
 1 file changed, 51 insertions(+), 51 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/ksz.txt b/Documentation/devicetree/bindings/net/dsa/ksz.txt
index 0f407fb371ce..8d58c2a7de39 100644
--- a/Documentation/devicetree/bindings/net/dsa/ksz.txt
+++ b/Documentation/devicetree/bindings/net/dsa/ksz.txt
@@ -19,58 +19,58 @@ Examples:
 
 Ethernet switch connected via SPI to the host, CPU port wired to eth0:
 
-                             eth0: ethernet@10001000 {
-                                             fixed-link {
-                                                             speed = <1000>;
-                                                             full-duplex;
-                                             };
-                             };
+	eth0: ethernet@10001000 {
+		fixed-link {
+			speed = <1000>;
+			full-duplex;
+		};
+	};
 
-                             spi1: spi@f8008000 {
-                                             pinctrl-0 = <&pinctrl_spi_ksz>;
-                                             cs-gpios = <&pioC 25 0>;
-                                             id = <1>;
+	spi1: spi@f8008000 {
+		pinctrl-0 = <&pinctrl_spi_ksz>;
+		cs-gpios = <&pioC 25 0>;
+		id = <1>;
 
-                                             ksz9477: ksz9477@0 {
-                                                             compatible = "microchip,ksz9477";
-                                                             reg = <0>;
+		ksz9477: ksz9477@0 {
+			compatible = "microchip,ksz9477";
+			reg = <0>;
 
-                                                             spi-max-frequency = <44000000>;
-                                                             spi-cpha;
-                                                             spi-cpol;
+			spi-max-frequency = <44000000>;
+			spi-cpha;
+			spi-cpol;
 
-                                                             ports {
-                                                                             #address-cells = <1>;
-                                                                             #size-cells = <0>;
-                                                                             port@0 {
-                                                                                             reg = <0>;
-                                                                                             label = "lan1";
-                                                                             };
-                                                                             port@1 {
-                                                                                             reg = <1>;
-                                                                                             label = "lan2";
-                                                                             };
-                                                                             port@2 {
-                                                                                             reg = <2>;
-                                                                                             label = "lan3";
-                                                                             };
-                                                                             port@3 {
-                                                                                             reg = <3>;
-                                                                                             label = "lan4";
-                                                                             };
-                                                                             port@4 {
-                                                                                             reg = <4>;
-                                                                                             label = "lan5";
-                                                                             };
-                                                                             port@5 {
-                                                                                             reg = <5>;
-                                                                                             label = "cpu";
-                                                                                             ethernet = <&eth0>;
-                                                                                             fixed-link {
-                                                                                                             speed = <1000>;
-                                                                                                             full-duplex;
-                                                                                             };
-                                                                             };
-                                                             };
-                                             };
-                             };
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
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
+				port@5 {
+					reg = <5>;
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
