From: Rob Herring <robh@kernel.org>
Subject: [PATCH] of: add node name compare helper functions
Date: Thu, 30 Aug 2018 13:52:16 -0500
Message-ID: <20180830185216.20054-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

In preparation to remove device_node.name pointer, add helper functions
for node name comparisons which are a common pattern throughout the kernel.

Cc: Frank Rowand <frowand.list@gmail.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/of/base.c  | 22 ++++++++++++++++++++++
 include/linux/of.h | 13 +++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 466e3c8582f0..185bfe077d0a 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -54,6 +54,28 @@ DEFINE_MUTEX(of_mutex);
  */
 DEFINE_RAW_SPINLOCK(devtree_lock);
 
+bool of_node_name_eq(const struct device_node *np, const char *name)
+{
+	const char *node_name;
+	size_t len;
+
+	if (!np)
+		return false;
+
+	node_name = kbasename(np->full_name);
+	len = strchrnul(node_name, '@') - node_name;
+
+	return (strlen(name) == len) && (strncmp(node_name, name, len) == 0);
+}
+
+bool of_node_name_prefix(const struct device_node *np, const char *prefix)
+{
+	if (!np)
+		return false;
+
+	return strncmp(kbasename(np->full_name), prefix, strlen(prefix)) == 0;
+}
+
 int of_n_addr_cells(struct device_node *np)
 {
 	u32 cells;
diff --git a/include/linux/of.h b/include/linux/of.h
index 4d25e4f952d9..a40f63a36afa 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -256,6 +256,9 @@ static inline unsigned long of_read_ulong(const __be32 *cell, int size)
 #define OF_IS_DYNAMIC(x) test_bit(OF_DYNAMIC, &x->_flags)
 #define OF_MARK_DYNAMIC(x) set_bit(OF_DYNAMIC, &x->_flags)
 
+extern bool of_node_name_eq(const struct device_node *np, const char *name);
+extern bool of_node_name_prefix(const struct device_node *np, const char *prefix);
+
 static inline const char *of_node_full_name(const struct device_node *np)
 {
 	return np ? np->full_name : "<no-node>";
@@ -561,6 +564,16 @@ static inline struct device_node *to_of_node(const struct fwnode_handle *fwnode)
 	return NULL;
 }
 
+static inline bool of_node_name_eq(const struct device_node *np, const char *name)
+{
+	return false;
+}
+
+static inline bool of_node_name_prefix(const struct device_node *np, const char *prefix)
+{
+	return false;
+}
+
 static inline const char* of_node_full_name(const struct device_node *np)
 {
 	return "<no-node>";
-- 
2.17.1
