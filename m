From: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: [PATCH v1] of: Use PLATFORM_DEVID_NONE definition
Date: Fri, 25 Aug 2017 18:33:13 +0300
Message-ID: <20170825153313.60658-1-andriy.shevchenko@linux.intel.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Use dedicated definition instead of plain -1 where it's appropriate.

No functional change intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
---
 drivers/of/device.c   | 2 +-
 drivers/of/platform.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/of/device.c b/drivers/of/device.c
index 6f33a0e0d351..8963ec8ea96f 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -58,7 +58,7 @@ int of_device_add(struct platform_device *ofdev)
 	/* name and id have to be set so that the platform bus doesn't get
 	 * confused on matching */
 	ofdev->name = dev_name(&ofdev->dev);
-	ofdev->id = -1;
+	ofdev->id = PLATFORM_DEVID_NONE;
 
 	/*
 	 * If this device has not binding numa node in devicetree, that is
diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 683b2e74bef7..ac15d0e3d27d 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -118,7 +118,7 @@ struct platform_device *of_device_alloc(struct device_node *np,
 	int rc, i, num_reg = 0, num_irq;
 	struct resource *res, temp_res;
 
-	dev = platform_device_alloc("", -1);
+	dev = platform_device_alloc("", PLATFORM_DEVID_NONE);
 	if (!dev)
 		return NULL;
 
-- 
2.14.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
