From: Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 6/9] drivers: clk: st: Add CLK_GET_RATE_NOCACHE flag to clocks
Date: Tue, 23 Jun 2015 16:09:24 +0200
Message-ID: <1435068567-30995-7-git-send-email-gabriel.fernandez@linaro.org>
References: <1435068567-30995-1-git-send-email-gabriel.fernandez@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435068567-30995-1-git-send-email-gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Peter Griffin <peter.griffin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pankaj Dev <pankaj.dev-qxv4g6HH51o@public.gmane.org>, Olivier Bideau <olivier.bideau-qxv4g6HH51o@public.gmane.org>, Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Fabian Frederick <fabf-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Pankaj Dev <pankaj.dev-qxv4g6HH51o@public.gmane.org>

Add the CLK_GET_RATE_NOCACHE flag to all the clocks with recalc ops,
so that they reflect Hw rate after CPS wake-up when a clk_get_rate()
is called

Signed-off-by: Pankaj Dev <pankaj.dev-qxv4g6HH51o@public.gmane.org>
Signed-off-by: Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/clk/st/clk-flexgen.c | 2 +-
 drivers/clk/st/clkgen-fsyn.c | 2 +-
 drivers/clk/st/clkgen-mux.c  | 8 +++++---
 drivers/clk/st/clkgen-pll.c  | 2 +-
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/st/clk-flexgen.c b/drivers/clk/st/clk-flexgen.c
index be06d2a..8dd8cce 100644
--- a/drivers/clk/st/clk-flexgen.c
+++ b/drivers/clk/st/clk-flexgen.c
@@ -190,7 +190,7 @@ static struct clk *clk_register_flexgen(const char *name,
 
 	init.name = name;
 	init.ops = &flexgen_ops;
-	init.flags = CLK_IS_BASIC | flexgen_flags;
+	init.flags = CLK_IS_BASIC | CLK_GET_RATE_NOCACHE | flexgen_flags;
 	init.parent_names = parent_names;
 	init.num_parents = num_parents;
 
diff --git a/drivers/clk/st/clkgen-fsyn.c b/drivers/clk/st/clkgen-fsyn.c
index 9e26099..d9eb2e1 100644
--- a/drivers/clk/st/clkgen-fsyn.c
+++ b/drivers/clk/st/clkgen-fsyn.c
@@ -635,7 +635,7 @@ static struct clk * __init st_clk_register_quadfs_pll(
 
 	init.name = name;
 	init.ops = quadfs->pll_ops;
-	init.flags = CLK_IS_BASIC;
+	init.flags = CLK_IS_BASIC | CLK_GET_RATE_NOCACHE;
 	init.parent_names = &parent_name;
 	init.num_parents = 1;
 
diff --git a/drivers/clk/st/clkgen-mux.c b/drivers/clk/st/clkgen-mux.c
index c94b56b..3919a67 100644
--- a/drivers/clk/st/clkgen-mux.c
+++ b/drivers/clk/st/clkgen-mux.c
@@ -239,7 +239,7 @@ static struct clk *clk_register_genamux(const char *name,
 
 	init.name = name;
 	init.ops = &clkgena_divmux_ops;
-	init.flags = CLK_IS_BASIC;
+	init.flags = CLK_IS_BASIC | CLK_GET_RATE_NOCACHE;
 	init.parent_names = parent_names;
 	init.num_parents = num_parents;
 
@@ -516,7 +516,8 @@ static void __init st_of_clkgena_prediv_setup(struct device_node *np)
 					  0, &clk_name))
 		return;
 
-	clk = clk_register_divider_table(NULL, clk_name, parent_name, 0,
+	clk = clk_register_divider_table(NULL, clk_name, parent_name,
+					 CLK_GET_RATE_NOCACHE,
 					 reg + data->offset, data->shift, 1,
 					 0, data->table, NULL);
 	if (IS_ERR(clk))
@@ -789,7 +790,8 @@ static void __init st_of_clkgen_vcc_setup(struct device_node *np)
 					     &mux->hw, &clk_mux_ops,
 					     &div->hw, &clk_divider_ops,
 					     &gate->hw, &clk_gate_ops,
-					     data->clk_flags);
+					     data->clk_flags |
+					     CLK_GET_RATE_NOCACHE);
 		if (IS_ERR(clk)) {
 			kfree(gate);
 			kfree(div);
diff --git a/drivers/clk/st/clkgen-pll.c b/drivers/clk/st/clkgen-pll.c
index 1065322..72d1c27 100644
--- a/drivers/clk/st/clkgen-pll.c
+++ b/drivers/clk/st/clkgen-pll.c
@@ -406,7 +406,7 @@ static struct clk * __init clkgen_pll_register(const char *parent_name,
 	init.name = clk_name;
 	init.ops = pll_data->ops;
 
-	init.flags = CLK_IS_BASIC;
+	init.flags = CLK_IS_BASIC | CLK_GET_RATE_NOCACHE;
 	init.parent_names = &parent_name;
 	init.num_parents  = 1;
 
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
