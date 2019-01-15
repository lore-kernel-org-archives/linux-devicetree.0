From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 1/6] clk: actions: Add configurable PLL delay
Date: Tue, 15 Jan 2019 09:03:35 +0530
Message-ID: <20190115033340.25016-2-manivannan.sadhasivam@linaro.org>
References: <20190115033340.25016-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190115033340.25016-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: sboyd@kernel.org, mturquette@baylibre.com, afaerber@suse.de, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

S500 SoC requires configurable delay for different PLLs. Hence, add
a separate macro for declaring a PLL with configurable delay and also
modify the existing OWL_PLL_NO_PARENT macro to use default delay so
that no need to modify the existing S700/S900 drivers.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/clk/actions/owl-pll.c |  2 +-
 drivers/clk/actions/owl-pll.h | 30 ++++++++++++++++++++++++------
 2 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/actions/owl-pll.c b/drivers/clk/actions/owl-pll.c
index 058e06d7099f..02437bdedf4d 100644
--- a/drivers/clk/actions/owl-pll.c
+++ b/drivers/clk/actions/owl-pll.c
@@ -179,7 +179,7 @@ static int owl_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	regmap_write(common->regmap, pll_hw->reg, reg);
 
-	udelay(PLL_STABILITY_WAIT_US);
+	udelay(pll_hw->delay);
 
 	return 0;
 }
diff --git a/drivers/clk/actions/owl-pll.h b/drivers/clk/actions/owl-pll.h
index 0aae30abd5dc..6fb0d45bb088 100644
--- a/drivers/clk/actions/owl-pll.h
+++ b/drivers/clk/actions/owl-pll.h
@@ -13,6 +13,8 @@
 
 #include "owl-common.h"
 
+#define OWL_PLL_DEF_DELAY	50
+
 /* last entry should have rate = 0 */
 struct clk_pll_table {
 	unsigned int		val;
@@ -27,6 +29,7 @@ struct owl_pll_hw {
 	u8			width;
 	u8			min_mul;
 	u8			max_mul;
+	u8			delay;
 	const struct clk_pll_table *table;
 };
 
@@ -36,7 +39,7 @@ struct owl_pll {
 };
 
 #define OWL_PLL_HW(_reg, _bfreq, _bit_idx, _shift,			\
-		   _width, _min_mul, _max_mul, _table)			\
+		   _width, _min_mul, _max_mul, _delay, _table)		\
 	{								\
 		.reg		= _reg,					\
 		.bfreq		= _bfreq,				\
@@ -45,6 +48,7 @@ struct owl_pll {
 		.width		= _width,				\
 		.min_mul	= _min_mul,				\
 		.max_mul	= _max_mul,				\
+		.delay		= _delay,				\
 		.table		= _table,				\
 	}
 
@@ -52,8 +56,8 @@ struct owl_pll {
 		_shift, _width, _min_mul, _max_mul, _table, _flags)	\
 	struct owl_pll _struct = {					\
 		.pll_hw	= OWL_PLL_HW(_reg, _bfreq, _bit_idx, _shift,	\
-				     _width, _min_mul,			\
-				     _max_mul, _table),			\
+				     _width, _min_mul, _max_mul,	\
+				     OWL_PLL_DEF_DELAY,	_table),	\
 		.common = {						\
 			.regmap = NULL,					\
 			.hw.init = CLK_HW_INIT(_name,			\
@@ -67,8 +71,23 @@ struct owl_pll {
 		_shift, _width, _min_mul, _max_mul, _table, _flags)	\
 	struct owl_pll _struct = {					\
 		.pll_hw	= OWL_PLL_HW(_reg, _bfreq, _bit_idx, _shift,	\
-				     _width, _min_mul,			\
-				     _max_mul, _table),			\
+				     _width, _min_mul, _max_mul,	\
+				     OWL_PLL_DEF_DELAY,	_table),	\
+		.common = {						\
+			.regmap = NULL,					\
+			.hw.init = CLK_HW_INIT_NO_PARENT(_name,		\
+					       &owl_pll_ops,		\
+					       _flags),			\
+		},							\
+	}
+
+#define OWL_PLL_NO_PARENT_DELAY(_struct, _name, _reg, _bfreq, _bit_idx,	\
+		_shift, _width, _min_mul, _max_mul, _delay, _table,	\
+		_flags)							\
+	struct owl_pll _struct = {					\
+		.pll_hw	= OWL_PLL_HW(_reg, _bfreq, _bit_idx, _shift,	\
+				     _width, _min_mul,  _max_mul,	\
+				     _delay, _table),			\
 		.common = {						\
 			.regmap = NULL,					\
 			.hw.init = CLK_HW_INIT_NO_PARENT(_name,		\
@@ -78,7 +97,6 @@ struct owl_pll {
 	}
 
 #define mul_mask(m)		((1 << ((m)->width)) - 1)
-#define PLL_STABILITY_WAIT_US	(50)
 
 static inline struct owl_pll *hw_to_owl_pll(const struct clk_hw *hw)
 {
-- 
2.17.1
