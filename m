From: Stuart Longland <stuartl-EoQOJlg3kTYQrrorzV6ljw@public.gmane.org>
Subject: [PATCH] drivers/rtc/rtc-isl12022.c: Device tree support
Date: Wed, 16 Jul 2014 12:28:25 +1000
Message-ID: <1405477705-16885-2-git-send-email-stuartl@vrt.com.au>
References: <1405477705-16885-1-git-send-email-stuartl@vrt.com.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405477705-16885-1-git-send-email-stuartl-EoQOJlg3kTYQrrorzV6ljw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Roman Fietze <roman.fietze-rVvtEhYSWBkAey3BTtE3dg@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stuart Longland <stuartl-EoQOJlg3kTYQrrorzV6ljw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add some support for configuring isl12020/isl12022 devices using the
Device Tree blob.

Signed-off-by: Stuart Longland <stuartl-EoQOJlg3kTYQrrorzV6ljw@public.gmane.org>
---
 drivers/rtc/rtc-isl12022.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/rtc/rtc-isl12022.c b/drivers/rtc/rtc-isl12022.c
index 03b8911..aa55f08 100644
--- a/drivers/rtc/rtc-isl12022.c
+++ b/drivers/rtc/rtc-isl12022.c
@@ -17,6 +17,8 @@
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/err.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
 
 #define DRV_VERSION "0.1"
 
@@ -271,6 +273,13 @@ static int isl12022_probe(struct i2c_client *client,
 	return PTR_ERR_OR_ZERO(isl12022->rtc);
 }
 
+#ifdef CONFIG_OF
+static struct of_device_id isl12022_dt_match[] = {
+	{ .compatible = "isl,isl12022" },
+	{ },
+};
+#endif
+
 static const struct i2c_device_id isl12022_id[] = {
 	{ "isl12022", 0 },
 	{ }
@@ -280,6 +289,9 @@ MODULE_DEVICE_TABLE(i2c, isl12022_id);
 static struct i2c_driver isl12022_driver = {
 	.driver		= {
 		.name	= "rtc-isl12022",
+#ifdef CONFIG_OF
+		.of_match_table = of_match_ptr(isl12022_dt_match),
+#endif
 	},
 	.probe		= isl12022_probe,
 	.id_table	= isl12022_id,
-- 
1.8.5.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
