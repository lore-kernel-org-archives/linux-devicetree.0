From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Subject: [PATCH 2/2] dt-bindings: net: dsa: ksz9477: add sample of switch bindings managed in i2c mode
Date: Sun, 16 Dec 2018 08:57:41 +0100
Message-ID: <20181216075741.13827-2-sergio.paracuellos@gmail.com>
References: <20181216075741.13827-1-sergio.paracuellos@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20181216075741.13827-1-sergio.paracuellos@gmail.com>
Sender: netdev-owner@vger.kernel.org
To: Woojung.Huh@microchip.com
Cc: UNGLinuxDriver@microchip.com, andrew@lunn.ch, vivien.didelot@savoirfairelinux.com, f.fainelli@gmail.com, driverdev-devel@linuxdriverproject.org, davem@davemloft.net, netdev@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add device-tree binding example of the ksz9477 switch managed in i2c mode.

Cc: devicetree@vger.kernel.org
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 .../devicetree/bindings/net/dsa/ksz.txt       | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/ksz.txt b/Documentation/devicetree/bindings/net/dsa/ksz.txt
index 0f407fb371ce..9e715358cebb 100644
--- a/Documentation/devicetree/bindings/net/dsa/ksz.txt
+++ b/Documentation/devicetree/bindings/net/dsa/ksz.txt
@@ -74,3 +74,53 @@ Ethernet switch connected via SPI to the host, CPU port wired to eth0:
                                                              };
                                              };
                              };
+
+Ethernet switch connected via I2C to the host, CPU port wired to eth0:
+
+                             eth0: ethernet@10001000 {
+                                             fixed-link {
+                                                             speed = <1000>;
+                                                             full-duplex;
+                                             };
+                             };
+
+                             i2c0: i2c@f8008000 {
+                                             ksz9897: ksz9897@0 {
+                                                             compatible = "microchip,ksz9897";
+                                                             reg = <5f>;
+
+                                                             ports {
+                                                                             #address-cells = <1>;
+                                                                             #size-cells = <0>;
+                                                                             port@0 {
+                                                                                             reg = <0>;
+                                                                                             label = "lan1";
+                                                                             };
+                                                                             port@1 {
+                                                                                             reg = <1>;
+                                                                                             label = "lan2";
+                                                                             };
+                                                                             port@2 {
+                                                                                             reg = <2>;
+                                                                                             label = "lan3";
+                                                                             };
+                                                                             port@3 {
+                                                                                             reg = <3>;
+                                                                                             label = "lan4";
+                                                                             };
+                                                                             port@4 {
+                                                                                             reg = <4>;
+                                                                                             label = "lan5";
+                                                                             };
+                                                                             port@6 {
+                                                                                             reg = <6>;
+                                                                                             label = "cpu";
+                                                                                             ethernet = <&eth0>;
+                                                                                             fixed-link {
+                                                                                                             speed = <1000>;
+                                                                                                             full-duplex;
+                                                                                             };
+                                                                             };
+                                                             };
+                                             };
+                             };
-- 
2.19.1
