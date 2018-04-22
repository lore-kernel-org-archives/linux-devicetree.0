Return-Path: <SRS0=lLp7=HL=gmail.com=brandon.maier@kernel.org>
From: Brandon Maier <brandon.maier@gmail.com>
Subject: [PATCH 1/2] dt-bindings: net: gmii2rgmii: Fix typos
Date: Sat, 21 Apr 2018 23:01:31 -0500
Message-Id: <20180422040132.1389-1-brandon.maier@gmail.com>
To: robh+dt@kernel.org
Cc: mark.rutland@arm.com, michal.simek@xilinx.com, devicetree@vger.kernel.org, Brandon Maier <brandon.maier@gmail.com>
List-ID: <devicetree@vger.kernel.org>

The wording of 'provides the RGMII' is unclear, and should be 'is a
converter' to be consistent with the rest of this Doc. Also fix up
assorted spelling and capitalization typos.

Signed-off-by: Brandon Maier <brandon.maier@gmail.com>
---
 Documentation/devicetree/bindings/net/xilinx_gmii2rgmii.txt | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/xilinx_gmii2rgmii.txt b/Documentation/devicetree/bindings/net/xilinx_gmii2rgmii.txt
index 038dda48b8e6..b2258ce5004d 100644
--- a/Documentation/devicetree/bindings/net/xilinx_gmii2rgmii.txt
+++ b/Documentation/devicetree/bindings/net/xilinx_gmii2rgmii.txt
@@ -2,15 +2,15 @@ XILINX GMIITORGMII Converter Driver Device Tree Bindings
 --------------------------------------------------------
 
 The Gigabit Media Independent Interface (GMII) to Reduced Gigabit Media
-Independent Interface (RGMII) core provides the RGMII between RGMII-compliant
-Ethernet physical media devices (PHY) and the Gigabit Ethernet controller.
+Independent Interface (RGMII) core is a converter between RGMII-compliant
+Ethernet physical media devices (PHY) and GMII Ethernet controllers.
 This core can be used in all three modes of operation(10/100/1000 Mb/s).
 The Management Data Input/Output (MDIO) interface is used to configure the
-Speed of operation. This core can switch dynamically between the three
-Different speed modes by configuring the conveter register through mdio write.
+speed of operation. This core can switch dynamically between the three
+different speed modes by configuring the converter register through mdio writes.
 
-This converter sits between the ethernet MAC and the external phy.
-MAC <==> GMII2RGMII <==> RGMII_PHY
+This converter sits between the ethernet MAC and the external PHY.
+GMII_MAC <==> GMII2RGMII <==> RGMII_PHY
 
 For more details about mdio please refer phy.txt file in the same directory.
 
-- 
2.11.0
