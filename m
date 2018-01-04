From: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v2 09/10] ARM: dts: keystone-k2g: Fix unit-address formatting for serial nodes
Date: Thu, 4 Jan 2018 13:57:00 -0600
Message-ID: <20180104195701.4042-10-afd@ti.com>
References: <20180104195701.4042-1-afd@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180104195701.4042-1-afd-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Andrew F . Davis" <afd-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>

The unit addresses on couple of serial nodes have a leading 0 resulting
in couple of warning messages around simple-bus unit address format
errors when compiled with W=1. Fix the same.

Signed-off-by: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
---
 arch/arm/boot/dts/keystone-k2g.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/keystone-k2g.dtsi b/arch/arm/boot/dts/keystone-k2g.dtsi
index cdaf519721b1..39f56054f319 100644
--- a/arch/arm/boot/dts/keystone-k2g.dtsi
+++ b/arch/arm/boot/dts/keystone-k2g.dtsi
@@ -151,7 +151,7 @@
 			status = "disabled";
 		};
 
-		uart1: serial@02531000 {
+		uart1: serial@2531000 {
 			compatible = "ti,da830-uart", "ns16550a";
 			current-speed = <115200>;
 			reg-shift = <2>;
@@ -163,7 +163,7 @@
 			status = "disabled";
 		};
 
-		uart2: serial@02531400 {
+		uart2: serial@2531400 {
 			compatible = "ti,da830-uart", "ns16550a";
 			current-speed = <115200>;
 			reg-shift = <2>;
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
