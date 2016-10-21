From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v4 14/23] clk: renesas: rcar-gen2: Obtain mode pin values using RST driver
Date: Fri, 21 Oct 2016 15:17:28 +0200
Message-ID: <1477055857-17936-15-git-send-email-geert+renesas@glider.be>
References: <1477055857-17936-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1477055857-17936-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Obtain the values of the mode pins from the R-Car RST driver, which
relies on the presence in DT of a device node for the RST module.

Fall back to our own private copy of rcar_gen2_read_mode_pins() for
backward-compatibility with old DTs.

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Acked-by: Dirk Behme <dirk.behme-V5te9oGctAVWk0Htik3J/w@public.gmane.org>
---
v4:
  - Add Acked-by,
  - Use our own private copy of rcar_gen2_read_mode_pins() instead of
    the one in the R-Car Gen2 platform code, as the latter is planned to
    be removed,

v3:
  -  Use the R-Car RST driver instead of syscon/regmap and the
     "renesas,modemr" property in DT,

v2:
  - drivers/clk/shmobile/ was renamed to drivers/clk/renesas/.
---
 drivers/clk/renesas/clk-rcar-gen2.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/clk/renesas/clk-rcar-gen2.c b/drivers/clk/renesas/clk-rcar-gen2.c
index 00e6aba4b9c09596..3291fd430ad4e215 100644
--- a/drivers/clk/renesas/clk-rcar-gen2.c
+++ b/drivers/clk/renesas/clk-rcar-gen2.c
@@ -19,6 +19,7 @@
 #include <linux/of_address.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
+#include <linux/soc/renesas/rcar-rst.h>
 
 struct rcar_gen2_cpg {
 	struct clk_onecell_data data;
@@ -364,6 +365,23 @@ struct cpg_pll_config {
 						 4, 0, table, &cpg->lock);
 }
 
+/*
+ * Reset register definitions.
+ */
+#define MODEMR	0xe6160060
+
+static u32 __init rcar_gen2_read_mode_pins(void)
+{
+	void __iomem *modemr = ioremap_nocache(MODEMR, 4);
+	u32 mode;
+
+	BUG_ON(!modemr);
+	mode = ioread32(modemr);
+	iounmap(modemr);
+
+	return mode;
+}
+
 static void __init rcar_gen2_cpg_clocks_init(struct device_node *np)
 {
 	const struct cpg_pll_config *config;
@@ -372,6 +390,13 @@ static void __init rcar_gen2_cpg_clocks_init(struct device_node *np)
 	unsigned int i;
 	int num_clks;
 
+	if (rcar_rst_read_mode_pins(&cpg_mode)) {
+		/* Backward-compatibility with old DT */
+		pr_warn("%s: failed to obtain mode pins from RST\n",
+			np->full_name);
+		cpg_mode = rcar_gen2_read_mode_pins();
+	}
+
 	num_clks = of_property_count_strings(np, "clock-output-names");
 	if (num_clks < 0) {
 		pr_err("%s: failed to count clocks\n", __func__);
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
