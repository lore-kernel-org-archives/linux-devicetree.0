From: Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH v3 3/6] clk: sunxi-ng: mux: support fixed pre-dividers on
 multiple parents
Date: Thu, 25 Aug 2016 14:21:57 +0800
Message-ID: <20160825062200.17206-4-wens@csie.org>
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

Some clocks on the A31 have fixed pre-dividers on multiple parents.
Add support for them.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
Changes since v2:

  - Fixed up H3 changes for number of fixed pre-dividers.

Changes since v1:

  - Add field for number of fixed pre-dividers.
---
 drivers/clk/sunxi-ng/ccu-sun8i-h3.c | 10 +++++-----
 drivers/clk/sunxi-ng/ccu_mux.c      |  6 ++++--
 drivers/clk/sunxi-ng/ccu_mux.h      | 11 +++++++----
 3 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-h3.c b/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
index 9af359544110..4fa9374c2959 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
@@ -184,15 +184,15 @@ static SUNXI_CCU_MP_WITH_MUX(apb2_clk, "apb2", apb2_parents, 0x058,
 			     0);
 
 static const char * const ahb2_parents[] = { "ahb1" , "pll-periph0" };
+static const struct ccu_mux_fixed_prediv ahb2_fixed_predivs[] = {
+	{ .index = 1, .div = 2 },
+};
 static struct ccu_mux ahb2_clk = {
 	.mux		= {
 		.shift	= 0,
 		.width	= 1,
-
-		.fixed_prediv	= {
-			.index	= 1,
-			.div	= 2,
-		},
+		.fixed_predivs	= ahb2_fixed_predivs,
+		.n_predivs	= ARRAY_SIZE(ahb2_fixed_predivs),
 	},
 
 	.common		= {
diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
index 68b32f168a74..7b17e0c26b01 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.c
+++ b/drivers/clk/sunxi-ng/ccu_mux.c
@@ -20,6 +20,7 @@ void ccu_mux_helper_adjust_parent_for_prediv(struct ccu_common *common,
 {
 	u16 prediv = 1;
 	u32 reg;
+	int i;
 
 	if (!((common->features & CCU_FEATURE_FIXED_PREDIV) ||
 	      (common->features & CCU_FEATURE_VARIABLE_PREDIV)))
@@ -32,8 +33,9 @@ void ccu_mux_helper_adjust_parent_for_prediv(struct ccu_common *common,
 	}
 
 	if (common->features & CCU_FEATURE_FIXED_PREDIV)
-		if (parent_index == cm->fixed_prediv.index)
-			prediv = cm->fixed_prediv.div;
+		for (i = 0; i < cm->n_predivs; i++)
+			if (parent_index == cm->fixed_predivs[i].index)
+				prediv = cm->fixed_predivs[i].div;
 
 	if (common->features & CCU_FEATURE_VARIABLE_PREDIV)
 		if (parent_index == cm->variable_prediv.index) {
diff --git a/drivers/clk/sunxi-ng/ccu_mux.h b/drivers/clk/sunxi-ng/ccu_mux.h
index b1e085612e5e..8eab1733eeac 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.h
+++ b/drivers/clk/sunxi-ng/ccu_mux.h
@@ -5,15 +5,18 @@
 
 #include "ccu_common.h"
 
+struct ccu_mux_fixed_prediv {
+	u8	index;
+	u16	div;
+};
+
 struct ccu_mux_internal {
 	u8		shift;
 	u8		width;
 	const u8	*table;
 
-	struct {
-		u8	index;
-		u16	div;
-	} fixed_prediv;
+	const struct ccu_mux_fixed_prediv	*fixed_predivs;
+	u8		n_predivs;
 
 	struct {
 		u8	index;
-- 
2.9.3
