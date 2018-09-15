From: Hauke Mehrtens <hauke@hauke-m.de>
Subject: [PATCH net-next 2/5] dt-bindings: net: dsa: lantiq,xrx200-gswip: Fix minor style fixes
Date: Sat, 15 Sep 2018 14:08:46 +0200
Message-ID: <20180915120849.24630-3-hauke@hauke-m.de>
References: <20180915120849.24630-1-hauke@hauke-m.de>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20180915120849.24630-1-hauke@hauke-m.de>
Sender: netdev-owner@vger.kernel.org
To: davem@davemloft.net
Cc: netdev@vger.kernel.org, andrew@lunn.ch, vivien.didelot@savoirfairelinux.com, f.fainelli@gmail.com, john@phrozen.org, linux-mips@linux-mips.org, dev@kresin.me, hauke.mehrtens@intel.com, devicetree@vger.kernel.org, Hauke Mehrtens <hauke@hauke-m.de>
List-Id: devicetree@vger.kernel.org

* Use one compatible line per line in the documentation
* Remove SoC revision depended compatible lines, we can detect that in
  the driver
* Use lower case letters in hex addresses
* Fix the size of the address ranges in the example, this now matches
  the sizes used by the SoC. The old ones will also work, this just adds
  some empty address space.
* Change the reg size of the gphy-fw node

Fixes: 86ce2bc73c7a ("dt-bindings: net: dsa: Add lantiq, xrx200-gswip DT bindings")
Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
Cc: devicetree@vger.kernel.org
---
 .../devicetree/bindings/net/dsa/lantiq-gswip.txt       | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/lantiq-gswip.txt b/Documentation/devicetree/bindings/net/dsa/lantiq-gswip.txt
index a089f5856778..886cbe8ffb38 100644
--- a/Documentation/devicetree/bindings/net/dsa/lantiq-gswip.txt
+++ b/Documentation/devicetree/bindings/net/dsa/lantiq-gswip.txt
@@ -22,9 +22,9 @@ required and optional properties.
 
 
 Required properties for GPHY firmware loading:
-- compatible	: "lantiq,gphy-fw" and "lantiq,xrx200-gphy-fw",
-		  "lantiq,xrx200a1x-gphy-fw", "lantiq,xrx200a2x-gphy-fw",
-		  "lantiq,xrx300-gphy-fw", or "lantiq,xrx330-gphy-fw"
+- compatible	: "lantiq,xrx200-gphy-fw", "lantiq,gphy-fw"
+		  "lantiq,xrx300-gphy-fw", "lantiq,gphy-fw"
+		  "lantiq,xrx330-gphy-fw", "lantiq,gphy-fw"
 		  for the loading of the firmware into the embedded
 		  GPHY core of the SoC.
 - lantiq,rcu	: reference to the rcu syscon
@@ -41,13 +41,13 @@ Example:
 
 Ethernet switch on the VRX200 SoC:
 
-gswip: gswip@E108000 {
+switch@e108000 {
 	#address-cells = <1>;
 	#size-cells = <0>;
 	compatible = "lantiq,xrx200-gswip";
-	reg = <	0xE108000 0x3000 /* switch */
-		0xE10B100 0x70 /* mdio */
-		0xE10B1D8 0x30 /* mii */
+	reg = <	0xe108000 0x3100	/* switch */
+		0xe10b100 0xd8		/* mdio */
+		0xe10b1d8 0x130		/* mii */
 		>;
 	dsa,member = <0 0>;
 
@@ -97,7 +97,7 @@ gswip: gswip@E108000 {
 		};
 	};
 
-	mdio@0 {
+	mdio {
 		#address-cells = <1>;
 		#size-cells = <0>;
 		compatible = "lantiq,xrx200-mdio";
@@ -123,6 +123,8 @@ gswip: gswip@E108000 {
 	gphy-fw {
 		compatible = "lantiq,xrx200-gphy-fw", "lantiq,gphy-fw";
 		lantiq,rcu = <&rcu0>;
+		#address-cells = <1>;
+		#size-cells = <0>;
 
 		gphy@20 {
 			reg = <0x20>;
-- 
2.11.0
