From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 1/2] ARM: topology: Use a clock if possible to get the CPU frequency
Date: Wed, 21 May 2014 21:33:15 +0200
Message-ID: <1400700796-5763-2-git-send-email-maxime.ripard@free-electrons.com>
References: <1400700796-5763-1-git-send-email-maxime.ripard@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400700796-5763-1-git-send-email-maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Nicolas Pitre <nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Cortex-A7 and Cortex-A15 based SoCs need a clock-frequency property in the
topology code.

Allow to use a clock to provide the same information.

Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/kernel/topology.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/arch/arm/kernel/topology.c b/arch/arm/kernel/topology.c
index 0bc94b1fd1ae..2885993ccf53 100644
--- a/arch/arm/kernel/topology.c
+++ b/arch/arm/kernel/topology.c
@@ -11,6 +11,7 @@
  * for more details.
  */
 
+#include <linux/clk.h>
 #include <linux/cpu.h>
 #include <linux/cpumask.h>
 #include <linux/export.h>
@@ -100,8 +101,8 @@ static void __init parse_dt_topology(void)
 	__cpu_capacity = kzalloc(alloc_size, GFP_NOWAIT);
 
 	for_each_possible_cpu(cpu) {
-		const u32 *rate;
-		int len;
+		struct clk *clk;
+		u32 rate = 0;
 
 		/* too early to use cpu->of_node */
 		cn = of_get_cpu_node(cpu, NULL);
@@ -117,14 +118,23 @@ static void __init parse_dt_topology(void)
 		if (cpu_eff->compatible == NULL)
 			continue;
 
-		rate = of_get_property(cn, "clock-frequency", &len);
-		if (!rate || len != 4) {
-			pr_err("%s missing clock-frequency property\n",
-				cn->full_name);
+		clk = of_clk_get(cn, 0);
+		if (!IS_ERR(clk)) {
+			rate = clk_get_rate(clk);
+		} else {
+			if (of_property_read_u32(cn, "clock-frequency", &rate)) {
+				pr_err("%s missing clocks or clock-frequency properties\n",
+				       cn->full_name);
+				continue;
+			}
+		}
+
+		if (!rate) {
+			pr_err("%s invalid CPU frequency", cn->full_name);
 			continue;
 		}
 
-		capacity = ((be32_to_cpup(rate)) >> 20) * cpu_eff->efficiency;
+		capacity = ((rate) >> 20) * cpu_eff->efficiency;
 
 		/* Save min capacity of the system */
 		if (capacity < min_capacity)
-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
