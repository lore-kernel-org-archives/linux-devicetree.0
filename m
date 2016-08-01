From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [Urgent PATCH] arm64: dts: uniphier: fix IRQ trigger type of ARMv8 timer
Date: Mon,  1 Aug 2016 17:12:20 +0900
Message-ID: <1470039140-3801-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Since commit 1e2a7d78499e ("irqdomain: Don't set type when mapping
an IRQ"), the interrupt type is strictly checked.  Without this
patch, this board would not boot any more.

Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.txt
says that the 3rd cell should be either 1 (edge) or 4 (level)
depending on the trigger type.  As the CA72 Generic Timer provides
active-low interrupts, the value of the 3rd cell should be 4.

Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Suggested-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
---
Arnd, Olof,

I guess you are about to send pull-reqs for v4.8 cycle.
Could you include this one in them?
After IRQ updates for 4.8 were merged, my board would not
boot at all.  I consulted experts and looks like my DT
was wrong.

I could do this after -rc1 is out because it is apparently a
bug fix, but in that case the for-next branch in ASOC will be
broken for me, which would make bisect-ability difficult for me.


 arch/arm64/boot/dts/socionext/uniphier-ph1-ld20.dtsi | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/socionext/uniphier-ph1-ld20.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ph1-ld20.dtsi
index fd1af50..bafbcce 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ph1-ld20.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ph1-ld20.dtsi
@@ -117,10 +117,7 @@
 
 	timer {
 		compatible = "arm,armv8-timer";
-		interrupts = <1 13 0xf01>,
-			     <1 14 0xf01>,
-			     <1 11 0xf01>,
-			     <1 10 0xf01>;
+		interrupts = <1 13 4>, <1 14 4>, <1 11 4>, <1 10 4>;
 	};
 
 	soc {
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
