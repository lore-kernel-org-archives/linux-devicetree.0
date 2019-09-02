From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v4 01/11] software node: Get reference to parent swnode in get_parent op
Date: Mon,  2 Sep 2019 11:32:30 +0300
Message-ID: <20190902083240.20367-2-sakari.ailus@linux.intel.com>
References: <20190902083240.20367-1-sakari.ailus@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190902083240.20367-1-sakari.ailus@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Petr Mladek <pmladek@suse.com>, linux-kernel@vger.kernel.org, rafael@kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-acpi@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>
List-Id: devicetree@vger.kernel.org

The software_node_get_parent() returned a pointer to the parent swnode,
but did not take a reference to it, leading the caller to put a reference
that was not taken. Take that reference now.

Fixes: 59abd83672f7 ("drivers: base: Introducing software nodes to the firmware node framework")
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/base/swnode.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index e7b3aa3bd55ad..a7cb41812cfda 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -520,7 +520,10 @@ software_node_get_parent(const struct fwnode_handle *fwnode)
 {
 	struct swnode *swnode = to_swnode(fwnode);
 
-	return swnode ? (swnode->parent ? &swnode->parent->fwnode : NULL) : NULL;
+	if (!swnode || !swnode->parent)
+		return NULL;
+
+	return fwnode_handle_get(&swnode->parent->fwnode);
 }
 
 static struct fwnode_handle *
-- 
2.20.1
