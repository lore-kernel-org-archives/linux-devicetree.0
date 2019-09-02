From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v5 04/11] device property: Add functions for accessing node's parents
Date: Mon,  2 Sep 2019 16:57:25 +0300
Message-ID: <20190902135732.23455-5-sakari.ailus@linux.intel.com>
References: <20190902135732.23455-1-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190902135732.23455-1-sakari.ailus@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, rafael@kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
List-Id: devicetree@vger.kernel.org

Add two convenience functions for accessing node's parents:

fwnode_count_parents() returns the number of parent nodes a given node
has. fwnode_get_nth_parent() returns node's parent at a given distance
from the node itself.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/base/property.c  | 46 ++++++++++++++++++++++++++++++++++++++++
 include/linux/property.h |  3 +++
 2 files changed, 49 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 3d9dffbe96378..f2e555e68b56a 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -590,6 +590,52 @@ struct fwnode_handle *fwnode_get_next_parent(struct fwnode_handle *fwnode)
 }
 EXPORT_SYMBOL_GPL(fwnode_get_next_parent);
 
+/**
+ * fwnode_count_parents - Return the number of parents a node has
+ * @fwnode: The node the parents of which are to be counted
+ *
+ * Returns the number of parents a node has.
+ */
+unsigned int fwnode_count_parents(const struct fwnode_handle *fwnode)
+{
+	struct fwnode_handle *__fwnode;
+	unsigned int count;
+
+	__fwnode = fwnode_get_parent(fwnode);
+
+	for (count = 0; __fwnode; count++)
+		__fwnode = fwnode_get_next_parent(__fwnode);
+
+	return count;
+}
+EXPORT_SYMBOL_GPL(fwnode_count_parents);
+
+/**
+ * fwnode_get_nth_parent - Return an nth parent of a node
+ * @fwnode: The node the parent of which is requested
+ * @depth: Distance of the parent from the node
+ *
+ * Returns the nth parent of a node. If there is no parent at the requested
+ * @depth, %NULL is returned. If @depth is 0, the functionality is equivalent to
+ * fwnode_handle_get(). For @depth == 1, it is fwnode_get_parent() and so on.
+ *
+ * The caller is responsible for calling fwnode_handle_put() for the returned
+ * node.
+ */
+struct fwnode_handle *fwnode_get_nth_parent(struct fwnode_handle *fwnode,
+					    unsigned int depth)
+{
+	unsigned int i;
+
+	fwnode_handle_get(fwnode);
+
+	for (i = 0; i < depth && fwnode; i++)
+		fwnode = fwnode_get_next_parent(fwnode);
+
+	return fwnode;
+}
+EXPORT_SYMBOL_GPL(fwnode_get_nth_parent);
+
 /**
  * fwnode_get_next_child_node - Return the next child node handle for a node
  * @fwnode: Firmware node to find the next child node for.
diff --git a/include/linux/property.h b/include/linux/property.h
index 421c76e53708d..5450e7ec219ac 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -83,6 +83,9 @@ struct fwnode_handle *fwnode_find_reference(const struct fwnode_handle *fwnode,
 struct fwnode_handle *fwnode_get_parent(const struct fwnode_handle *fwnode);
 struct fwnode_handle *fwnode_get_next_parent(
 	struct fwnode_handle *fwnode);
+unsigned int fwnode_count_parents(const struct fwnode_handle *fwn);
+struct fwnode_handle *fwnode_get_nth_parent(struct fwnode_handle *fwn,
+					    unsigned int depth);
 struct fwnode_handle *fwnode_get_next_child_node(
 	const struct fwnode_handle *fwnode, struct fwnode_handle *child);
 struct fwnode_handle *fwnode_get_next_available_child_node(
-- 
2.20.1
