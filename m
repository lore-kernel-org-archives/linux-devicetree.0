From: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: [PATCH] ARM: dts: armada388-clearfog: number LAN ports properly
Date: Fri, 08 Jul 2016 14:58:39 +0100
Message-ID: <E1bLWIh-0001ZK-Ai@rmk-PC.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Currently, the ports as seen from the rear number as:

	eth0 sfp lan5 lan4 lan3 lan2 lan1 lan6

which is illogical - this came about because the rev 2.0 boards have the
LEDs on the front for the DSA switch (lan5-1) reversed.  Rev 2.1 boards
fixed the LED issue, and the Clearfog case numbers the lan ports
increasing from left to right.

Maintaining this illogical numbering causes confusion, with reports that
"my link isn't coming up" and "my connection negotiates 10base-Half"
both of which are due to people thinking that the port next to the SFP
is lan1.

Fix this by renumbering the ports to match people's expectations.

Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
---
 arch/arm/boot/dts/armada-388-clearfog.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/armada-388-clearfog.dts b/arch/arm/boot/dts/armada-388-clearfog.dts
index 54bf0749e15e..42d760da4e82 100644
--- a/arch/arm/boot/dts/armada-388-clearfog.dts
+++ b/arch/arm/boot/dts/armada-388-clearfog.dts
@@ -386,12 +386,12 @@
 
 			port@0 {
 				reg = <0>;
-				label = "lan1";
+				label = "lan5";
 			};
 
 			port@1 {
 				reg = <1>;
-				label = "lan2";
+				label = "lan4";
 			};
 
 			port@2 {
@@ -401,12 +401,12 @@
 
 			port@3 {
 				reg = <3>;
-				label = "lan4";
+				label = "lan2";
 			};
 
 			port@4 {
 				reg = <4>;
-				label = "lan5";
+				label = "lan1";
 			};
 
 			port@5 {
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
