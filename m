From: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] rtc: rtc-pfc2123: Add support for devicetree
Date: Mon, 29 Dec 2014 10:28:46 -0800
Message-ID: <1419877726-8458-1-git-send-email-stillcompiling@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add compatible string "nxp,rtc-pcf2123"
Document the binding

Signed-off-by: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 Documentation/devicetree/bindings/rtc/nxp,rtc-2123.txt | 16 ++++++++++++++++
 drivers/rtc/rtc-pcf2123.c                              | 10 ++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/nxp,rtc-2123.txt

diff --git a/Documentation/devicetree/bindings/rtc/nxp,rtc-2123.txt b/Documentation/devicetree/bindings/rtc/nxp,rtc-2123.txt
new file mode 100644
index 0000000..5cbc0b1
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/nxp,rtc-2123.txt
@@ -0,0 +1,16 @@
+NXP PCF2123 SPI Real Time Clock
+
+Required properties:
+- compatible: should be: "nxp,rtc-pcf2123"
+- reg: should be the SPI slave chipselect address
+
+Optional properties:
+- spi-cs-high: PCF2123 needs chipselect high
+
+Example:
+
+rtc: nxp,rtc-pcf2123@3 {
+	compatible = "nxp,rtc-pcf2123"
+	reg = <3>
+	spi-cs-high;
+};
diff --git a/drivers/rtc/rtc-pcf2123.c b/drivers/rtc/rtc-pcf2123.c
index d1953bb..8a7556c 100644
--- a/drivers/rtc/rtc-pcf2123.c
+++ b/drivers/rtc/rtc-pcf2123.c
@@ -38,6 +38,7 @@
 #include <linux/errno.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/of.h>
 #include <linux/string.h>
 #include <linux/slab.h>
 #include <linux/rtc.h>
@@ -340,10 +341,19 @@ static int pcf2123_remove(struct spi_device *spi)
 	return 0;
 }
 
+#ifdef CONFIG_OF
+static const struct of_device_id pcf2123_dt_ids[] = {
+	{ .compatible = "nxp,rtc-pcf2123", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, pcf2123_dt_ids);
+#endif
+
 static struct spi_driver pcf2123_driver = {
 	.driver	= {
 			.name	= "rtc-pcf2123",
 			.owner	= THIS_MODULE,
+			.of_match_table = of_match_ptr(pcf2123_dt_ids),
 	},
 	.probe	= pcf2123_probe,
 	.remove	= pcf2123_remove,
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
