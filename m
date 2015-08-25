From: Zhen Lei <thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/1] of: to support binding numa node to specified device in devicetree
Date: Tue, 25 Aug 2015 12:08:22 +0800
Message-ID: <1440475702-7720-2-git-send-email-thunder.leizhen@huawei.com>
References: <1440475702-7720-1-git-send-email-thunder.leizhen@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440475702-7720-1-git-send-email-thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Zefan Li <lizefan-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Xinwei Hu <huxinwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Tianhong Ding <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Hanjun Guo <guohanjun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Zhen Lei <thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

For now, in function device_add, the new device will be forced to
inherit the numa node of its parent. But this will override the device's
numa node which configured in devicetree.

Signed-off-by: Zhen Lei <thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
---
 drivers/base/core.c |  2 +-
 drivers/of/device.c | 11 ++++++-----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index dafae6d..e06de82 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1017,7 +1017,7 @@ int device_add(struct device *dev)
 		dev->kobj.parent = kobj;

 	/* use parent numa_node */
-	if (parent)
+	if (parent && (dev_to_node(dev) == NUMA_NO_NODE))
 		set_dev_node(dev, dev_to_node(parent));

 	/* first, register with generic layer. */
diff --git a/drivers/of/device.c b/drivers/of/device.c
index 8b91ea2..e5f47ce 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -60,11 +60,12 @@ int of_device_add(struct platform_device *ofdev)
 	ofdev->name = dev_name(&ofdev->dev);
 	ofdev->id = -1;

-	/* device_add will assume that this device is on the same node as
-	 * the parent. If there is no parent defined, set the node
-	 * explicitly */
-	if (!ofdev->dev.parent)
-		set_dev_node(&ofdev->dev, of_node_to_nid(ofdev->dev.of_node));
+	/*
+	 * If this device has not binding numa node in devicetree, that is
+	 * of_node_to_nid returns NUMA_NO_NODE. device_add will assume that this
+	 * device is on the same node as the parent.
+	 */
+	set_dev_node(&ofdev->dev, of_node_to_nid(ofdev->dev.of_node));

 	return device_add(&ofdev->dev);
 }
--
2.5.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
