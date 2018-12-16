From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Subject: [PATCH v2 2/2] dt-bindings: net: dsa: ksz9477: add sample of switch
 bindings managed in i2c mode
Date: Sun, 16 Dec 2018 10:49:53 +0100
Message-ID: <20181216094953.13984-2-sergio.paracuellos@gmail.com>
References: <20181216094953.13984-1-sergio.paracuellos@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20181216094953.13984-1-sergio.paracuellos@gmail.com>
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

Add device-tree binding example of the ksz9477 switch managed in i2c mode.

Cc: devicetree@vger.kernel.org
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
Changes v2:
    - Use generic name for label of the switch and make sure reg and @X
      have the same value.

 .../devicetree/bindings/net/dsa/ksz.txt       | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/ksz.txt b/Documentation/devicetree/bindings/net/dsa/ksz.txt
index 0f407fb371ce..d3c4b9d4f416 100644
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
+                                             switch: ksz9897@5f {
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
