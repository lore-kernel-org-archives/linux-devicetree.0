From: Michal Simek <michal.simek@xilinx.com>
Subject: [RESEND PATCH v3 1/2] of: base: Introduce of_alias_get_alias_list() to check alias IDs
Date: Thu, 20 Sep 2018 13:41:52 +0200
Message-ID: <b1772d99d4e8b788448cde0fc5c7dccb1f63b507.1537443710.git.michal.simek@xilinx.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, monstr@monstr.eu, gregkh@linuxfoundation.org
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

The function travels the lookup table to record alias ids for the given
device match structures and alias stem.
This function will be used by serial drivers to check if requested alias
is allocated or free to use.

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---

Changes in v3:
- Fix subject s/of_alias_check_id/of_alias_get_alias_list/
- And also fix commit message description to match
  of_alias_get_alias_list()
- mark empty function with inline

Changes in v2:
- Add empty function for !CONFIG_OF case
- Add return to that function
- Add Rob's Reviewed-by tag

Based on discussion with Rob
https://lkml.org/lkml/2018/4/27/397
nbits is passed to the function not to limit only to 32/64bit fields.

Greg: Please apply this together with serial: uartps: Change uart ID
port allocation. Rob is fine with that (link above)

---
 drivers/of/base.c  | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/of.h | 10 ++++++++++
 2 files changed, 62 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 74eaedd5b860..33011b88ed3f 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -16,6 +16,7 @@
 
 #define pr_fmt(fmt)	"OF: " fmt
 
+#include <linux/bitmap.h>
 #include <linux/console.h>
 #include <linux/ctype.h>
 #include <linux/cpu.h>
@@ -1943,6 +1944,57 @@ int of_alias_get_id(struct device_node *np, const char *stem)
 EXPORT_SYMBOL_GPL(of_alias_get_id);
 
 /**
+ * of_alias_get_alias_list - Get alias list for the given device driver
+ * @matches:	Array of OF device match structures to search in
+ * @stem:	Alias stem of the given device_node
+ * @bitmap:	Bitmap field pointer
+ * @nbits:	Maximum number of alias ID which can be recorded it bitmap
+ *
+ * The function travels the lookup table to record alias ids for the given
+ * device match structures and alias stem.
+ *
+ * Return:	0 or -ENOSYS when !CONFIG_OF
+ */
+int of_alias_get_alias_list(const struct of_device_id *matches,
+			     const char *stem, unsigned long *bitmap,
+			     unsigned int nbits)
+{
+	struct alias_prop *app;
+
+	/* Zero bitmap field to make sure that all the time it is clean */
+	bitmap_zero(bitmap, nbits);
+
+	mutex_lock(&of_mutex);
+	pr_debug("%s: Looking for stem: %s\n", __func__, stem);
+	list_for_each_entry(app, &aliases_lookup, link) {
+		pr_debug("%s: stem: %s, id: %d\n",
+			 __func__, app->stem, app->id);
+
+		if (strcmp(app->stem, stem) != 0) {
+			pr_debug("%s: stem comparison doesn't passed %s\n",
+				 __func__, app->stem);
+			continue;
+		}
+
+		if (app->id >= nbits) {
+			pr_debug("%s: ID %d greater then bitmap field %d\n",
+				__func__, app->id, nbits);
+			continue;
+		}
+
+		if (of_match_node(matches, app->np)) {
+			pr_debug("%s: Allocated ID %d\n", __func__, app->id);
+			set_bit(app->id, bitmap);
+		}
+		/* Alias exist but it not compatible with matches */
+	}
+	mutex_unlock(&of_mutex);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(of_alias_get_alias_list);
+
+/**
  * of_alias_get_highest_id - Get highest alias id for the given stem
  * @stem:	Alias stem to be examined
  *
diff --git a/include/linux/of.h b/include/linux/of.h
index 99b0ebf49632..d51457b40725 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -392,6 +392,9 @@ extern int of_phandle_iterator_args(struct of_phandle_iterator *it,
 extern void of_alias_scan(void * (*dt_alloc)(u64 size, u64 align));
 extern int of_alias_get_id(struct device_node *np, const char *stem);
 extern int of_alias_get_highest_id(const char *stem);
+extern int of_alias_get_alias_list(const struct of_device_id *matches,
+				   const char *stem, unsigned long *bitmap,
+				   unsigned int nbits);
 
 extern int of_machine_is_compatible(const char *compat);
 
@@ -893,6 +896,13 @@ static inline int of_alias_get_highest_id(const char *stem)
 	return -ENOSYS;
 }
 
+static inline int of_alias_get_alias_list(const struct of_device_id *matches,
+					  const char *stem, unsigned long *bitmap,
+					  unsigned int nbits)
+{
+	return -ENOSYS;
+}
+
 static inline int of_machine_is_compatible(const char *compat)
 {
 	return 0;
-- 
1.9.1
