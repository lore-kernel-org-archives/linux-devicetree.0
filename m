From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Subject: [PATCH] dt-bindings: net: dsa: ksz9477: fix indentation for switch
 spi bindings
Date: Sat, 22 Dec 2018 08:39:09 +0100
Message-ID: <20181222073909.23900-1-sergio.paracuellos@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Woojung.Huh@microchip.com
Cc: andrew@lunn.ch, f.fainelli@gmail.com, vivien.didelot@savoirfairelinux.com, netdev@vger.kernel.org, driverdev-devel@linuxdriverproject.org, UNGLinuxDriver@microchip.com, devicetree@vger.kernel.org, davem@davemloft.net
List-Id: devicetree@vger.kernel.org

Switch bindings for spi managed mode are using spaces instead of tabs.
Fix them to get a file with a proper kernel indentation style.

Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 .../devicetree/bindings/net/dsa/ksz.txt       | 110 +++++++++---------
 1 file changed, 55 insertions(+), 55 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/ksz.txt b/Documentation/devicetree/bindings/net/dsa/ksz.txt
index 2f276aa42f0b..e8d33d008355 100644
--- a/Documentation/devicetree/bindings/net/dsa/ksz.txt
+++ b/Documentation/devicetree/bindings/net/dsa/ksz.txt
@@ -19,61 +19,61 @@ Examples:
 
 Ethernet switch connected via SPI to the host, CPU port wired to eth0:
 
-                             eth0: ethernet@10001000 {
-                                             fixed-link {
-                                                             speed = <1000>;
-                                                             full-duplex;
-                                             };
-                             };
-
-                             spi1: spi@f8008000 {
-                                             pinctrl-0 = <&pinctrl_spi_ksz>;
-                                             cs-gpios = <&pioC 25 0>;
-                                             id = <1>;
-
-                                             ksz9477: ksz9477@0 {
-                                                             compatible = "microchip,ksz9477";
-                                                             reg = <0>;
-
-                                                             spi-max-frequency = <44000000>;
-                                                             spi-cpha;
-                                                             spi-cpol;
-
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
+	eth0: ethernet@10001000 {
+		fixed-link {
+			speed = <1000>;
+			full-duplex;
+		};
+	};
+
+	spi1: spi@f8008000 {
+		pinctrl-0 = <&pinctrl_spi_ksz>;
+		cs-gpios = <&pioC 25 0>;
+		id = <1>;
+
+		ksz9477: ksz9477@0 {
+			compatible = "microchip,ksz9477";
+			reg = <0>;
+
+			spi-max-frequency = <44000000>;
+			spi-cpha;
+			spi-cpol;
+
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
 
 Ethernet switch connected via I2C to the host, CPU port wired to eth0:
 
-- 
2.19.1
