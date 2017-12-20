From: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Subject: [PATCH 3/4] ARM: dts: vf610-zii-dev-rev-b: add PHYs for switch2
Date: Wed, 20 Dec 2017 23:11:55 +0000
Message-ID: <E1eRnWl-0006VL-TL@rmk-PC.armlinux.org.uk>
References: <20171220231108.GJ10595@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171220231108.GJ10595-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Content-Disposition: inline
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Switch 2 has an 88e1545 PHY behind it, which is a quad PHY.  Only the
first three PHYs are used, the remaining PHY is unused.  When we wire
up the SFF sockets in a later commit, the omission of this causes the
fourth PHY to be used for port 3.  Specifying the PHYs in DT avoids
the auto-probing of the bus, and discovery of this PHY.

Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
---
 arch/arm/boot/dts/vf610-zii-dev-rev-b.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/vf610-zii-dev-rev-b.dts b/arch/arm/boot/dts/vf610-zii-dev-rev-b.dts
index ede8649ba515..782b69a3acdf 100644
--- a/arch/arm/boot/dts/vf610-zii-dev-rev-b.dts
+++ b/arch/arm/boot/dts/vf610-zii-dev-rev-b.dts
@@ -255,16 +255,19 @@
 					port@0 {
 						reg = <0>;
 						label = "lan6";
+						phy-handle = <&switch2phy0>;
 					};
 
 					port@1 {
 						reg = <1>;
 						label = "lan7";
+						phy-handle = <&switch2phy1>;
 					};
 
 					port@2 {
 						reg = <2>;
 						label = "lan8";
+						phy-handle = <&switch2phy2>;
 					};
 
 					port@3 {
@@ -304,6 +307,20 @@
 						};
 					};
 				};
+				mdio {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					switch2phy0: phy@0 {
+						reg = <0>;
+					};
+					switch2phy1: phy@1 {
+						reg = <1>;
+					};
+					switch2phy2: phy@2 {
+						reg = <2>;
+					};
+				};
 			};
 		};
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
