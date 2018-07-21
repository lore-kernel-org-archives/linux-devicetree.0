Return-Path: <SRS0=Uoy5=KF=googlemail.com=martin.blumenstingl@kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 2/3] clk: meson: meson8b: use the HHI syscon if available
Date: Sat, 21 Jul 2018 21:28:45 +0200
Message-Id: <20180721192846.18811-3-martin.blumenstingl@googlemail.com>
In-Reply-To: <20180721192846.18811-1-martin.blumenstingl@googlemail.com>
References: <20180721192846.18811-1-martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jbrunet@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, carlo@caione.org, khilman@baylibre.com, linux-clk@vger.kernel.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
List-ID: <devicetree@vger.kernel.org>

The clock controller is located in a register range (called "HHI") which
contains more than just registers for the clock controller. Known
consumers of the HHI register range are:
- the clock controller
- a reset controller
- temperature sensor calibration (TSC) data (Meson8b and Meson8m2 only)
- HDMI controller

Get the regmap from the parent (HHI syscon) node to support all
functionality of the HHI register range. Backwards compatibility with
old .dtbs is ensured by falling back to parsing the registers just like
before this change.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/clk/meson/meson8b.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index e961ee9fec20..76e54f604140 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -10,6 +10,7 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/init.h>
+#include <linux/mfd/syscon.h>
 #include <linux/of_address.h>
 #include <linux/reset-controller.h>
 #include <linux/slab.h>
@@ -1109,16 +1110,21 @@ static void __init meson8b_clkc_init(struct device_node *np)
 	struct regmap *map;
 	int i, ret;
 
-	/* Generic clocks, PLLs and some of the reset-bits */
-	clk_base = of_iomap(np, 1);
-	if (!clk_base) {
-		pr_err("%s: Unable to map clk base\n", __func__);
-		return;
-	}
+	map = syscon_node_to_regmap(of_get_parent(np));
+	if (IS_ERR(map)) {
+		pr_info("failed to get HHI regmap - Trying obsolete regs\n");
 
-	map = regmap_init_mmio(NULL, clk_base, &clkc_regmap_config);
-	if (IS_ERR(map))
-		return;
+		/* Generic clocks, PLLs and some of the reset-bits */
+		clk_base = of_iomap(np, 1);
+		if (!clk_base) {
+			pr_err("%s: Unable to map clk base\n", __func__);
+			return;
+		}
+
+		map = regmap_init_mmio(NULL, clk_base, &clkc_regmap_config);
+		if (IS_ERR(map))
+			return;
+	}
 
 	rstc = kzalloc(sizeof(*rstc), GFP_KERNEL);
 	if (!rstc)
-- 
2.18.0
