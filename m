From: Vijay Kumar <vijay.ac.kumar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 1/2] usb/core: Added devspec sysfs entry for devices behind the usb hub
Date: Thu,  6 Oct 2016 12:06:11 -0700
Message-ID: <1475780772-252393-1-git-send-email-vijay.ac.kumar@oracle.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vijay.ac.kumar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Grub finds incorrect of_node path for devices behind usb hub.
Added devspec sysfs entry for devices behind usb hub so that
right of_node path is returned during grub sysfs walk for these
devices.

Signed-off-by: Vijay Kumar <vijay.ac.kumar-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/core/sysfs.c |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/drivers/usb/core/sysfs.c b/drivers/usb/core/sysfs.c
index c953a0f..84d66d5 100644
--- a/drivers/usb/core/sysfs.c
+++ b/drivers/usb/core/sysfs.c
@@ -14,6 +14,7 @@
 #include <linux/string.h>
 #include <linux/usb.h>
 #include <linux/usb/quirks.h>
+#include <linux/of.h>
 #include "usb.h"
 
 /* Active configuration fields */
@@ -104,6 +105,17 @@ static ssize_t bConfigurationValue_store(struct device *dev,
 static DEVICE_ATTR_IGNORE_LOCKDEP(bConfigurationValue, S_IRUGO | S_IWUSR,
 		bConfigurationValue_show, bConfigurationValue_store);
 
+#ifdef CONFIG_OF
+static ssize_t devspec_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
+{
+	struct device_node *of_node = dev->of_node;
+
+	return sprintf(buf, "%s\n", of_node_full_name(of_node));
+}
+static DEVICE_ATTR_RO(devspec);
+#endif
+
 /* String fields */
 #define usb_string_attr(name)						\
 static ssize_t  name##_show(struct device *dev,				\
@@ -786,6 +798,9 @@ static struct attribute *dev_attrs[] = {
 	&dev_attr_remove.attr,
 	&dev_attr_removable.attr,
 	&dev_attr_ltm_capable.attr,
+#ifdef CONFIG_OF
+	&dev_attr_devspec.attr,
+#endif
 	NULL,
 };
 static struct attribute_group dev_attr_grp = {
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
