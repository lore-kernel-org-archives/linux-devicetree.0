From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 1/2] of: dynamic: Add __of_node_dupv()
Date: Fri,  4 Nov 2016 15:42:40 +0100
Message-ID: <20161104144241.18002-1-hdegoede@redhat.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>

Add an __of_node_dupv() private method and make __of_node_dup() use it.
This is required for the subsequent changeset accessors which will
make use of it.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
Changes in v2 (hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org):
-No changes (unmodified preparation patch)
---
 drivers/of/dynamic.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index 888fdbc..cc64675 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -397,8 +397,9 @@ struct property *__of_prop_dup(const struct property *prop, gfp_t allocflags)
 }
 
 /**
- * __of_node_dup() - Duplicate or create an empty device node dynamically.
- * @fmt: Format string (plus vargs) for new full name of the device node
+ * __of_node_dupv() - Duplicate or create an empty device node dynamically.
+ * @fmt: Format string for new full name of the device node
+ * @vargs: va_list containing the arugments for the node full name
  *
  * Create an device tree node, either by duplicating an empty node or by allocating
  * an empty one suitable for further modification.  The node data are
@@ -406,17 +407,15 @@ struct property *__of_prop_dup(const struct property *prop, gfp_t allocflags)
  * OF_DETACHED bits set. Returns the newly allocated node or NULL on out of
  * memory error.
  */
-struct device_node *__of_node_dup(const struct device_node *np, const char *fmt, ...)
+struct device_node *__of_node_dupv(const struct device_node *np,
+		const char *fmt, va_list vargs)
 {
-	va_list vargs;
 	struct device_node *node;
 
 	node = kzalloc(sizeof(*node), GFP_KERNEL);
 	if (!node)
 		return NULL;
-	va_start(vargs, fmt);
 	node->full_name = kvasprintf(GFP_KERNEL, fmt, vargs);
-	va_end(vargs);
 	if (!node->full_name) {
 		kfree(node);
 		return NULL;
@@ -448,6 +447,24 @@ struct device_node *__of_node_dup(const struct device_node *np, const char *fmt,
 	return NULL;
 }
 
+/**
+ * __of_node_dup() - Duplicate or create an empty device node dynamically.
+ * @fmt: Format string (plus vargs) for new full name of the device node
+ *
+ * See: __of_node_dupv()
+ */
+struct device_node *__of_node_dup(const struct device_node *np,
+		const char *fmt, ...)
+{
+	va_list vargs;
+	struct device_node *node;
+
+	va_start(vargs, fmt);
+	node = __of_node_dupv(np, fmt, vargs);
+	va_end(vargs);
+	return node;
+}
+
 static void __of_changeset_entry_destroy(struct of_changeset_entry *ce)
 {
 	of_node_put(ce->np);
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
