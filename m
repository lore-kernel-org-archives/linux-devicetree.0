From: Vladimir Oltean <olteanv@gmail.com>
Subject: [PATCH v2 1/2] ARM: dts: ls1021: Use different compatible for MDIO bus node
Date: Fri, 12 Apr 2019 02:23:14 +0300
Message-ID: <20190411232315.19588-1-olteanv@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, leoyang.li@nxp.com, claudiu.manoil@nxp.com
Cc: robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, davem@davemloft.net, Vladimir Oltean <olteanv@gmail.com>
List-Id: devicetree@vger.kernel.org

This makes it less ambiguous since the bindings for the Ethernet
controller and for the MDIO bus were using the same compatible string.

Changing it, since the LS1021 has the only DTS that uses this compatible
string for the MDIO bus node.

Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
Suggested-by: Leo Li <leoyang.li@nxp.com>
---
 arch/arm/boot/dts/ls1021a.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
index b4f2723ecd86..1a2a9509d9c2 100644
--- a/arch/arm/boot/dts/ls1021a.dtsi
+++ b/arch/arm/boot/dts/ls1021a.dtsi
@@ -701,7 +701,7 @@
 		};
 
 		mdio0: mdio@2d24000 {
-			compatible = "gianfar";
+			compatible = "fsl,etsec2-mdio";
 			device_type = "mdio";
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.17.1
