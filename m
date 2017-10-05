From: Rob Herring <robh@kernel.org>
Subject: [PATCH 5/6] of: wrap accesses to device_node kobject
Date: Thu,  5 Oct 2017 14:44:21 -0500
Message-ID: <20171005194422.26224-6-robh@kernel.org>
References: <20171005194422.26224-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171005194422.26224-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Nicolas Pitre <nico@linaro.org>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <glikely@secretlab.ca>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: devicetree@vger.kernel.org

In preparation to make kobject element in struct device_node optional,
provide and use a macro to return the kobject pointer. The only user
outside the DT core is the driver core.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nicolas Pitre <nico@linaro.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/base/core.c | 2 +-
 include/linux/of.h  | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 12ebd055724c..c07b47059538 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1571,7 +1571,7 @@ static int device_add_class_symlinks(struct device *dev)
 	int error;
 
 	if (of_node) {
-		error = sysfs_create_link(&dev->kobj, &of_node->kobj,"of_node");
+		error = sysfs_create_link(&dev->kobj, of_node_kobj(of_node), "of_node");
 		if (error)
 			dev_warn(dev, "Error %d creating of_node link\n",error);
 		/* An error here doesn't warrant bringing down the device */
diff --git a/include/linux/of.h b/include/linux/of.h
index 7eb94b7fbcf3..2d685e769409 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -111,6 +111,8 @@ static inline void of_node_init(struct device_node *node)
 	node->fwnode.ops = &of_fwnode_ops;
 }
 
+#define of_node_kobj(n) (&(n)->kobj)
+
 /* true when node is initialized */
 static inline int of_node_is_initialized(struct device_node *node)
 {
-- 
2.11.0
