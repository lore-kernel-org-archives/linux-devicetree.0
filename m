From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v3 13/20] clk: mvebu: extend common code to allow an optional refclk
Date: Tue,  3 Mar 2015 15:41:08 +0100
Message-ID: <1425393675-17820-14-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1425393675-17820-1-git-send-email-thomas.petazzoni@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425393675-17820-1-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Armada 39x, contrary to its predecessor, has a configurable
reference clock frequency, of either 25 Mhz, or 40 Mhz. For the
previous SoCs, it was fixed to 25 Mhz and described directly as such
in the Device Tree.

For Armada 39x, we need to read certain registers to know whether the
frequency is 25 or 40 Mhz. Therefore, this commit extends the common
mvebu clock code to allow the SoC-specific code to say it wants to
register a reference clock, by giving a non-NULL ->get_refclk_freq()
function pointer in its coreclk_soc_desc structure.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/clk/mvebu/common.c | 17 +++++++++++++++++
 drivers/clk/mvebu/common.h |  1 +
 2 files changed, 18 insertions(+)

diff --git a/drivers/clk/mvebu/common.c b/drivers/clk/mvebu/common.c
index 0d4d121..15b370f 100644
--- a/drivers/clk/mvebu/common.c
+++ b/drivers/clk/mvebu/common.c
@@ -121,6 +121,11 @@ void __init mvebu_coreclk_setup(struct device_node *np,
 
 	/* Allocate struct for TCLK, cpu clk, and core ratio clocks */
 	clk_data.clk_num = 2 + desc->num_ratios;
+
+	/* One more clock for the optional refclk */
+	if (desc->get_refclk_freq)
+		clk_data.clk_num += 1;
+
 	clk_data.clks = kzalloc(clk_data.clk_num * sizeof(struct clk *),
 				GFP_KERNEL);
 	if (WARN_ON(!clk_data.clks)) {
@@ -162,6 +167,18 @@ void __init mvebu_coreclk_setup(struct device_node *np,
 		WARN_ON(IS_ERR(clk_data.clks[2+n]));
 	};
 
+	/* Register optional refclk */
+	if (desc->get_refclk_freq) {
+		const char *name = "refclk";
+		of_property_read_string_index(np, "clock-output-names",
+					      2 + desc->num_ratios, &name);
+		rate = desc->get_refclk_freq(base);
+		clk_data.clks[2 + desc->num_ratios] =
+			clk_register_fixed_rate(NULL, name, NULL,
+						CLK_IS_ROOT, rate);
+		WARN_ON(IS_ERR(clk_data.clks[2 + desc->num_ratios]));
+	}
+
 	/* SAR register isn't needed anymore */
 	iounmap(base);
 
diff --git a/drivers/clk/mvebu/common.h b/drivers/clk/mvebu/common.h
index 783b563..f0de6c8 100644
--- a/drivers/clk/mvebu/common.h
+++ b/drivers/clk/mvebu/common.h
@@ -30,6 +30,7 @@ struct coreclk_soc_desc {
 	u32 (*get_tclk_freq)(void __iomem *sar);
 	u32 (*get_cpu_freq)(void __iomem *sar);
 	void (*get_clk_ratio)(void __iomem *sar, int id, int *mult, int *div);
+	u32 (*get_refclk_freq)(void __iomem *sar);
 	bool (*is_sscg_enabled)(void __iomem *sar);
 	u32 (*fix_sscg_deviation)(u32 system_clk);
 	const struct coreclk_ratio *ratios;
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
