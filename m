From: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/2] isp1760: Make probing via device tree non-powerpc-specific
Date: Wed, 14 Sep 2011 14:57:12 +0100
Message-ID: <1316008633-31009-2-git-send-email-dave.martin@linaro.org>
References: <1316008633-31009-1-git-send-email-dave.martin@linaro.org>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1316008633-31009-1-git-send-email-dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Arvid Brodin <arvid.brodin-AM1FMPraTHU@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch just replaces the (presumably historical) CONFIG_OF_PPC

Signed-off-by: Dave Martin <dave.martin-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Acked-by: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
---
 drivers/usb/host/isp1760-if.c |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/host/isp1760-if.c b/drivers/usb/host/isp1760-if.c
index 7ee3005..69ee32c 100644
--- a/drivers/usb/host/isp1760-if.c
+++ b/drivers/usb/host/isp1760-if.c
@@ -17,16 +17,18 @@
 
 #include "isp1760-hcd.h"
 
-#ifdef CONFIG_PPC_OF
+#ifdef CONFIG_OF
 #include <linux/of.h>
 #include <linux/of_platform.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
 #endif
 
 #ifdef CONFIG_PCI
 #include <linux/pci.h>
 #endif
 
-#ifdef CONFIG_PPC_OF
+#ifdef CONFIG_OF
 static int of_isp1760_probe(struct platform_device *dev)
 {
 	struct usb_hcd *hcd;
@@ -396,7 +398,7 @@ static int __init isp1760_init(void)
 	ret = platform_driver_register(&isp1760_plat_driver);
 	if (!ret)
 		any_ret = 0;
-#ifdef CONFIG_PPC_OF
+#ifdef CONFIG_OF
 	ret = platform_driver_register(&isp1760_of_driver);
 	if (!ret)
 		any_ret = 0;
@@ -416,7 +418,7 @@ module_init(isp1760_init);
 static void __exit isp1760_exit(void)
 {
 	platform_driver_unregister(&isp1760_plat_driver);
-#ifdef CONFIG_PPC_OF
+#ifdef CONFIG_OF
 	platform_driver_unregister(&isp1760_of_driver);
 #endif
 #ifdef CONFIG_PCI
-- 
1.7.4.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
