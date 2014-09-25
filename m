From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: [PATCH v1 1/2] mtd: docg3: add device-tree support
Date: Fri, 26 Sep 2014 00:33:15 +0200
Message-ID: <1411684396-12094-1-git-send-email-robert.jarzmik@free.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add device-tree support. This is straightforward as docg3 only uses the
standard IOMEM resources.

Signed-off-by: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 drivers/mtd/devices/docg3.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 91a169c..fc05f81 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -22,6 +22,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/errno.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/string.h>
 #include <linux/slab.h>
@@ -2126,10 +2127,17 @@ static int __exit docg3_release(struct platform_device *pdev)
 	return 0;
 }
 
+static struct of_device_id docg3_dt_ids[] = {
+	{ .compatible = "sandisk,docg3" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, docg3_dt_ids);
+
 static struct platform_driver g3_driver = {
 	.driver		= {
 		.name	= "docg3",
 		.owner	= THIS_MODULE,
+		.of_match_table = of_match_ptr(docg3_dt_ids),
 	},
 	.suspend	= docg3_suspend,
 	.resume		= docg3_resume,
-- 
2.0.0.rc2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
