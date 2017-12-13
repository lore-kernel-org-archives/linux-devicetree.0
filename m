From: Abhishek Sahu <absahu@codeaurora.org>
Subject: [PATCH v2 02/11] clk: qcom: add parent map for regmap mux
Date: Wed, 13 Dec 2017 19:55:33 +0530
Message-ID: <1513175142-3702-3-git-send-email-absahu@codeaurora.org>
References: <1513175142-3702-1-git-send-email-absahu@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1513175142-3702-1-git-send-email-absahu@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Abhishek Sahu <absahu@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Currently the driver assumes the register configuration value
is identical to its index in the parent map. This patch adds
the parent map field in regmap mux clock node which contains
the mapping of parent index with actual register configuration
value. If regmap node contains this parent map then the
configuration value will be taken from this
parent map instead of simply writing the index value.

Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
---
 drivers/clk/qcom/clk-rcg.h        | 10 ----------
 drivers/clk/qcom/clk-regmap-mux.c |  6 ++++++
 drivers/clk/qcom/clk-regmap-mux.h |  2 ++
 drivers/clk/qcom/common.h         | 11 ++++++++++-
 4 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
index a249545..2a7489a 100644
--- a/drivers/clk/qcom/clk-rcg.h
+++ b/drivers/clk/qcom/clk-rcg.h
@@ -26,16 +26,6 @@ struct freq_tbl {
 };
 
 /**
- * struct parent_map - map table for PLL source select configuration values
- * @src: source PLL
- * @cfg: configuration value
- */
-struct parent_map {
-	u8 src;
-	u8 cfg;
-};
-
-/**
  * struct mn - M/N:D counter
  * @mnctr_en_bit: bit to enable mn counter
  * @mnctr_reset_bit: bit to assert mn counter reset
diff --git a/drivers/clk/qcom/clk-regmap-mux.c b/drivers/clk/qcom/clk-regmap-mux.c
index cae3071..0f3a1bd 100644
--- a/drivers/clk/qcom/clk-regmap-mux.c
+++ b/drivers/clk/qcom/clk-regmap-mux.c
@@ -35,6 +35,9 @@ static u8 mux_get_parent(struct clk_hw *hw)
 	val >>= mux->shift;
 	val &= mask;
 
+	if (mux->parent_map)
+		return qcom_find_src_index(hw, mux->parent_map, val);
+
 	return val;
 }
 
@@ -45,6 +48,9 @@ static int mux_set_parent(struct clk_hw *hw, u8 index)
 	unsigned int mask = GENMASK(mux->width + mux->shift - 1, mux->shift);
 	unsigned int val;
 
+	if (mux->parent_map)
+		index = mux->parent_map[index].cfg;
+
 	val = index;
 	val <<= mux->shift;
 
diff --git a/drivers/clk/qcom/clk-regmap-mux.h b/drivers/clk/qcom/clk-regmap-mux.h
index 5cec761..7797cdd 100644
--- a/drivers/clk/qcom/clk-regmap-mux.h
+++ b/drivers/clk/qcom/clk-regmap-mux.h
@@ -16,11 +16,13 @@
 
 #include <linux/clk-provider.h>
 #include "clk-regmap.h"
+#include "common.h"
 
 struct clk_regmap_mux {
 	u32			reg;
 	u32			shift;
 	u32			width;
+	const struct parent_map	*parent_map;
 	struct clk_regmap	clkr;
 };
 
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index 23c1927..00196ee 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -20,7 +20,6 @@
 struct regmap;
 struct freq_tbl;
 struct clk_hw;
-struct parent_map;
 
 #define PLL_LOCK_COUNT_SHIFT	8
 #define PLL_LOCK_COUNT_MASK	0x3f
@@ -39,6 +38,16 @@ struct qcom_cc_desc {
 	size_t num_gdscs;
 };
 
+/**
+ * struct parent_map - map table for source select configuration values
+ * @src: source
+ * @cfg: configuration value
+ */
+struct parent_map {
+	u8 src;
+	u8 cfg;
+};
+
 extern const struct freq_tbl *qcom_find_freq(const struct freq_tbl *f,
 					     unsigned long rate);
 extern const struct freq_tbl *qcom_find_freq_floor(const struct freq_tbl *f,
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
