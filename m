From: George Cherian <george.cherian-l0cyMroinI0@public.gmane.org>
Subject: [PATCH v3 1/2] phy: omap-usb2: Sort the headers alphabetically
Date: Tue, 15 Oct 2013 16:07:42 +0530
Message-ID: <1381833463-12149-2-git-send-email-george.cherian@ti.com>
References: <1381833463-12149-1-git-send-email-george.cherian@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381833463-12149-1-git-send-email-george.cherian-l0cyMroinI0@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, George Cherian <george.cherian-l0cyMroinI0@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This makes checking for duplicates easier while adding new #include.

Signed-off-by: George Cherian <george.cherian-l0cyMroinI0@public.gmane.org>
---
 drivers/phy/phy-omap-usb2.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/phy/phy-omap-usb2.c b/drivers/phy/phy-omap-usb2.c
index bfc5c33..3e5f08c 100644
--- a/drivers/phy/phy-omap-usb2.c
+++ b/drivers/phy/phy-omap-usb2.c
@@ -16,20 +16,20 @@
  *
  */
 
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/io.h>
 #include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
-#include <linux/of.h>
-#include <linux/io.h>
 #include <linux/usb/omap_usb.h>
-#include <linux/usb/phy_companion.h>
-#include <linux/clk.h>
-#include <linux/err.h>
-#include <linux/pm_runtime.h>
-#include <linux/delay.h>
 #include <linux/usb/omap_control_usb.h>
-#include <linux/phy/phy.h>
-#include <linux/of_platform.h>
+#include <linux/usb/phy_companion.h>
 
 /**
  * omap_usb2_set_comparator - links the comparator present in the sytem with
-- 
1.8.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
