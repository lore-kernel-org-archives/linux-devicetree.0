From: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 2/2] clk-fixed-rate: support specified-clock binding
Date: Wed, 13 Nov 2013 21:50:00 +0000
Message-ID: <1384379400-24776-3-git-send-email-james.hogan@imgtec.com>
References: <1384379400-24776-1-git-send-email-james.hogan@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384379400-24776-1-git-send-email-james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: linux-metag-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-metag-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Implement the new specified-clock DT binding which uses a table to look
up the fixed frequency based on the value in a register.

The discovery is done entirely within of_specified_clk_setup() since the
clock rate is still fixed so there's no need to dynamically rediscover
the rate. The register is iomapped, read, and iounmapped, then the field
value is extracted and used to look up the clock frequency in the table
property.

Signed-off-by: James Hogan <james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
---
Changes in v2:
 * Rewrite to use a fixed clock instead of an entirely new clock type.
---
 drivers/clk/clk-fixed-rate.c | 51 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/clk-provider.h |  1 +
 2 files changed, 52 insertions(+)

diff --git a/drivers/clk/clk-fixed-rate.c b/drivers/clk/clk-fixed-rate.c
index 1ed591ab8b1d..7d7ec4094961 100644
--- a/drivers/clk/clk-fixed-rate.c
+++ b/drivers/clk/clk-fixed-rate.c
@@ -9,12 +9,14 @@
  * Fixed rate clock implementation
  */
 
+#include <linux/bitops.h>
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/io.h>
 #include <linux/err.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 
 /*
  * DOC: basic fixed-rate clock that cannot gate
@@ -103,4 +105,53 @@ void of_fixed_clk_setup(struct device_node *node)
 }
 EXPORT_SYMBOL_GPL(of_fixed_clk_setup);
 CLK_OF_DECLARE(fixed_clk, "fixed-clock", of_fixed_clk_setup);
+
+/**
+ * of_specified_clk_setup() - Setup function for discoverable fixed rate clock
+ */
+void of_specified_clk_setup(struct device_node *node)
+{
+	struct clk *clk;
+	const char *clk_name = node->name;
+	u32 shift, mask, rate, reg_val, val;
+	void __iomem *reg;
+	struct property *prop;
+	const __be32 *p;
+
+	/* Iomap and read the configuration register */
+	reg = of_iomap(node, 0);
+	if (!reg)
+		return;
+	reg_val = readl(reg);
+	iounmap(reg);
+
+	/* Apply bit-mask */
+	if (of_property_read_u32(node, "bit-mask", &mask))
+		return;
+	reg_val &= mask;
+	/* Apply bit-shift */
+	if (of_property_read_u32(node, "bit-shift", &shift))
+		shift = ffs(mask) - 1;
+	reg_val >>= shift;
+
+	/* Look through the mapping for a matching frequency */
+	of_property_for_each_u32(node, "table", prop, p, val) {
+		p = of_prop_next_u32(prop, p, &rate);
+		if (!p)
+			break;
+		if (val == reg_val)
+			goto found_rate;
+	}
+	/* No match found */
+	return;
+found_rate:
+
+	of_property_read_string(node, "clock-output-names", &clk_name);
+
+	clk = clk_register_fixed_rate(NULL, clk_name, NULL, CLK_IS_ROOT, rate);
+	if (!IS_ERR(clk))
+		of_clk_add_provider(node, of_clk_src_simple_get, clk);
+}
+EXPORT_SYMBOL_GPL(of_specified_clk_setup);
+CLK_OF_DECLARE(specified_clk, "specified-clock", of_specified_clk_setup);
 #endif
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 7e59253b8603..0e1312504da9 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -203,6 +203,7 @@ struct clk *clk_register_fixed_rate(struct device *dev, const char *name,
 		unsigned long fixed_rate);
 
 void of_fixed_clk_setup(struct device_node *np);
+void of_specified_clk_setup(struct device_node *np);
 
 /**
  * struct clk_gate - gating clock
-- 
1.8.1.2


--
To unsubscribe from this list: send the line "unsubscribe linux-metag" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
