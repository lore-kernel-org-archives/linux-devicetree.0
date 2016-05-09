From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: [PATCH 2/4] of: dynamic: Add __of_node_dupv()
Date: Mon,  9 May 2016 16:20:43 +0300
Message-ID: <1462800045-10943-3-git-send-email-pantelis.antoniou@konsulko.com>
References: <1462800045-10943-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462800045-10943-1-git-send-email-pantelis.antoniou@konsulko.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Matt Porter <mporter@konsulko.com>, Koen Kooi <koen@dominion.thruhere.net>, Guenter Roeck <linux@roeck-us.net>, Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-Id: devicetree@vger.kernel.org

Add an __of_node_dupv() private method and make __of_node_dup() use it.
This is required for the subsequent changeset accessors which will
make use of it.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
---
 drivers/of/dynamic.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index 4145b44..e4dea94 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -394,8 +394,9 @@ struct property *__of_prop_dup(const struct property *prop, gfp_t allocflags)
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
@@ -403,17 +404,15 @@ struct property *__of_prop_dup(const struct property *prop, gfp_t allocflags)
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
@@ -445,6 +444,24 @@ struct device_node *__of_node_dup(const struct device_node *np, const char *fmt,
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
1.7.12
