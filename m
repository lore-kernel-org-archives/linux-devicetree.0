From: Ilia Lin <ilialin-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: [PATCH v2 08/11] clk: qcom: clk-cpu-8996: Prepare PLLs on probe
Date: Thu,  4 Jan 2018 13:10:12 +0200
Message-ID: <1515064215-22202-9-git-send-email-ilialin@codeaurora.org>
References: <1515064215-22202-1-git-send-email-ilialin@codeaurora.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1515064215-22202-1-git-send-email-ilialin-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, rnayak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ilialin-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, nicolas.dechesne-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, celster-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, tfinkel-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

The PLLs must be prepared enabled during the probe to be
accessible by the OPPs. Otherwise an OPP may switch
to non-enabled clock.

Signed-off-by: Ilia Lin <ilialin-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
---
 drivers/clk/qcom/clk-cpu-8996.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index 81cf466..f1bfd13 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -15,7 +15,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
-
+#include <linux/clk-provider.h>
 #include "clk-alpha-pll.h"
 
 #define VCO(a, b, c) { \
@@ -160,7 +160,7 @@ static int clk_cpu_8996_mux_set_parent(struct clk_hw *hw, u8 index)
 				    cpuclk->shift);
 
 	val = index;
-	val = cpuclk->shift;
+	val <<= cpuclk->shift;
 
 	return regmap_update_bits(clkr->regmap, cpuclk->reg, mask, val);
 }
@@ -269,7 +269,7 @@ int cpu_clk_notifier_cb(struct notifier_block *nb, unsigned long event,
 		},
 		.num_parents = 4,
 		.ops = &clk_cpu_8996_mux_ops,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
 	},
 };
 
@@ -285,12 +285,12 @@ int cpu_clk_notifier_cb(struct notifier_block *nb, unsigned long event,
 		.parent_names = (const char *[]){
 			"perfcl_smux",
 			"perfcl_pll",
-			"pwrcl_pll_acd",
+			"perfcl_pll_acd",
 			"perfcl_alt_pll",
 		},
 		.num_parents = 4,
 		.ops = &clk_cpu_8996_mux_ops,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
 	},
 };
 
@@ -355,6 +355,18 @@ struct clk_hw_clks {
 	clk_alpha_pll_configure(&perfcl_alt_pll, regmap, &altpll_config);
 	clk_alpha_pll_configure(&pwrcl_alt_pll, regmap, &altpll_config);
 
+	/* Enable all PLLs and alt PLLs */
+	clk_prepare_enable(pwrcl_alt_pll.clkr.hw.clk);
+	clk_prepare_enable(perfcl_alt_pll.clkr.hw.clk);
+	clk_prepare_enable(pwrcl_pll.clkr.hw.clk);
+	clk_prepare_enable(perfcl_pll.clkr.hw.clk);
+
+	/* Set initial boot frequencies for power/perf PLLs */
+	clk_set_rate(pwrcl_alt_pll.clkr.hw.clk, 652800000);
+	clk_set_rate(perfcl_alt_pll.clkr.hw.clk, 652800000);
+	clk_set_rate(pwrcl_pll.clkr.hw.clk, 652800000);
+	clk_set_rate(perfcl_pll.clkr.hw.clk, 652800000);
+
 	ret = clk_notifier_register(pwrcl_pmux.clkr.hw.clk, &pwrcl_pmux.nb);
 	if (ret)
 		return ret;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
