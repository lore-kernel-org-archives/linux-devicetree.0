From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] microblaze: move xlnx,compound to default bus matching
Date: Mon, 29 Aug 2016 18:45:58 -0500
Message-ID: <20160829234558.2903-1-robh@kernel.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Microblaze bus probing is partially broken because "xlnx,compound" is
missing from the default bus probe. Add it to the default and remove from
the Microblaze arch code.

Fixes: 44a7185c2ae6 ("of/platform: Add common method to populate default bus")
Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Michal Simek <monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 arch/microblaze/kernel/platform.c | 9 ---------
 drivers/of/platform.c             | 1 +
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/arch/microblaze/kernel/platform.c b/arch/microblaze/kernel/platform.c
index b9529ca..9d520bf 100644
--- a/arch/microblaze/kernel/platform.c
+++ b/arch/microblaze/kernel/platform.c
@@ -11,19 +11,10 @@
  */
 
 #include <linux/init.h>
-#include <linux/of_platform.h>
-#include <asm/prom.h>
 #include <asm/setup.h>
 
-static struct of_device_id xilinx_of_bus_ids[] __initdata = {
-	{ .compatible = "simple-bus", },
-	{ .compatible = "xlnx,compound", },
-	{}
-};
-
 static int __init microblaze_device_probe(void)
 {
-	of_platform_bus_probe(NULL, xilinx_of_bus_ids, NULL);
 	of_platform_reset_gpio_probe();
 	return 0;
 }
diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index f39ccd5..f0314c4 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -32,6 +32,7 @@ const struct of_device_id of_default_bus_match_table[] = {
 #ifdef CONFIG_ARM_AMBA
 	{ .compatible = "arm,amba-bus", },
 #endif /* CONFIG_ARM_AMBA */
+	{ .compatible = "xlnx,compound", },
 	{} /* Empty terminated list */
 };
 
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
