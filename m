From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v3 2/6] clk: sunxi-ng: mux: Add support for mux tables
Date: Thu, 25 Aug 2016 14:21:56 +0800
Message-ID: <20160825062200.17206-3-wens@csie.org>
References: <20160825062200.17206-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160825062200.17206-1-wens@csie.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: devicetree@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Some clock muxes have holes, i.e. invalid or unconnected inputs,
between parent mux values.

Add support for specifying a mux table to map clock parents to
mux values.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
Changes since v2:

  - Update macro names as changed in commit ad4578dc4cfa ("clk: sunxi-ng:
    mux: Rename mux macro to be consistent")
  - Use _SUNXI_CLK_MUX_TABLE to expand _SUNXI_CLK_MUX

Changes since v1: none
---
 drivers/clk/sunxi-ng/ccu_mux.c | 12 ++++++++++++
 drivers/clk/sunxi-ng/ccu_mux.h | 17 +++++++++++------
 2 files changed, 23 insertions(+), 6 deletions(-)

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
index 83737c2facd4..b1e085612e5e 100644
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
@@ -21,12 +22,16 @@ struct ccu_mux_internal {
 	} variable_prediv;
 };
 
-#define _SUNXI_CCU_MUX(_shift, _width)		\
-	{					\
-		.shift	= _shift,		\
-		.width	= _width,		\
+#define _SUNXI_CCU_MUX_TABLE(_shift, _width, _table)	\
+	{						\
+		.shift	= _shift,			\
+		.width	= _width,			\
+		.table	= _table,			\
 	}
 
+#define _SUNXI_CCU_MUX(_shift, _width) \
+	_SUNXI_CCU_MUX_TABLE(_shift, _width, NULL)
+
 struct ccu_mux {
 	u16			reg;
 	u32			enable;
-- 
2.9.3
