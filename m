From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/8] clk: add helper for unique DT clock names
Date: Sun, 11 May 2014 22:24:34 +0200
Message-ID: <1399839881-29895-2-git-send-email-sebastian.hesselbarth@gmail.com>
References: <1399839881-29895-1-git-send-email-sebastian.hesselbarth@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399839881-29895-1-git-send-email-sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Currently, most DT clock drivers pick a unique node name to allow unique
clock names. As ePAPR recommends node names to be generic, we therefore
provide a helper to generate a unique clock name from the DT node name
plus reg property or a magic number instead. This is basically the same
we already do for proper devices and may vanish as soon as there is some
(early) device support for clocks available.

Signed-off-by: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 drivers/clk/clk.c            | 29 +++++++++++++++++++++++++++++
 include/linux/clk-provider.h |  5 +++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index dff0373f53c1..b449a635dbfa 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -17,6 +17,7 @@
 #include <linux/list.h>
 #include <linux/slab.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/sched.h>
@@ -2543,6 +2544,34 @@ const char *of_clk_get_parent_name(struct device_node *np, int index)
 }
 EXPORT_SYMBOL_GPL(of_clk_get_parent_name);
 
+/**
+ * of_clk_create_name() - Allocate and create a unique clock name
+ * @np: Device node pointer of the clock node
+ *
+ * This will allocate and create a unique clock name based on the
+ * reg property value. As a last resort, it will use the node name
+ * followed by a unique number. The caller has to deallocate the
+ * buffer.
+ */
+char *of_clk_create_name(struct device_node *np)
+{
+	static atomic_t clk_no_reg_magic;
+	const __be32 *reg;
+	u64 addr;
+	int magic;
+
+	reg = of_get_property(np, "reg", NULL);
+	if (reg) {
+		addr = of_translate_address(np, reg);
+		return kasprintf(GFP_KERNEL, "%llx.%s",
+				 (unsigned long long)addr, np->name);
+	}
+
+	magic = atomic_add_return(1, &clk_no_reg_magic);
+	return kasprintf(GFP_KERNEL, "%s.%d", np->name, magic);
+}
+EXPORT_SYMBOL_GPL(of_clk_create_name);
+
 struct clock_provider {
 	of_clk_init_cb_t clk_init_cb;
 	struct device_node *np;
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 511917416fb0..c6f3ca1cd81c 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -514,6 +514,7 @@ struct clk *of_clk_src_simple_get(struct of_phandle_args *clkspec,
 struct clk *of_clk_src_onecell_get(struct of_phandle_args *clkspec, void *data);
 int of_clk_get_parent_count(struct device_node *np);
 const char *of_clk_get_parent_name(struct device_node *np, int index);
+char *of_clk_create_name(struct device_node *np);
 
 void of_clk_init(const struct of_device_id *matches);
 
@@ -543,6 +544,10 @@ static inline const char *of_clk_get_parent_name(struct device_node *np,
 {
 	return NULL;
 }
+static inline char *of_clk_create_name(struct device_node *np)
+{
+	return NULL;
+}
 #define of_clk_init(matches) \
 	{ while (0); }
 #endif /* CONFIG_OF */
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
