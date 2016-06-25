From: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Subject: [PATCH v2 06/14] ARM: sun8i: clk: Add clk-factor rate
 application method
Date: Sat, 25 Jun 2016 05:45:03 +0200
Message-ID: <20160625034511.7966-7-megous@megous.com>
References: <20160625034511.7966-1-megous@megous.com>
Reply-To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDXLF6FR5INBBU74W65QKGQE4T3RNWY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20160625034511.7966-1-megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, =?UTF-8?q?Emilio=20L=C3=B3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>

PLL1 on H3 requires special factors application algorithm,
when the rate is changed. This algorithm was extracted
from the arisc code that handles frequency scaling
in the BSP kernel.

This commit adds optional apply function to
struct factors_data, that can implement non-trivial
factors application method, when necessary.

Also struct clk_factors_config is extended with position
of the PLL lock flag.

Signed-off-by: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
---
 Documentation/devicetree/bindings/clock/sunxi.txt |  1 +
 drivers/clk/sunxi/clk-factors.c                   | 34 +++++------
 drivers/clk/sunxi/clk-factors.h                   | 12 ++++
 drivers/clk/sunxi/clk-sunxi.c                     | 72 ++++++++++++++++++++++-
 4 files changed, 98 insertions(+), 21 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Documentation/devicetree/bindings/clock/sunxi.txt
index 5faae05..774500c 100644
--- a/Documentation/devicetree/bindings/clock/sunxi.txt
+++ b/Documentation/devicetree/bindings/clock/sunxi.txt
@@ -10,6 +10,7 @@ Required properties:
 	"allwinner,sun4i-a10-pll1-clk" - for the main PLL clock and PLL4
 	"allwinner,sun6i-a31-pll1-clk" - for the main PLL clock on A31
 	"allwinner,sun8i-a23-pll1-clk" - for the main PLL clock on A23
+	"allwinner,sun8i-h3-pll1-clk" - for the main PLL clock on H3
 	"allwinner,sun4i-a10-pll3-clk" - for the video PLL clock on A10
 	"allwinner,sun9i-a80-pll4-clk" - for the peripheral PLLs on A80
 	"allwinner,sun4i-a10-pll5-clk" - for the PLL5 clock
diff --git a/drivers/clk/sunxi/clk-factors.c b/drivers/clk/sunxi/clk-factors.c
index ddefe96..7c165db 100644
--- a/drivers/clk/sunxi/clk-factors.c
+++ b/drivers/clk/sunxi/clk-factors.c
@@ -34,13 +34,6 @@
 
 #define FACTORS_MAX_PARENTS		5
 
