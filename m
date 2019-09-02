From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v5 03/11] device property: Move fwnode_get_parent() up
Date: Mon,  2 Sep 2019 16:57:24 +0300
Message-ID: <20190902135732.23455-4-sakari.ailus@linux.intel.com>
References: <20190902135732.23455-1-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190902135732.23455-1-sakari.ailus@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, rafael@kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
List-Id: devicetree@vger.kernel.org

Move fwnode_get_parent() above fwnode_get_next_parent(), making the order
the same as in the header file.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/base/property.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 81bd01ed40427..3d9dffbe96378 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -556,6 +556,19 @@ int device_add_properties(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(device_add_properties);
 
+/**
+ * fwnode_get_parent - Return parent firwmare node
+ * @fwnode: Firmware whose parent is retrieved
+ *
+ * Return parent firmware node of the given node if possible or %NULL if no
+ * parent was available.
+ */
+struct fwnode_handle *fwnode_get_parent(const struct fwnode_handle *fwnode)
+{
+	return fwnode_call_ptr_op(fwnode, get_parent);
+}
+EXPORT_SYMBOL_GPL(fwnode_get_parent);
+
 /**
  * fwnode_get_next_parent - Iterate to the node's parent
  * @fwnode: Firmware whose parent is retrieved
@@ -577,19 +590,6 @@ struct fwnode_handle *fwnode_get_next_parent(struct fwnode_handle *fwnode)
 }
 EXPORT_SYMBOL_GPL(fwnode_get_next_parent);
 
-/**
- * fwnode_get_parent - Return parent firwmare node
- * @fwnode: Firmware whose parent is retrieved
- *
- * Return parent firmware node of the given node if possible or %NULL if no
- * parent was available.
- */
-struct fwnode_handle *fwnode_get_parent(const struct fwnode_handle *fwnode)
-{
-	return fwnode_call_ptr_op(fwnode, get_parent);
-}
-EXPORT_SYMBOL_GPL(fwnode_get_parent);
-
 /**
  * fwnode_get_next_child_node - Return the next child node handle for a node
  * @fwnode: Firmware node to find the next child node for.
-- 
2.20.1
