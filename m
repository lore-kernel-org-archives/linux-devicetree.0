From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: [PATCH] of/platform: Fix microblaze build failure
Date: Tue, 10 Jun 2014 11:59:14 -0700
Message-ID: <1402426754-7328-1-git-send-email-linux@roeck-us.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Commit bf5db2f (microblaze: Use generic device.h) removes the
microblaze specific pdev_archdata and dma_mask.

At the same time, commit 591c1ee (of: configure the platform
device dma parameters) initializes the just removed field.
This causes all microblaze builds to fail.

Drop the unnecessary initialization.

Cc: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
---
 drivers/of/platform.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 6c48d73..500436f 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -166,10 +166,6 @@ static void of_dma_configure(struct platform_device *pdev)
 	int ret;
 	struct device *dev = &pdev->dev;
 
-#if defined(CONFIG_MICROBLAZE)
-	pdev->archdata.dma_mask = 0xffffffffUL;
-#endif
-
 	/*
 	 * Set default dma-mask to 32 bit. Drivers are expected to setup
 	 * the correct supported dma_mask.
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
