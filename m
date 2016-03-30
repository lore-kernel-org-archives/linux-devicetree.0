From: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
Subject: [PATCH 2/3] clk: sunxi: Add sun6i/8i PLL video support
Date: Wed, 30 Mar 2016 18:50:43 +0200
Message-ID: <e63499f789971b8c45a0ae5e90bd127371cbcf19.1459358017.git.moinejf@free.fr>
References: <cover.1459358017.git.moinejf@free.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1459358017.git.moinejf-GANU6spQydw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add the PLL type which is used by the sun6i/8i families for video display.

Signed-off-by: Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org>
---
 Documentation/devicetree/bindings/clock/sunxi.txt |  1 +
 drivers/clk/sunxi/clk-sunxi.c                     | 65 +++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Documentation/devicetree/bindings/clock/sunxi.txt
index 8c0fda8..ff93aee 100644
--- a/Documentation/devicetree/bindings/clock/sunxi.txt
+++ b/Documentation/devicetree/bindings/clock/sunxi.txt
@@ -10,6 +10,7 @@ Required properties:
 	"allwinner,sun4i-a10-pll1-clk" - for the main PLL clock and PLL4
 	"allwinner,sun6i-a31-pll1-clk" - for the main PLL clock on A31
 	"allwinner,sun8i-a23-pll1-clk" - for the main PLL clock on A23
+	"allwinner,sun6i-a31-pll3-clk" - for the video PLL clock
 	"allwinner,sun9i-a80-pll4-clk" - for the peripheral PLLs on A80
 	"allwinner,sun4i-a10-pll5-clk" - for the PLL5 clock
 	"allwinner,sun4i-a10-pll6-clk" - for the PLL6 clock
diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.c
index 0581e1b..270f2a9 100644
--- a/drivers/clk/sunxi/clk-sunxi.c
+++ b/drivers/clk/sunxi/clk-sunxi.c
@@ -23,6 +23,7 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/log2.h>
+#include <linux/rational.h>
 
 #include "clk-factors.h"
 
@@ -1129,6 +1130,70 @@ CLK_OF_DECLARE(sun6i_pll6, "allwinner,sun6i-a31-pll6-clk",
 	       sun6i_pll6_clk_setup);
 
 /*
+ * sun6i pll3
+ *
+ * if (p == 0) rate = k ? 270MHz : 297MHz
+ * else rate = parent_rate / (m + 1) * (n + 1);
+ */
+static void sun6i_pll3_factors(struct factors_request *req)
+{
+	unsigned long n, m;
+
+	if (req->rate == 270000000) {
+		req->m = 0;
+		req->p = 0;
+		req->k = 0;
+	} else if (req->rate == 297000000) {
+		req->m = 0;
+		req->p = 0;
+		req->k = 1;
+	} else {
+		rational_best_approximation(req->rate,
+					req->parent_rate,
+					1 << 7, 1 << 4, &n, &m);
+		req->rate = req->parent_rate / m * n;
+		req->p = 1;
+		req->m = m - 1;
+		req->n = n - 1;
+	}
+}
+
+static void sun6i_pll3_recalc(struct factors_request *req)
+{
+	if (req->p)
+		req->rate = req->parent_rate / (req->m + 1) * (req->n + 1);
+	else if (req->k)
+		req->rate = 270000000;
+	else
+		req->rate = 297000000;
+}
+
+static const struct clk_factors_config sun6i_pll3_config = {
+	.mshift = 0,
+	.mwidth = 4,
+	.nshift = 8,
+	.nwidth = 7,
+	.pshift = 24,	/* mode selection fractional / integer */
+	.pwidth = 1,
+	.kshift = 25,	/* fraction 270 / 297 MHz */
+	.kwidth = 1,
+};
+
+static const struct factors_data sun6i_pll3_data __initconst = {
+	.enable = 31,
+	.table = &sun6i_pll3_config,
+	.getter = sun6i_pll3_factors,
+	.recalc = sun6i_pll3_recalc,
+};
+
+static void __init sun6i_pll3_setup(struct device_node *node)
+{
+	sunxi_factors_clk_setup(node, &sun6i_pll3_data);
+}
+CLK_OF_DECLARE(sun6i_pll3, "allwinner,sun6i-a31-pll3-clk",
+	        sun6i_pll3_setup);
+
+/*
  * sun6i display
  *
  * rate = parent_rate / (m + 1);
-- 
2.8.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
