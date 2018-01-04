From: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v2 10/10] ARM: dts: keystone-k2e-clocks: Fix missing unit address separator
Date: Thu, 4 Jan 2018 13:57:01 -0600
Message-ID: <20180104195701.4042-11-afd@ti.com>
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

Commit 95d8b41c765b ("ARM: dts: keystone-k2e-clocks: Add missing unit
name to clock nodes that have regs") fixed the unit names on various
clock nodes but missed out adding the unit address separator on the
clkhyperlink0 clock node. Fix the same.

Fixes: 95d8b41c765b ("ARM: dts: keystone-k2e-clocks: Add missing unit name to clock nodes that have regs")
Signed-off-by: Suman Anna <s-anna-l0cyMroinI0@public.gmane.org>
---
 arch/arm/boot/dts/keystone-k2e-clocks.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/keystone-k2e-clocks.dtsi b/arch/arm/boot/dts/keystone-k2e-clocks.dtsi
index 5e0e7d232161..f7592155a740 100644
--- a/arch/arm/boot/dts/keystone-k2e-clocks.dtsi
+++ b/arch/arm/boot/dts/keystone-k2e-clocks.dtsi
@@ -42,7 +42,7 @@ clocks {
 		domain-id = <0>;
 	};
 
-	clkhyperlink0: clkhyperlink02350030 {
+	clkhyperlink0: clkhyperlink0@2350030 {
 		#clock-cells = <0>;
 		compatible = "ti,keystone,psc-clock";
 		clocks = <&chipclk12>;
-- 
2.15.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
