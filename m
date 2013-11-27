From: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
Subject: [PATCH v2] rtc: rtc-ds1742: Add devicetree support
Date: Wed, 27 Nov 2013 12:55:20 +0400
Message-ID: <1385542520-20887-1-git-send-email-shc_work@mail.ru>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch allows the driver to be enabled with devicetree.

Signed-off-by: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
Acked-by: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
---
 Documentation/devicetree/bindings/rtc/maxim,ds1742.txt | 12 ++++++++++++
 drivers/rtc/rtc-ds1742.c                               | 10 +++++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/maxim,ds1742.txt

diff --git a/Documentation/devicetree/bindings/rtc/maxim,ds1742.txt b/Documentation/devicetree/bindings/rtc/maxim,ds1742.txt
new file mode 100644
index 0000000..d0f937c
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/maxim,ds1742.txt
@@ -0,0 +1,12 @@
+* Maxim (Dallas) DS1742/DS1743 Real Time Clock
+
+Required properties:
+- compatible: Should contain "maxim,ds1742".
+- reg: Physical base address of the RTC and length of memory
+  mapped region.
+
+Example:
+	rtc: rtc@10000000 {
+		compatible = "maxim,ds1742";
+		reg = <0x10000000 0x800>;
+	};
diff --git a/drivers/rtc/rtc-ds1742.c b/drivers/rtc/rtc-ds1742.c
index 17b73fd..d7f74f5 100644
--- a/drivers/rtc/rtc-ds1742.c
+++ b/drivers/rtc/rtc-ds1742.c
@@ -13,12 +13,13 @@
  */
 
 #include <linux/bcd.h>
-#include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/gfp.h>
 #include <linux/delay.h>
 #include <linux/jiffies.h>
 #include <linux/rtc.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -215,12 +216,19 @@ static int ds1742_rtc_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static struct of_device_id __maybe_unused ds1742_rtc_of_match[] = {
+	{ .compatible = "maxim,ds1742", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ds1742_rtc_of_match);
+
 static struct platform_driver ds1742_rtc_driver = {
 	.probe		= ds1742_rtc_probe,
 	.remove		= ds1742_rtc_remove,
 	.driver		= {
 		.name	= "rtc-ds1742",
 		.owner	= THIS_MODULE,
+		.of_match_table = of_match_ptr(ds1742_rtc_of_match),
 	},
 };
 
-- 
1.8.3.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