-#define SETMASK(len, pos)		(((1U << (len)) - 1) << (pos))
-#define CLRMASK(len, pos)		(~(SETMASK(len, pos)))
-#define FACTOR_GET(bit, len, reg)	(((reg) & SETMASK(len, bit)) >> (bit))
-
-#define FACTOR_SET(bit, len, reg, val) \
-	(((reg) & CLRMASK(len, bit)) | (val << (bit)))
-
 static unsigned long clk_factors_recalc_rate(struct clk_hw *hw,
 					     unsigned long parent_rate)
 {
@@ -150,20 +143,24 @@ static int clk_factors_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (factors->lock)
 		spin_lock_irqsave(factors->lock, flags);
 
-	/* Fetch the register value */
-	reg = readl(factors->reg);
+	if (factors->apply) {
+		factors->apply(factors, &req);
+	} else {
+		/* Fetch the register value */
+		reg = readl(factors->reg);
 
-	/* Set up the new factors - macros do not do anything if width is 0 */
-	reg = FACTOR_SET(config->nshift, config->nwidth, reg, req.n);
-	reg = FACTOR_SET(config->kshift, config->kwidth, reg, req.k);
-	reg = FACTOR_SET(config->mshift, config->mwidth, reg, req.m);
-	reg = FACTOR_SET(config->pshift, config->pwidth, reg, req.p);
+		/* Set up the new factors - macros do not do anything if width is 0 */
+		reg = FACTOR_SET(config->nshift, config->nwidth, reg, req.n);
+		reg = FACTOR_SET(config->kshift, config->kwidth, reg, req.k);
+		reg = FACTOR_SET(config->mshift, config->mwidth, reg, req.m);
+		reg = FACTOR_SET(config->pshift, config->pwidth, reg, req.p);
 
-	/* Apply them now */
-	writel(reg, factors->reg);
+		/* Apply them now */
+		writel(reg, factors->reg);
 
-	/* delay 500us so pll stabilizes */
-	__delay((rate >> 20) * 500 / 2);
+		/* delay 500us so pll stabilizes */
+		__delay((rate >> 20) * 500 / 2);
+	}
 
 	if (factors->lock)
 		spin_unlock_irqrestore(factors->lock, flags);
@@ -213,6 +210,7 @@ struct clk *sunxi_factors_register(struct device_node *node,
 	factors->config = data->table;
 	factors->get_factors = data->getter;
 	factors->recalc = data->recalc;
+	factors->apply = data->apply;
 	factors->lock = lock;
 
 	/* Add a gate if this factor clock can be gated */
diff --git a/drivers/clk/sunxi/clk-factors.h b/drivers/clk/sunxi/clk-factors.h
index 1e63c5b..661a45a 100644
--- a/drivers/clk/sunxi/clk-factors.h
+++ b/drivers/clk/sunxi/clk-factors.h
@@ -6,6 +6,13 @@
 
 #define SUNXI_FACTORS_NOT_APPLICABLE	(0)
 
+#define SETMASK(len, pos)		(((1U << (len)) - 1) << (pos))
+#define CLRMASK(len, pos)		(~(SETMASK(len, pos)))
+#define FACTOR_GET(bit, len, reg)	(((reg) & SETMASK(len, bit)) >> (bit))
+
+#define FACTOR_SET(bit, len, reg, val) \
+	(((reg) & CLRMASK(len, bit)) | (val << (bit)))
+
 struct clk_factors_config {
 	u8 nshift;
 	u8 nwidth;
@@ -16,6 +23,7 @@ struct clk_factors_config {
 	u8 pshift;
 	u8 pwidth;
 	u8 n_start;
+	u8 lock;
 };
 
 struct factors_request {
@@ -28,6 +36,8 @@ struct factors_request {
 	u8 p;
 };
 
+struct clk_factors;
+
 struct factors_data {
 	int enable;
 	int mux;
@@ -35,6 +45,7 @@ struct factors_data {
 	const struct clk_factors_config *table;
 	void (*getter)(struct factors_request *req);
 	void (*recalc)(struct factors_request *req);
+	void (*apply)(struct clk_factors *factors, struct factors_request *req);
 	const char *name;
 };
 
@@ -44,6 +55,7 @@ struct clk_factors {
 	const struct clk_factors_config *config;
 	void (*get_factors)(struct factors_request *req);
 	void (*recalc)(struct factors_request *req);
+	void (*apply)(struct clk_factors *factors, struct factors_request *req);
 	spinlock_t *lock;
 	/* for cleanup */
 	struct clk_mux *mux;
diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.c
index 838b22a..e4bb908 100644
--- a/drivers/clk/sunxi/clk-sunxi.c
+++ b/drivers/clk/sunxi/clk-sunxi.c
@@ -23,6 +23,7 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <linux/log2.h>
+#include <linux/delay.h>
 
 #include "clk-factors.h"
 
@@ -200,6 +201,56 @@ static void sun8i_a23_get_pll1_factors(struct factors_request *req)
 }
 
 /**
+ * sun8i_h3_apply_pll1_factors() - applies n, k, m, p factors to the
+ * register using an algorithm that tries to reserve the PLL lock
+ */
+
+static void sun8i_h3_apply_pll1_factors(struct clk_factors *factors, struct factors_request *req)
+{
+	const struct clk_factors_config *config = factors->config;
+	u32 reg;
+
+	/* Fetch the register value */
+	reg = readl(factors->reg);
+
+	if (FACTOR_GET(config->pshift, config->pwidth, reg) < req->p) {
+		reg = FACTOR_SET(config->pshift, config->pwidth, reg, req->p);
+
+		writel(reg, factors->reg);
+		__delay(2000);
+	}
+
+	if (FACTOR_GET(config->mshift, config->mwidth, reg) < req->m) {
+		reg = FACTOR_SET(config->mshift, config->mwidth, reg, req->m);
+
+		writel(reg, factors->reg);
+		__delay(2000);
+	}
+
+	reg = FACTOR_SET(config->nshift, config->nwidth, reg, req->n);
+	reg = FACTOR_SET(config->kshift, config->kwidth, reg, req->k);
+
+	writel(reg, factors->reg);
+	__delay(20);
+
+	while (!(readl(factors->reg) & (1 << config->lock)));
+
+	if (FACTOR_GET(config->mshift, config->mwidth, reg) > req->m) {
+		reg = FACTOR_SET(config->mshift, config->mwidth, reg, req->m);
+
+		writel(reg, factors->reg);
+		__delay(2000);
+	}
+
+	if (FACTOR_GET(config->pshift, config->pwidth, reg) > req->p) {
+		reg = FACTOR_SET(config->pshift, config->pwidth, reg, req->p);
+
+		writel(reg, factors->reg);
+		__delay(2000);
+	}
+}
+
+/**
  * sun4i_get_pll5_factors() - calculates n, k factors for PLL5
  * PLL5 rate is calculated as follows
  * rate = parent_rate * n * (k + 1)
@@ -451,6 +502,7 @@ static const struct clk_factors_config sun8i_a23_pll1_config = {
 	.pshift = 16,
 	.pwidth = 2,
 	.n_start = 1,
+	.lock = 28
 };
 
 static const struct clk_factors_config sun4i_pll5_config = {
@@ -513,6 +565,13 @@ static const struct factors_data sun8i_a23_pll1_data __initconst = {
 	.getter = sun8i_a23_get_pll1_factors,
 };
 
+static const struct factors_data sun8i_h3_pll1_data __initconst = {
+	.enable = 31,
+	.table = &sun8i_a23_pll1_config,
+	.getter = sun8i_a23_get_pll1_factors,
+	.apply = sun8i_h3_apply_pll1_factors,
+};
+
 static const struct factors_data sun7i_a20_pll4_data __initconst = {
 	.enable = 31,
 	.table = &sun4i_pll5_config,
@@ -590,12 +649,19 @@ static void __init sun6i_pll1_clk_setup(struct device_node *node)
 CLK_OF_DECLARE(sun6i_pll1, "allwinner,sun6i-a31-pll1-clk",
 	       sun6i_pll1_clk_setup);
 
-static void __init sun8i_pll1_clk_setup(struct device_node *node)
+static void __init sun8i_a23_pll1_clk_setup(struct device_node *node)
 {
 	sunxi_factors_clk_setup(node, &sun8i_a23_pll1_data);
 }
-CLK_OF_DECLARE(sun8i_pll1, "allwinner,sun8i-a23-pll1-clk",
-	       sun8i_pll1_clk_setup);
+CLK_OF_DECLARE(sun8i_a23_pll1, "allwinner,sun8i-a23-pll1-clk",
+	       sun8i_a23_pll1_clk_setup);
+
+static void __init sun8i_h3_pll1_clk_setup(struct device_node *node)
+{
+	sunxi_factors_clk_setup(node, &sun8i_h3_pll1_data);
+}
+CLK_OF_DECLARE(sun8i_h3_pll1, "allwinner,sun8i-h3-pll1-clk",
+	       sun8i_h3_pll1_clk_setup);
 
 static void __init sun7i_pll4_clk_setup(struct device_node *node)
 {
-- 
2.9.0
