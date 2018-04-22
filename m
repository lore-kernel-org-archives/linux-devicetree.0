Return-Path: <SRS0=lLp7=HL=gmail.com=brandon.maier@kernel.org>
From: Brandon Maier <brandon.maier@gmail.com>
Subject: [PATCH 2/2] dt-bindings: net: gmii2rgmii: Clarify proper usage
Date: Sat, 21 Apr 2018 23:01:32 -0500
Message-Id: <20180422040132.1389-2-brandon.maier@gmail.com>
In-Reply-To: <20180422040132.1389-1-brandon.maier@gmail.com>
References: <20180422040132.1389-1-brandon.maier@gmail.com>
To: robh+dt@kernel.org
Cc: mark.rutland@arm.com, michal.simek@xilinx.com, devicetree@vger.kernel.org, Brandon Maier <brandon.maier@gmail.com>
List-ID: <devicetree@vger.kernel.org>

The devicetree example is written for setups where the Ethernet
controller automatically attaches to the first device on the mdio bus,
in this example ethernet-phy@0. But for more exotic setups where a
phy-handle must be used, it isn't immediately clear which device to
attach too. Some developers may be misled by the hardware diagram to
assume that the Ethernet controller should attach to the gmii2rgmii
device. Clarify this to save future users headache.

Signed-off-by: Brandon Maier <brandon.maier@gmail.com>
---
 .../devicetree/bindings/net/xilinx_gmii2rgmii.txt  | 31 +++++++++++++++-------
 1 file changed, 21 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/xilinx_gmii2rgmii.txt b/Documentation/devicetree/bindings/net/xilinx_gmii2rgmii.txt
index b2258ce5004d..462a207f3f70 100644
--- a/Documentation/devicetree/bindings/net/xilinx_gmii2rgmii.txt
+++ b/Documentation/devicetree/bindings/net/xilinx_gmii2rgmii.txt
@@ -12,6 +12,11 @@ different speed modes by configuring the converter register through mdio writes.
 This converter sits between the ethernet MAC and the external PHY.
 GMII_MAC <==> GMII2RGMII <==> RGMII_PHY
 
+The driver is a shim between the MAC driver and PHY. It intercepts phy_driver
+calls to handle state changes. It is not a wrapper for the RGMII_PHY, and
+should not be used as an actual PHY device. Ethernet MAC drivers must attach
+directly to the RGMII_PHY driver.
+
 For more details about mdio please refer phy.txt file in the same directory.
 
 Required properties:
@@ -21,15 +26,21 @@ Required properties:
 		  See ethernet.txt file in the same directory.
 
 Example:
-	mdio {
-		#address-cells = <1>;
-		#size-cells = <0>;
-		phy: ethernet-phy@0 {
-			......
-		};
-		gmiitorgmii: gmiitorgmii@8 {
-			compatible = "xlnx,gmii-to-rgmii-1.0";
-			reg = <8>;
-			phy-handle = <&phy>;
+	gem0: ethernet@e000b000 {
+		compatible = "cdns,zynq-gem", "cdns,gem";
+		phy-handle = <&phy>;
+		......
+
+		mdio {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			phy: ethernet-phy@0 {
+				......
+			};
+			gmiitorgmii: gmiitorgmii@8 {
+				compatible = "xlnx,gmii-to-rgmii-1.0";
+				reg = <8>;
+				phy-handle = <&phy>;
+			};
 		};
 	};
-- 
2.11.0
