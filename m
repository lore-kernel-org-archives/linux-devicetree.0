From: Zhen Lei <thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/1] of: to support binding numa node to root subnode(non-bus)
Date: Mon, 24 Aug 2015 20:30:10 +0800
Message-ID: <1440419410-10520-1-git-send-email-thunder.leizhen@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Zefan Li <lizefan-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Xinwei Hu <huxinwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Tianhong Ding <dingtianhong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Hanjun Guo <guohanjun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Zhen Lei <thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

If use of_platform_populate to scan dt-nodes and add devices, the
subnode of root(such as /smmu), when being scanned and invoke
of_device_add, the ofdev->dev.parent is always equal &platform_bus. So
that, function set_dev_node will not be called. And in device_add,
dev_to_node(parent) always return NUMA_NO_NODE.

Signed-off-by: Zhen Lei <thunder.leizhen-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
---
 drivers/base/core.c | 2 +-
 drivers/of/device.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index dafae6d..5df4f46b 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1017,7 +1017,7 @@ int device_add(struct device *dev)
 		dev->kobj.parent = kobj;

 	/* use parent numa_node */
-	if (parent)
+	if (parent && (parent != &platform_bus))
 		set_dev_node(dev, dev_to_node(parent));

 	/* first, register with generic layer. */
diff --git a/drivers/of/device.c b/drivers/of/device.c
index 8b91ea2..96ebece 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -63,7 +63,7 @@ int of_device_add(struct platform_device *ofdev)
 	/* device_add will assume that this device is on the same node as
 	 * the parent. If there is no parent defined, set the node
 	 * explicitly */
-	if (!ofdev->dev.parent)
+	if (!ofdev->dev.parent || (ofdev->dev.parent == &platform_bus))
 		set_dev_node(&ofdev->dev, of_node_to_nid(ofdev->dev.of_node));

 	return device_add(&ofdev->dev);
--
2.5.0


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
