From: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
Subject: [PATCH 8/8] arm: orion5x: Configure WNR854T ethernet PHY LEDs
Date: Fri, 26 Aug 2016 10:21:04 +0100
Message-ID: <1472203264-21089-9-git-send-email-jm@lentin.co.uk>
References: <1468679348-10522-1-git-send-email-jm@lentin.co.uk>
 <1472203264-21089-1-git-send-email-jm@lentin.co.uk>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1472203264-21089-1-git-send-email-jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Vivien Didelot <vivien.didelot-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Imre Kaloz <kaloz-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The default PHY configuration disables most of the LEDs. The following
configures the ethernet activity LEDs as Netgear intended.

Signed-off-by: Jamie Lentin <jm-Pj/HzkgeCk7QXOPxS62xeg@public.gmane.org>
---
Andrew, note that the slave mdio bus is called "mdio", however there is
an example in bindings/net/dsa/dsa.txt using "mdio-bus". Is this a
mismatch to fix?

That said there's no formal definition of either node, and there's at
least one DT (vf610-zii-dev-rev-b.dts) that uses "mdio" already merged.
---
 arch/arm/boot/dts/orion5x-netgear-wnr854t.dts | 51 +++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm/boot/dts/orion5x-netgear-wnr854t.dts b/arch/arm/boot/dts/orion5x-netgear-wnr854t.dts
index 402a364..2a35a04 100644
--- a/arch/arm/boot/dts/orion5x-netgear-wnr854t.dts
+++ b/arch/arm/boot/dts/orion5x-netgear-wnr854t.dts
@@ -136,31 +136,82 @@
 			port@0 {
 				reg = <0>;
 				label = "lan3";
+				phy-handle = <&lan3phy>;
 			};
 
 			port@1 {
 				reg = <1>;
 				label = "lan4";
+				phy-handle = <&lan4phy>;
 			};
 
 			port@2 {
 				reg = <2>;
 				label = "wan";
+				phy-handle = <&wanphy>;
 			};
 
 			port@3 {
 				reg = <3>;
 				label = "cpu";
+				ethernet = <&ethport>;
 			};
 
 			port@5 {
 				reg = <5>;
 				label = "lan1";
+				phy-handle = <&lan1phy>;
 			};
 
 			port@7 {
 				reg = <7>;
 				label = "lan2";
+				phy-handle = <&lan2phy>;
+			};
+		};
+
+		mdio {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			lan3phy: ethernet-phy@0 {
+				/* Marvell 88E1121R (port 1) */
+				compatible = "ethernet-phy-id0141.0cb0",
+					     "ethernet-phy-ieee802.3-c22";
+				reg = <0>;
+				marvell,reg-init = <3 16 0 0x1777 3 17 0 0x15>;
+			};
+
+			lan4phy: ethernet-phy@1 {
+				/* Marvell 88E1121R (port 2) */
+				compatible = "ethernet-phy-id0141.0cb0",
+					     "ethernet-phy-ieee802.3-c22";
+				reg = <1>;
+				marvell,reg-init = <3 16 0 0x1777 3 17 0 0x15>;
+			};
+
+			wanphy: ethernet-phy@2 {
+				/* Marvell 88E1121R (port 1) */
+				compatible = "ethernet-phy-id0141.0cb0",
+					     "ethernet-phy-ieee802.3-c22";
+				reg = <2>;
+				marvell,reg-init = <3 16 0 0x1777 3 17 0 0x15>;
+			};
+
+			lan1phy: ethernet-phy@5 {
+				/* Marvell 88E1112 */
+				compatible = "ethernet-phy-id0141.0cb0",
+					     "ethernet-phy-ieee802.3-c22";
+				reg = <5>;
+				marvell,reg-init = <3 16 0 0x1777 3 17 0 0x15>;
+			};
+
+			lan2phy: ethernet-phy@7 {
+				/* Marvell 88E1112 */
+				compatible = "ethernet-phy-id0141.0cb0",
+					     "ethernet-phy-ieee802.3-c22";
+				reg = <7>;
+				marvell,reg-init = <3 16 0 0x1777 3 17 0 0x15>;
 			};
 		};
 	};
-- 
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
