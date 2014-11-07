From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: Re: [RFC] Add of_path property for all devices with a node
Date: Fri, 07 Nov 2014 17:35:17 +1100
Message-ID: <1415342117.4925.29.camel@kernel.crashing.org>
References: <1415342031.4925.27.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1415342031.4925.27.camel-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 2014-11-07 at 17:33 +1100, Benjamin Herrenschmidt wrote:

> So I came up with this patch, 

And here is the actual patch, which might help :-) It's pretty trivial
and small...

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 20da3ad..dd0ee1b 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -26,6 +26,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/netdevice.h>
 #include <linux/sysfs.h>
+#include <linux/of.h>
 
 #include "base.h"
 #include "power/power.h"
@@ -454,6 +455,23 @@ static ssize_t online_store(struct device *dev, struct device_attribute *attr,
 }
 static DEVICE_ATTR_RW(online);
 
+#ifdef CONFIG_OF
+
+static ssize_t of_path_show(struct device *dev, struct device_attribute *attr,
+			    char *buf)
+{
+	ssize_t s = 0;
+
+	device_lock(dev);
+	if (dev->of_node)
+		s = sprintf(buf, "%s\n", dev->of_node->full_name);
+	device_unlock(dev);
+	return s;
+}
+static DEVICE_ATTR_RO(of_path);
+
+#endif /* CONFIG_OF */
+
 int device_add_groups(struct device *dev, const struct attribute_group **groups)
 {
 	return sysfs_create_groups(&dev->kobj, groups);
@@ -487,15 +505,27 @@ static int device_add_attrs(struct device *dev)
 	if (error)
 		goto err_remove_type_groups;
 
+#ifdef CONFIG_OF
+	if (dev->of_node) {
+		error = device_create_file(dev, &dev_attr_of_path);
+		if (error)
+			goto err_remove_dev_groups;
+	}
+#endif /* CONFIG_OF */
+
 	if (device_supports_offline(dev) && !dev->offline_disabled) {
 		error = device_create_file(dev, &dev_attr_online);
 		if (error)
-			goto err_remove_dev_groups;
+			goto err_remove_of_path;
 	}
 
 	return 0;
 
+ err_remove_of_path:
+#ifdef CONFIG_OF
+	device_remove_file(dev, &dev_attr_of_path);
  err_remove_dev_groups:
+#endif
 	device_remove_groups(dev, dev->groups);
  err_remove_type_groups:
 	if (type)


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
