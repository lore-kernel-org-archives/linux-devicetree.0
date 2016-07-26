From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 4/9] clk: sunxi-ng: mux: Add support for mux tables
Date: Tue, 26 Jul 2016 15:04:26 +0800
Message-ID: <1469516671-19377-5-git-send-email-wens@csie.org>
References: <1469516671-19377-1-git-send-email-wens@csie.org>
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1469516671-19377-1-git-send-email-wens@csie.org>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: dev@linux-sunxi.org, Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Some clock muxes have holes, i.e. invalid or unconnected inputs,
between parent mux values.

Add support for specifying a mux table to map clock parents to
mux values.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/clk/sunxi-ng/ccu_mux.c | 12 ++++++++++++
 drivers/clk/sunxi-ng/ccu_mux.h | 12 ++++++++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
index 1329b9ab481e..68b32f168a74 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.c
+++ b/drivers/clk/sunxi-ng/ccu_mux.c
@@ -107,6 +107,15 @@ u8 ccu_mux_helper_get_parent(struct ccu_common *common,
 	parent = reg >> cm->shift;
 	parent &= (1 << cm->width) - 1;
 
+	if (cm->table) {
+		int num_parents = clk_hw_get_num_parents(&common->hw);
+		int i;
+
+		for (i = 0; i < num_parents; i++)
+			if (cm->table[i] == parent)
+				return i;
+	}
+
 	return parent;
 }
 
@@ -117,6 +126,9 @@ int ccu_mux_helper_set_parent(struct ccu_common *common,
 	unsigned long flags;
 	u32 reg;
 
+	if (cm->table)
+		index = cm->table[index];
+
 	spin_lock_irqsave(common->lock, flags);
 
 	reg = readl(common->base + common->reg);
diff --git a/drivers/clk/sunxi-ng/ccu_mux.h b/drivers/clk/sunxi-ng/ccu_mux.h
index d35ce5e93840..f0078de78712 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.h
+++ b/drivers/clk/sunxi-ng/ccu_mux.h
@@ -6,8 +6,9 @@
 #include "ccu_common.h"
 
 struct ccu_mux_internal {
-	u8	shift;
-	u8	width;
+	u8		shift;
+	u8		width;
+	const u8	*table;
 
 	struct {
 		u8	index;
@@ -21,6 +22,13 @@ struct ccu_mux_internal {
 	} variable_prediv;
 };
 
+#define SUNXI_CLK_MUX_TABLE(_shift, _width, _table)	\
+	{						\
+		.shift	= _shift,			\
+		.width	= _width,			\
+		.table	= _table,			\
+	}
+
 #define SUNXI_CLK_MUX(_shift, _width)	\
 	{					\
 		.shift	= _shift,		\
-- 
2.8.1

