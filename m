From: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH RFC v3 1/2] clk: Add function parsing arbitrary clock list DT
 property
Date: Thu, 27 Mar 2014 13:16:18 +0100
Message-ID: <1395922579-28547-2-git-send-email-s.nawrocki@samsung.com>
References: <1395922579-28547-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1395922579-28547-1-git-send-email-s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The of_clk_get_by_property() function added by this patch is similar to
of_clk_get(), except it allows to pass name of a DT property containing
list of phandles and clock specifiers. For of_clk_get() this has been
hard coded to "clocks".

Signed-off-by: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
Changes since v2:
 - moved the function declaration from drivers/clk/clk.h to
   include/linux/clk.h

Changes since v1:
 - s/of_clk_get_list_entry/of_clk_get_by_property.
---
 drivers/clk/clkdev.c |   25 +++++++++++++++++++++----
 include/linux/clk.h  |    7 +++++++
 2 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/clkdev.c b/drivers/clk/clkdev.c
index a360b2e..1d41540 100644
--- a/drivers/clk/clkdev.c
+++ b/drivers/clk/clkdev.c
@@ -27,17 +27,28 @@ static LIST_HEAD(clocks);
 static DEFINE_MUTEX(clocks_mutex);
 
 #if defined(CONFIG_OF) && defined(CONFIG_COMMON_CLK)
-struct clk *of_clk_get(struct device_node *np, int index)
+/**
+ * of_clk_get_by_property() - Parse and lookup a clock referenced by a device node
+ * @np: pointer to clock consumer node
+ * @list_name: name of the clock list property
+ * @index: index to the clock list
+ *
+ * This function parses the @list_name property and together with @index
+ * value indicating an entry of the list uses it to look up the struct clk
+ * from the registered list of clock providers.
+ */
+struct clk *of_clk_get_by_property(struct device_node *np,
+				   const char *list_name, int index)
 {
 	struct of_phandle_args clkspec;
 	struct clk *clk;
 	int rc;
 
-	if (index < 0)
+	if (index < 0 || !list_name)
 		return ERR_PTR(-EINVAL);
 
-	rc = of_parse_phandle_with_args(np, "clocks", "#clock-cells", index,
-					&clkspec);
+	rc = of_parse_phandle_with_args(np, list_name, "#clock-cells",
+					index, &clkspec);
 	if (rc)
 		return ERR_PTR(rc);
 
@@ -51,6 +62,12 @@ struct clk *of_clk_get(struct device_node *np, int index)
 	of_node_put(clkspec.np);
 	return clk;
 }
+EXPORT_SYMBOL(of_clk_get_by_property);
+
+struct clk *of_clk_get(struct device_node *np, int index)
+{
+	return of_clk_get_by_property(np, "clocks", index);
+}
 EXPORT_SYMBOL(of_clk_get);
 
 /**
diff --git a/include/linux/clk.h b/include/linux/clk.h
index 0dd9114..f71235b 100644
--- a/include/linux/clk.h
+++ b/include/linux/clk.h
@@ -383,6 +383,8 @@ struct of_phandle_args;
 
 #if defined(CONFIG_OF) && defined(CONFIG_COMMON_CLK)
 struct clk *of_clk_get(struct device_node *np, int index);
+struct clk *of_clk_get_by_property(struct device_node *np,
+				   const char *list_name, int index);
 struct clk *of_clk_get_by_name(struct device_node *np, const char *name);
 struct clk *of_clk_get_from_provider(struct of_phandle_args *clkspec);
 #else
@@ -395,6 +397,11 @@ static inline struct clk *of_clk_get_by_name(struct device_node *np,
 {
 	return ERR_PTR(-ENOENT);
 }
+struct clk *of_clk_get_by_property(struct device_node *np,
+				   const char *list_name, int index)
+{
+	return ERR_PTR(-ENOENT);
+}
 #endif
 
 #endif
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
