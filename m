From: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: [PATCH] ARM: dts: armada-388-clearfog: remove duplicate mdio entry
Date: Sun, 10 Jul 2016 16:27:38 +0100
Message-ID: <E1bMGdu-00005c-Dy@rmk-PC.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Jon Nettleton <jon-UBr1pzP51AyaMJb+Lgu22Q@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The clearfog DTS should not be defining the on-board phy, this device
is located on the microsom.  Remove the duplicated definition.

Reported-by: Jon Nettleton <jon-UBr1pzP51AyaMJb+Lgu22Q@public.gmane.org>
Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
---
 arch/arm/boot/dts/armada-388-clearfog.dts | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/arch/arm/boot/dts/armada-388-clearfog.dts b/arch/arm/boot/dts/armada-388-clearfog.dts
index 2e9246f749a2..a6dfa8dc3423 100644
--- a/arch/arm/boot/dts/armada-388-clearfog.dts
+++ b/arch/arm/boot/dts/armada-388-clearfog.dts
@@ -208,22 +208,6 @@
 				status = "okay";
 			};
 
-			mdio@72004 {
-				pinctrl-0 = <&mdio_pins>;
-				pinctrl-names = "default";
-
-				phy_dedicated: ethernet-phy@0 {
-					/*
-					 * Annoyingly, the marvell phy driver
-					 * configures the LED register, rather
-					 * than preserving reset-loaded setting.
-					 * We undo that rubbish here.
-					 */
-					marvell,reg-init = <3 16 0 0x101e>;
-					reg = <0>;
-				};
-			};
-
 			pinctrl@18000 {
 				clearfog_dsa0_clk_pins: clearfog-dsa0-clk-pins {
 					marvell,pins = "mpp46";
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
