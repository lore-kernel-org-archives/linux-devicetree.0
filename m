From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/5] mfd: tc3589x: detect the precise version
Date: Tue, 15 Oct 2013 23:14:00 +0200
Message-ID: <1381871640-22262-1-git-send-email-linus.walleij@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Instead of detecting the "tc3589x" and hard-coding the number of
GPIO pins to 24, encode all the possible subtypes and set the
number of GPIO pins from the type.

Signed-off-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/mfd/tc3589x.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 47 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/tc3589x.c b/drivers/mfd/tc3589x.c
index 70f4909f..0eabbb0 100644
--- a/drivers/mfd/tc3589x.c
+++ b/drivers/mfd/tc3589x.c
@@ -16,6 +16,19 @@
 #include <linux/mfd/core.h>
 #include <linux/mfd/tc3589x.h>
 
+/**
+ * enum tc3589x_version - indicates the TC3589x version
+ */
+enum tc3589x_version {
+	TC3589X_TC35890,
+	TC3589X_TC35892,
+	TC3589X_TC35893,
+	TC3589X_TC35894,
+	TC3589X_TC35895,
+	TC3589X_TC35896,
+	TC3589X_UNKNOWN,
+};
+
 #define TC3589x_CLKMODE_MODCTL_SLEEP		0x0
 #define TC3589x_CLKMODE_MODCTL_OPERATION	(1 << 0)
 
@@ -361,7 +374,33 @@ static int tc3589x_probe(struct i2c_client *i2c,
 	tc3589x->i2c = i2c;
 	tc3589x->pdata = pdata;
 	tc3589x->irq_base = pdata->irq_base;
-	tc3589x->num_gpio = id->driver_data;
+
+	switch (id->driver_data) {
+	case TC3589X_TC35890:
+		tc3589x->num_gpio = 24;
+		break;
+	case TC3589X_TC35892:
+		tc3589x->num_gpio = 24;
+		break;
+	case TC3589X_TC35893:
+		tc3589x->num_gpio = 20;
+		break;
+	case TC3589X_TC35894:
+		tc3589x->num_gpio = 24;
+		break;
+	case TC3589X_TC35895:
+		tc3589x->num_gpio = 20;
+		break;
+	case TC3589X_TC35896:
+		tc3589x->num_gpio = 20;
+		break;
+	case TC3589X_UNKNOWN:
+		tc3589x->num_gpio = 24;
+		break;
+	default:
+		tc3589x->num_gpio = 24;
+		break;
+	}
 
 	i2c_set_clientdata(i2c, tc3589x);
 
@@ -432,7 +471,13 @@ static int tc3589x_resume(struct device *dev)
 static SIMPLE_DEV_PM_OPS(tc3589x_dev_pm_ops, tc3589x_suspend, tc3589x_resume);
 
 static const struct i2c_device_id tc3589x_id[] = {
-	{ "tc3589x", 24 },
+	{ "tc35890", TC3589X_TC35890 },
+	{ "tc35892", TC3589X_TC35892 },
+	{ "tc35893", TC3589X_TC35893 },
+	{ "tc35894", TC3589X_TC35894 },
+	{ "tc35895", TC3589X_TC35895 },
+	{ "tc35896", TC3589X_TC35896 },
+	{ "tc3589x", TC3589X_UNKNOWN },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tc3589x_id);
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
