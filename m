From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v3 12/16] device property: Move dev_fwnode() to linux/property.h
Date: Thu, 23 Feb 2017 18:19:32 +0200
Message-ID: <1487866776-24578-13-git-send-email-sakari.ailus@linux.intel.com>
References: <1487866776-24578-1-git-send-email-sakari.ailus@linux.intel.com>
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <1487866776-24578-1-git-send-email-sakari.ailus@linux.intel.com>
Sender: linux-acpi-owner@vger.kernel.org
To: linux-acpi@vger.kernel.org, devicetree@vger.kernel.org
Cc: sudeep.holla@arm.com, lorenzo.pieralisi@arm.com, mika.westerberg@linux.intel.com, rafael@kernel.org, mark.rutland@arm.com, broonie@kernel.org, robh@kernel.org, ahs3@redhat.com
List-Id: devicetree@vger.kernel.org

The function to obtain a fwnode related to a struct device is useful for
drivers that use the fwnode property API: it allows not being aware of the
underlying firmware implementation.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/base/property.c  |  6 ------
 include/linux/property.h | 10 ++++++++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 760c6c5..cf8bc2f 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -183,12 +183,6 @@ static int pset_prop_read_string(struct property_set *pset,
 	return 0;
 }
 
-static inline struct fwnode_handle *dev_fwnode(struct device *dev)
-{
-	return IS_ENABLED(CONFIG_OF) && dev->of_node ?
-		&dev->of_node->fwnode : dev->fwnode;
-}
-
 /**
  * device_property_present - check if a property of a device is present
  * @dev: Device whose property is being checked
diff --git a/include/linux/property.h b/include/linux/property.h
index b4b1545..09a75b1 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -13,11 +13,11 @@
 #ifndef _LINUX_PROPERTY_H_
 #define _LINUX_PROPERTY_H_
 
+#include <linux/device.h>
 #include <linux/fwnode.h>
+#include <linux/of.h>
 #include <linux/types.h>
 
-struct device;
-
 enum dev_prop_type {
 	DEV_PROP_U8,
 	DEV_PROP_U16,
@@ -33,6 +33,12 @@ enum dev_dma_attr {
 	DEV_DMA_COHERENT,
 };
 
+static inline struct fwnode_handle *dev_fwnode(struct device *dev)
+{
+	return IS_ENABLED(CONFIG_OF) && dev->of_node ?
+		&dev->of_node->fwnode : dev->fwnode;
+}
+
 bool device_property_present(struct device *dev, const char *propname);
 int device_property_read_u8_array(struct device *dev, const char *propname,
 				  u8 *val, size_t nval);
-- 
2.7.4

