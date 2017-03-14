From: Markus Mayer <code@mmayer.net>
Subject: [RFC 2/2] clk: divider: modifications for 4.11
Date: Tue, 14 Mar 2017 13:22:36 -0700
Message-ID: <20170314202236.39910-3-code@mmayer.net>
References: <20170314202236.39910-1-code@mmayer.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170314202236.39910-1-code@mmayer.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Markus Mayer <mmayer@broadcom.com>, Linux Clock Mailing List <linux-clk@vger.kernel.org>, Device Tree Mailing List <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

From: Markus Mayer <mmayer@broadcom.com>

These changes were applied on top of the original commit[1]. Some
changes are more stylistic in nature, others were necessary due to
changes in the clock framework.

- make of_clk_get_div_table() static
- turn "u32 table_size" into "unsigned int table_size"
- wrap two over-long pr_err() lines
- change _register_divider() call and related code, since it is
  returning a (struct clk_hw *) now instead of (struct clk *)

[1] https://patchwork.kernel.org/patch/2848065/

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---
 drivers/clk/clk-divider.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
index df7290c..92605bc 100644
--- a/drivers/clk/clk-divider.c
+++ b/drivers/clk/clk-divider.c
@@ -617,10 +617,10 @@ EXPORT_SYMBOL_GPL(clk_hw_unregister_divider);
 
 
 #ifdef CONFIG_OF
-struct clk_div_table *of_clk_get_div_table(struct device_node *node)
+static struct clk_div_table *of_clk_get_div_table(struct device_node *node)
 {
 	int i;
-	u32 table_size;
+	unsigned int table_size;
 	struct clk_div_table *table;
 	const __be32 *tablespec;
 	u32 val;
@@ -634,7 +634,8 @@ struct clk_div_table *of_clk_get_div_table(struct device_node *node)
 
 	table = kzalloc(sizeof(struct clk_div_table) * table_size, GFP_KERNEL);
 	if (!table) {
-		pr_err("%s: unable to allocate memory for %s table\n", __func__, node->name);
+		pr_err("%s: unable to allocate memory for %s table\n", __func__,
+		       node->name);
 		return NULL;
 	}
 
@@ -653,7 +654,7 @@ struct clk_div_table *of_clk_get_div_table(struct device_node *node)
  */
 void of_divider_clk_setup(struct device_node *node)
 {
-	struct clk *clk;
+	struct clk_hw *hw;
 	const char *clk_name = node->name;
 	void __iomem *reg;
 	const char *parent_name;
@@ -673,7 +674,8 @@ void of_divider_clk_setup(struct device_node *node)
 	}
 
 	if (of_property_read_u32(node, "bit-mask", &mask)) {
-		pr_err("%s: missing bit-mask property for %s\n", __func__, node->name);
+		pr_err("%s: missing bit-mask property for %s\n", __func__,
+		       node->name);
 		return;
 	}
 
@@ -699,11 +701,11 @@ void of_divider_clk_setup(struct device_node *node)
 	if (IS_ERR(table))
 		return;
 
-	clk = _register_divider(NULL, clk_name, parent_name, 0, reg, shift,
+	hw = _register_divider(NULL, clk_name, parent_name, 0, reg, shift,
 			mask, clk_divider_flags, table, NULL);
 
-	if (!IS_ERR(clk))
-		of_clk_add_provider(node, of_clk_src_simple_get, clk);
+	if (!IS_ERR(hw))
+		of_clk_add_provider(node, of_clk_src_simple_get, hw->clk);
 }
 EXPORT_SYMBOL_GPL(of_divider_clk_setup);
 CLK_OF_DECLARE(divider_clk, "divider-clock", of_divider_clk_setup);
-- 
2.7.4
