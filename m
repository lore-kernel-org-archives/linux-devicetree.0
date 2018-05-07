From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH net-next] dt-bindings: dsa: Remove unnecessary #address/#size-cells
Date: Mon,  7 May 2018 09:17:51 -0300
Message-ID: <1525695471-19984-1-git-send-email-festevam@gmail.com>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: davem@davemloft.net
Cc: f.fainelli@gmail.com, andrew@lunn.ch, robh+dt@kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Fabio Estevam <fabio.estevam@nxp.com>

If the example binding is used on a real dts file, the following DTC
warning is seen with W=1:
    
arch/arm/boot/dts/imx6q-b450v3.dtb: Warning (avoid_unnecessary_addr_size): /mdio-gpio/switch@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

Remove unnecessary #address-cells/#size-cells to improve the binding
document examples.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
 Documentation/devicetree/bindings/net/dsa/dsa.txt | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/dsa.txt b/Documentation/devicetree/bindings/net/dsa/dsa.txt
index cfe8f64..3ceeb8d 100644
--- a/Documentation/devicetree/bindings/net/dsa/dsa.txt
+++ b/Documentation/devicetree/bindings/net/dsa/dsa.txt
@@ -82,8 +82,6 @@ linked into one DSA cluster.
 
 	switch0: switch0@0 {
 		compatible = "marvell,mv88e6085";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		reg = <0>;
 
 		dsa,member = <0 0>;
@@ -135,8 +133,6 @@ linked into one DSA cluster.
 
 	switch1: switch1@0 {
 		compatible = "marvell,mv88e6085";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		reg = <0>;
 
 		dsa,member = <0 1>;
@@ -204,8 +200,6 @@ linked into one DSA cluster.
 
 	switch2: switch2@0 {
 		compatible = "marvell,mv88e6085";
-		#address-cells = <1>;
-		#size-cells = <0>;
 		reg = <0>;
 
 		dsa,member = <0 2>;
-- 
2.7.4
