From: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
Subject: [PATCH 1/4] clk: fractional-divider: add a read only version
Date: Fri, 21 Nov 2014 19:34:00 +0100
Message-ID: <1416594843-12352-1-git-send-email-albeu@free.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alban Bedel <albeu-GANU6spQydw@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Allow defining fractional dividers that can't be set.

Signed-off-by: Alban Bedel <albeu-GANU6spQydw@public.gmane.org>
---
 drivers/clk/clk-fractional-divider.c | 10 +++++++++-
 include/linux/clk-provider.h         |  3 +++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-fractional-divider.c b/drivers/clk/clk-fractional-divider.c
index 82a59d0..b562281 100644
--- a/drivers/clk/clk-fractional-divider.c
+++ b/drivers/clk/clk-fractional-divider.c
@@ -96,6 +96,11 @@ const struct clk_ops clk_fractional_divider_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_fractional_divider_ops);
 
+const struct clk_ops clk_fractional_divider_ro_ops = {
+	.recalc_rate = clk_fd_recalc_rate,
+};
+EXPORT_SYMBOL_GPL(clk_fractional_divider_ro_ops);
+
 struct clk *clk_register_fractional_divider(struct device *dev,
 		const char *name, const char *parent_name, unsigned long flags,
 		void __iomem *reg, u8 mshift, u8 mwidth, u8 nshift, u8 nwidth,
@@ -112,7 +117,10 @@ struct clk *clk_register_fractional_divider(struct device *dev,
 	}
 
 	init.name = name;
-	init.ops = &clk_fractional_divider_ops;
+	if (clk_divider_flags & CLK_FRACTIONAL_DIVIDER_READ_ONLY)
+		init.ops = &clk_fractional_divider_ro_ops;
+	else
+		init.ops = &clk_fractional_divider_ops;
 	init.flags = flags | CLK_IS_BASIC;
 	init.parent_names = parent_name ? &parent_name : NULL;
 	init.num_parents = parent_name ? 1 : 0;
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index be21af1..29ea77a 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -462,7 +462,10 @@ struct clk_fractional_divider {
 	spinlock_t	*lock;
 };
 
+#define CLK_FRACTIONAL_DIVIDER_READ_ONLY		BIT(0)
+
 extern const struct clk_ops clk_fractional_divider_ops;
+extern const struct clk_ops clk_fractional_divider_ro_ops;
 struct clk *clk_register_fractional_divider(struct device *dev,
 		const char *name, const char *parent_name, unsigned long flags,
 		void __iomem *reg, u8 mshift, u8 mwidth, u8 nshift, u8 nwidth,
-- 
2.0.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
