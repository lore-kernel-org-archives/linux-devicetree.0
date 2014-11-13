From: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
Subject: [PATCH] drivers/core/of: Add symlink to device-tree from devices
 with an OF node
Date: Thu, 13 Nov 2014 12:10:47 +1100
Message-ID: <1415841047.5124.62.camel@kernel.crashing.org>
References: <1415342031.4925.27.camel@kernel.crashing.org>
	 <1415342117.4925.29.camel@kernel.crashing.org>
	 <1415596626.5769.14.camel@kernel.crashing.org>
	 <CAL_JsqKG=vpeGKj3v-2VW9oGQsnmuYMHRfy6LuXDXE=ROjHT4w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKG=vpeGKj3v-2VW9oGQsnmuYMHRfy6LuXDXE=ROjHT4w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Jeremy Kerr <jeremy.kerr-8fk3Idey6ehBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

So I've been annoyed lately with having a bunch of devices such as i2c
eeproms (for use by VPDs, server world !) and other bits and pieces that
I want to be able to identify from userspace, and possibly provide
additional data about from FW.

Basically, it boils down to correlating the sysfs device with the OF
tree device node, so that user space can use device-tree info such as
additional "location" or "label" (or whatever else we can come up with)
propreties to identify a given device, or get some attributes of use
about it, etc...

Now, so far, we've done that in some subsystem in a fairly ad-hoc basis
using "devspec" properties. For example, PCI creates them if it can
correlate the probed device with a DT node. Some powerpc specific busses
do that too.

However, i2c doesn't and it would be nice to have something more generic
since technically any device can have a corresponding device tree node.

This patch adds an "of_node" symlink to devices that have a non-NULL
dev->of_node pointer, the patch is pretty trivial and seems to work just
fine for me.

Signed-off-by: Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>
---
diff --git a/drivers/base/core.c b/drivers/base/core.c
index 20da3ad..8c7b607 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -493,6 +493,15 @@ static int device_add_attrs(struct device *dev)
 			goto err_remove_dev_groups;
 	}
 
+#ifdef CONFIG_OF
+	if (dev->of_node) {
+		error = sysfs_create_link(&dev->kobj, &dev->of_node->kobj,
+					  "of_node");
+		if (error)
+			dev_warn(dev, "Error %d creating of_node link\n", error);
+	}
+#endif /* CONFIG_OF */
+
 	return 0;
 
  err_remove_dev_groups:


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
