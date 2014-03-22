From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: [PATCH 3/5] ARM: Kirkwood: Fix Atmel vendor prefix
Date: Sat, 22 Mar 2014 13:45:58 +0100
Message-ID: <1395492360-1865-4-git-send-email-andrew@lunn.ch>
References: <1395492360-1865-1-git-send-email-andrew@lunn.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1395492360-1865-1-git-send-email-andrew-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Device Tree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The documented vendor prefix for Atmel is 'atmel' not 'at' as used in
these .dts[i] files.

The i2c framework actually ignores the prefix, so making this change
does not cause compatibility issues.

Signed-off-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
---
 arch/arm/boot/dts/kirkwood-laplug.dts      | 2 +-
 arch/arm/boot/dts/kirkwood-ns2-common.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/kirkwood-laplug.dts b/arch/arm/boot/dts/kirkwood-laplug.dts
index c9e82eff9bf2..6761ffa2c4ab 100644
--- a/arch/arm/boot/dts/kirkwood-laplug.dts
+++ b/arch/arm/boot/dts/kirkwood-laplug.dts
@@ -50,3 +50,3 @@
 			eeprom@50 {
-				compatible = "at,24c04";
+				compatible = "atmel,24c04";
 				pagesize = <16>;
diff --git a/arch/arm/boot/dts/kirkwood-ns2-common.dtsi b/arch/arm/boot/dts/kirkwood-ns2-common.dtsi
index 743152f31a81..843eb478b3e4 100644
--- a/arch/arm/boot/dts/kirkwood-ns2-common.dtsi
+++ b/arch/arm/boot/dts/kirkwood-ns2-common.dtsi
@@ -52,3 +52,3 @@
 			eeprom@50 {
-				compatible = "at,24c04";
+				compatible = "atmel,24c04";
 				pagesize = <16>;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
