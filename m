From: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: [PATCH 59/75] ARM: l2c: prima2: remove cache size override
Date: Fri, 28 Mar 2014 15:19:28 +0000
Message-ID: <E1WTYZ6-0007Gr-6r@rmk-PC.arm.linux.org.uk>
References: <20140328151249.GJ7528@n2100.arm.linux.org.uk>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140328151249.GJ7528-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Barry Song <baohua-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
---
 arch/arm/boot/dts/marco.dtsi  |  2 +-
 arch/arm/boot/dts/prima2.dtsi |  2 +-
 arch/arm/mach-prima2/l2x0.c   | 34 +---------------------------------
 3 files changed, 3 insertions(+), 35 deletions(-)

diff --git a/arch/arm/boot/dts/marco.dtsi b/arch/arm/boot/dts/marco.dtsi
index 1579c3491ccd..247879aa1224 100644
--- a/arch/arm/boot/dts/marco.dtsi
+++ b/arch/arm/boot/dts/marco.dtsi
@@ -36,7 +36,7 @@
 		ranges = <0x40000000 0x40000000 0xa0000000>;
 
 		l2-cache-controller@c0030000 {
-			compatible = "sirf,marco-pl310-cache", "arm,pl310-cache";
+			compatible = "arm,pl310-cache";
 			reg = <0xc0030000 0x1000>;
 			interrupts = <0 59 0>;
 			arm,tag-latency = <1 1 1>;
diff --git a/arch/arm/boot/dts/prima2.dtsi b/arch/arm/boot/dts/prima2.dtsi
index 0e219932d7cc..29b578727b0a 100644
--- a/arch/arm/boot/dts/prima2.dtsi
+++ b/arch/arm/boot/dts/prima2.dtsi
@@ -48,7 +48,7 @@
 		ranges = <0x40000000 0x40000000 0x80000000>;
 
 		l2-cache-controller@80040000 {
-			compatible = "arm,pl310-cache", "sirf,prima2-pl310-cache";
+			compatible = "arm,pl310-cache";
 			reg = <0x80040000 0x1000>;
 			interrupts = <59>;
 			arm,tag-latency = <1 1 1>;
diff --git a/arch/arm/mach-prima2/l2x0.c b/arch/arm/mach-prima2/l2x0.c
index 3a4eda45171e..09f68f046830 100644
--- a/arch/arm/mach-prima2/l2x0.c
+++ b/arch/arm/mach-prima2/l2x0.c
@@ -8,42 +8,10 @@
 
 #include <linux/init.h>
 #include <linux/kernel.h>
-#include <linux/of.h>
 #include <asm/hardware/cache-l2x0.h>
 
-struct l2x0_aux
-{
-	u32 val;
-	u32 mask;
-};
-
-static struct l2x0_aux prima2_l2x0_aux __initconst = {
-	.val = L2C_AUX_CTRL_WAY_SIZE(2),
-	.mask =	0,
-};
-
-static struct l2x0_aux marco_l2x0_aux __initconst = {
-	.val = L2C_AUX_CTRL_WAY_SIZE(2) | L310_AUX_CTRL_ASSOCIATIVITY_16,
-	.mask = L2X0_AUX_CTRL_MASK,
-};
-
-static struct of_device_id sirf_l2x0_ids[] __initconst = {
-	{ .compatible = "sirf,prima2-pl310-cache", .data = &prima2_l2x0_aux, },
-	{ .compatible = "sirf,marco-pl310-cache", .data = &marco_l2x0_aux, },
-	{},
-};
-
 static int __init sirfsoc_l2x0_init(void)
 {
-	struct device_node *np;
-	const struct l2x0_aux *aux;
-
-	np = of_find_matching_node(NULL, sirf_l2x0_ids);
-	if (np) {
-		aux = of_match_node(sirf_l2x0_ids, np)->data;
-		return l2x0_of_init(aux->val, aux->mask);
-	}
-
-	return 0;
+	return l2x0_of_init(0, ~0);
 }
 early_initcall(sirfsoc_l2x0_init);
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
