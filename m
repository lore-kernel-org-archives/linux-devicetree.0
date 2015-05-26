From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH v5 2/4] base/platform: Continue on insert_resource() error
Date: Tue, 26 May 2015 09:31:24 +0200
Message-ID: <1432625486-15442-3-git-send-email-ricardo.ribalda@gmail.com>
References: <1432625486-15442-1-git-send-email-ricardo.ribalda@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432625486-15442-1-git-send-email-ricardo.ribalda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Jakub Sitnicki <jsitnicki@gmail.com>, Vivek Goyal <vgoyal@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Jiang Liu <jiang.liu@linux.intel.com>, Mike Travis <travis@sgi.com>, Thierry Reding <treding@nvidia.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
List-Id: devicetree@vger.kernel.org

insert_resource() can fail when the resource added  overlaps
(partially or fully) with another.

Device tree and AMBA devices may contain resources that overlap, so they
could not call platform_device_add (see 02bbde7849e6 ('Revert "of:
use platform_device_add"'))"

On the other hand, device trees are released using
platform_device_unregister(). This function calls platform_device_del(),
which calls release_resource(), that crashes when the resource has not
been added with with insert_resource. This was not an issue when the
device tree could not be modified online, but this is not the case
anymore.

This patch let the flow continue when there is an insert error, after
notifying the user with a dev_err(). r->parent is set to NULL, so
platform_device_del() knows that the resource was not added, and
therefore it should not be released.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 drivers/base/platform.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 46a56f694cec..5a29387e5ff6 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -332,7 +332,7 @@ int platform_device_add(struct platform_device *pdev)
 		 */
 		ret = ida_simple_get(&platform_devid_ida, 0, 0, GFP_KERNEL);
 		if (ret < 0)
-			goto err_out;
+			return ret;
 		pdev->id = ret;
 		pdev->id_auto = true;
 		dev_set_name(&pdev->dev, "%s.%d.auto", pdev->name, pdev->id);
@@ -340,7 +340,7 @@ int platform_device_add(struct platform_device *pdev)
 	}
 
 	for (i = 0; i < pdev->num_resources; i++) {
-		struct resource *p, *r = &pdev->resource[i];
+		struct resource *conflict, *p, *r = &pdev->resource[i];
 		unsigned long type = resource_type(r);
 
 		if (r->name == NULL)
@@ -357,11 +357,14 @@ int platform_device_add(struct platform_device *pdev)
 				p = &ioport_resource;
 		}
 
-		if (insert_resource(p, r)) {
-			dev_err(&pdev->dev, "failed to claim resource %d\n", i);
-			ret = -EBUSY;
-			goto failed;
-		}
+		conflict = insert_resource_conflict(p, r);
+		if (!conflict)
+			continue;
+
+		dev_err(&pdev->dev,
+			"ignoring resource %pR (conflicts with %s %pR)\n",
+			r, conflict->name, conflict);
+		p->parent = NULL;
 	}
 
 	pr_debug("Registering platform device '%s'. Parent at %s\n",
@@ -371,7 +374,7 @@ int platform_device_add(struct platform_device *pdev)
 	if (ret == 0)
 		return ret;
 
- failed:
+	/* Failure path */
 	if (pdev->id_auto) {
 		ida_simple_remove(&platform_devid_ida, pdev->id);
 		pdev->id = PLATFORM_DEVID_AUTO;
@@ -381,11 +384,11 @@ int platform_device_add(struct platform_device *pdev)
 		struct resource *r = &pdev->resource[i];
 		unsigned long type = resource_type(r);
 
-		if (type == IORESOURCE_MEM || type == IORESOURCE_IO)
+		if ((type == IORESOURCE_MEM || type == IORESOURCE_IO) &&
+				r->parent)
 			release_resource(r);
 	}
 
- err_out:
 	return ret;
 }
 EXPORT_SYMBOL_GPL(platform_device_add);
@@ -414,7 +417,8 @@ void platform_device_del(struct platform_device *pdev)
 			struct resource *r = &pdev->resource[i];
 			unsigned long type = resource_type(r);
 
-			if (type == IORESOURCE_MEM || type == IORESOURCE_IO)
+			if ((type == IORESOURCE_MEM || type == IORESOURCE_IO) &&
+					r->parent)
 				release_resource(r);
 		}
 	}
-- 
2.1.4
