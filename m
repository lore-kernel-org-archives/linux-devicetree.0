From: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Subject: [RFC PATCH 1/4] clk: sunxi: rename new sun6i_a31_pll6 clock to sun6i_a31_pll clock
Date: Fri, 12 Feb 2016 17:59:57 +0000
Message-ID: <1455300000-18723-2-git-send-email-andre.przywara@arm.com>
References: <1455300000-18723-1-git-send-email-andre.przywara@arm.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455300000-18723-1-git-send-email-andre.przywara-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

In preparation for bringing back the old driver for keeping
compatibility, we rename the new A31 PLL6 clock driver. This only
affects the internal naming, the compatible name stays on pll6 for
now.

Signed-off-by: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
---
 drivers/clk/sunxi/clk-sunxi.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.c
index 48ed81d..b4ab84b 100644
--- a/drivers/clk/sunxi/clk-sunxi.c
+++ b/drivers/clk/sunxi/clk-sunxi.c
@@ -233,7 +233,7 @@ static void sun4i_get_pll5_factors(struct factors_request *req)
  * parent_rate is always 24Mhz
  */
 
-static void sun6i_a31_get_pll6_factors(struct factors_request *req)
+static void sun6i_a31_get_pll_factors(struct factors_request *req)
 {
 	u8 div;
 
@@ -542,10 +542,10 @@ static const struct factors_data sun4i_pll6_data __initconst = {
 	.name = "pll6",
 };
 
-static const struct factors_data sun6i_a31_pll6_data __initconst = {
+static const struct factors_data sun6i_a31_pll_data __initconst = {
 	.enable = 31,
 	.table = &sun6i_a31_pll6_config,
-	.getter = sun6i_a31_get_pll6_factors,
+	.getter = sun6i_a31_get_pll_factors,
 	.recalc = sun6i_a31_pll6_recalc,
 };
 
@@ -622,12 +622,12 @@ static void __init sun7i_pll4_clk_setup(struct device_node *node)
 CLK_OF_DECLARE(sun7i_pll4, "allwinner,sun7i-a20-pll4-clk",
 	       sun7i_pll4_clk_setup);
 
-static void __init sun6i_pll6_clk_setup(struct device_node *node)
+static void __init sun6i_pll_clk_setup(struct device_node *node)
 {
-	sunxi_factors_clk_setup(node, &sun6i_a31_pll6_data);
+	sunxi_factors_clk_setup(node, &sun6i_a31_pll_data);
 }
-CLK_OF_DECLARE(sun6i_pll6, "allwinner,sun6i-a31-pll6-clk",
-	       sun6i_pll6_clk_setup);
+CLK_OF_DECLARE(sun6i_pll, "allwinner,sun6i-a31-pll6-clk",
+	       sun6i_pll_clk_setup);
 
 static void __init sun5i_ahb_clk_setup(struct device_node *node)
 {
-- 
2.6.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
