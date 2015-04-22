From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Subject: [PATCH v3 3/4] base/platform: Continue on insert_resource() error
Date: Wed, 22 Apr 2015 18:14:20 +0200
Message-ID: <1429719261-18024-4-git-send-email-ricardo.ribalda@gmail.com>
References: <1429719261-18024-1-git-send-email-ricardo.ribalda@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429719261-18024-1-git-send-email-ricardo.ribalda@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Jakub Sitnicki <jsitnicki@gmail.com>, Vivek Goyal <vgoyal@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Jiang Liu <jiang.liu@linux.intel.com>, Mike Travis <travis@sgi.com>, Thierry Reding <treding@nvidia.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
List-Id: devicetree@vger.kernel.org

insert_resource() can fail when the resource added  overlaps
(partially or fully) with another.

Device tree and AMBA devices may contain resources that overlap, so they
could not call platform_device_add (Revert "of: use platform_device_add"
02bbde7849e68e193cefaa1885fe0df0f03c9fcd )

On the other hand, device trees are released using
platform_device_unregister(). This function calls platform_device_del(),
which calls release_resource(), that crashes when the resource has not
been added with with insert_resource. This was not an issue when the
device tree could not be modified online, but this is not the case
anymore.

This patch let the flow continue when there is an insert error, after
notifying the user with a dev_err(). r->parent is set to NULL, so the
device_del knows that the resource was not added, and therefore it
should not be released.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 drivers/base/platform.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 6028681..8cce2a3 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -359,8 +359,7 @@ int platform_device_add(struct platform_device *pdev)
 
 		if (insert_resource(p, r)) {
 			dev_err(&pdev->dev, "failed to claim resource %d\n", i);
-			ret = -EBUSY;
-			goto failed;
+			r->parent = NULL;
 		}
 	}
 
@@ -371,7 +370,6 @@ int platform_device_add(struct platform_device *pdev)
 	if (ret == 0)
 		return ret;
 
- failed:
 	if (pdev->id_auto) {
 		ida_simple_remove(&platform_devid_ida, pdev->id);
 		pdev->id = PLATFORM_DEVID_AUTO;
@@ -381,7 +379,8 @@ int platform_device_add(struct platform_device *pdev)
 		struct resource *r = &pdev->resource[i];
 		unsigned long type = resource_type(r);
 
-		if (type == IORESOURCE_MEM || type == IORESOURCE_IO)
+		if ((type == IORESOURCE_MEM || type == IORESOURCE_IO) &&
+				r->parent)
 			release_resource(r);
 	}
 
@@ -414,7 +413,8 @@ void platform_device_del(struct platform_device *pdev)
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
