From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: [PATCH 2/2] drivers/core/of: Add symlink to device-tree from
 devices with an OF node
Date: Mon, 16 Feb 2015 14:59:16 +1100
Message-ID: <1424059156.21410.38.camel@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

So I've been annoyed lately with having a bunch of devices such as i2c
eeproms (for use by VPDs, server world !) and other bits and pieces that
I want to be able to identify from userspace, and possibly provide
additional data about from FW.

Basically, it boils down to correlating the sysfs device with the OF
tree device node, so that user space can use device-tree info such as
additional "location" or "label" (or whatever else we can come up with)
properties to identify a given device, or get some attributes of use
about it, etc...

Now, so far, we've done that in some subsystem in a fairly ad-hoc basis
using "devspec" properties. For example, PCI creates them if it can
correlate the probed device with a DT node. Some powerpc specific busses
do that too.

However, i2c doesn't and it would be nice to have something more generic
since technically any device can have a corresponding device tree node
these days.

This patch achieves this by adding an "of_node" symlink to devices that
have a non-NULL dev->of_node pointer.

Signed-off-by: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
---
 drivers/base/core.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 97e2baf..61ef574 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -469,6 +469,7 @@ static int device_add_attrs(struct device *dev)
 {
 	struct class *class = dev->class;
 	const struct device_type *type = dev->type;
+	struct device_node *of_node;
 	int error;
 
 	if (class) {
@@ -493,6 +494,13 @@ static int device_add_attrs(struct device *dev)
 			goto err_remove_dev_groups;
 	}
 
+	of_node = dev_of_node(dev);
+	if (of_node) {
+		error = sysfs_create_link(&dev->kobj, &of_node->kobj, "of_node");
+		if (error)
+			dev_warn(dev, "Error %d creating of_node link\n", error);
+	}
+
 	return 0;
 
  err_remove_dev_groups:



--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
