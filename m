From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v4 4/6] clk: sunxi: Add support for table-based
 divider clocks
Date: Thu, 26 Jun 2014 23:55:42 +0800
Message-ID: <1403798144-32188-5-git-send-email-wens@csie.org>
References: <1403798144-32188-1-git-send-email-wens@csie.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBCMILY6JWQBBBH4FWGOQKGQECXL7YYY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1403798144-32188-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

A few of the clock modules have odd dividers, such as
the 2 lowest dividers being the same (2), or have the
same divider when the highest bit is set.

This patch adds support for optional divider tables,
so the clock framework will know about the odd values.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/clk/sunxi/clk-sunxi.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.c
index a38c799..6fe9492 100644
--- a/drivers/clk/sunxi/clk-sunxi.c
+++ b/drivers/clk/sunxi/clk-sunxi.c
@@ -664,6 +664,7 @@ struct div_data {
 	u8	shift;
 	u8	pow;
 	u8	width;
+	const struct clk_div_table *table;
 };
 
 static const struct div_data sun4i_axi_data __initconst = {
@@ -704,10 +705,10 @@ static void __init sunxi_divider_clk_setup(struct device_node *node,
 
 	of_property_read_string(node, "clock-output-names", &clk_name);
 
-	clk = clk_register_divider(NULL, clk_name, clk_parent, 0,
-				   reg, data->shift, data->width,
-				   data->pow ? CLK_DIVIDER_POWER_OF_TWO : 0,
-				   &clk_lock);
+	clk = clk_register_divider_table(NULL, clk_name, clk_parent, 0,
+					 reg, data->shift, data->width,
+					 data->pow ? CLK_DIVIDER_POWER_OF_TWO : 0,
+					 data->table, &clk_lock);
 	if (clk) {
 		of_clk_add_provider(node, of_clk_src_simple_get, clk);
 		clk_register_clkdev(clk, clk_name, NULL);
-- 
2.0.0
