From: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v3 1/6] clk: mvebu: Support Armada 380 SoC on the core divider clock
Date: Thu, 13 Mar 2014 17:24:28 -0300
Message-ID: <1394742273-5113-2-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1394742273-5113-1-git-send-email-ezequiel.garcia@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1394742273-5113-1-git-send-email-ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Seif Mazareeb <seif-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This commit adds support for the Core Divider clocks of the Armada
380 SoCs. Similarly to Armada 370 and XP, the Core Divider clocks of
the 380 have gate capabilities. The only difference is the register layout.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/clk/mvebu/clk-corediv.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/clk/mvebu/clk-corediv.c b/drivers/clk/mvebu/clk-corediv.c
index 4da6076..911dbb6 100644
--- a/drivers/clk/mvebu/clk-corediv.c
+++ b/drivers/clk/mvebu/clk-corediv.c
@@ -204,6 +204,22 @@ static const struct clk_corediv_soc_desc armada370_corediv_soc = {
 	.ratio_offset = 0x8,
 };
 
+static const struct clk_corediv_soc_desc armada380_corediv_soc = {
+	.descs = mvebu_corediv_desc,
+	.ndescs = ARRAY_SIZE(mvebu_corediv_desc),
+	.ops = {
+		.enable = clk_corediv_enable,
+		.disable = clk_corediv_disable,
+		.is_enabled = clk_corediv_is_enabled,
+		.recalc_rate = clk_corediv_recalc_rate,
+		.round_rate = clk_corediv_round_rate,
+		.set_rate = clk_corediv_set_rate,
+	},
+	.ratio_reload = BIT(8),
+	.enable_bit_offset = 16,
+	.ratio_offset = 0x4,
+};
+
 static const struct clk_corediv_soc_desc armada375_corediv_soc = {
 	.descs = mvebu_corediv_desc,
 	.ndescs = ARRAY_SIZE(mvebu_corediv_desc),
@@ -290,3 +306,10 @@ static void __init armada375_corediv_clk_init(struct device_node *node)
 }
 CLK_OF_DECLARE(armada375_corediv_clk, "marvell,armada-375-corediv-clock",
 	       armada375_corediv_clk_init);
+
+static void __init armada380_corediv_clk_init(struct device_node *node)
+{
+	return mvebu_corediv_clk_init(node, &armada380_corediv_soc);
+}
+CLK_OF_DECLARE(armada380_corediv_clk, "marvell,armada-380-corediv-clock",
+	       armada380_corediv_clk_init);
-- 
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
