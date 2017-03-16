From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v3 2/4] device property: Implement fwnode_get_next_parent() using fwnode interface
Date: Thu, 16 Mar 2017 15:34:47 +0200
Message-ID: <1489671289-20406-3-git-send-email-sakari.ailus@linux.intel.com>
References: <1489671289-20406-1-git-send-email-sakari.ailus@linux.intel.com>
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <1489671289-20406-1-git-send-email-sakari.ailus@linux.intel.com>
Sender: linux-acpi-owner@vger.kernel.org
To: linux-acpi@vger.kernel.org, devicetree@vger.kernel.org
Cc: sudeep.holla@arm.com, lorenzo.pieralisi@arm.com, mika.westerberg@linux.intel.com, rafael@kernel.org, mark.rutland@arm.com, broonie@kernel.org, robh@kernel.org, ahs3@redhat.com
List-Id: devicetree@vger.kernel.org

fwnode_get_next_parent() can be implemented using fwnode interface. Do
that to avoid implementing an additional callback for the function in
struct fwnode_operations.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/base/property.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 6d9476a..9f3d80d 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -945,17 +945,9 @@ EXPORT_SYMBOL_GPL(device_add_properties);
  */
 struct fwnode_handle *fwnode_get_next_parent(struct fwnode_handle *fwnode)
 {
-	struct fwnode_handle *parent = NULL;
+	struct fwnode_handle *parent = fwnode_call_ptr_op(fwnode, get_parent);
 
-	if (is_of_node(fwnode)) {
-		struct device_node *node;
-
-		node = of_get_next_parent(to_of_node(fwnode));
-		if (node)
-			parent = &node->fwnode;
-	} else if (is_acpi_node(fwnode)) {
-		parent = acpi_node_get_parent(fwnode);
-	}
+	fwnode_handle_put(fwnode);
 
 	return parent;
 }
-- 
2.7.4

