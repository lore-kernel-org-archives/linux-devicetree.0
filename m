From: Jandy Gou <qingsong.gou-iOBi6ErZv8IxpvK4C0GaPQ@public.gmane.org>
Subject: [PATCH 1/2] iio: magnetometer: mmc35240: Add DT binding
Date: Fri, 17 Jul 2015 16:34:35 +0800
Message-ID: <1437122076-29816-2-git-send-email-qingsong.gou@ck-telecom.com>
References: <1437122076-29816-1-git-send-email-qingsong.gou@ck-telecom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437122076-29816-1-git-send-email-qingsong.gou-iOBi6ErZv8IxpvK4C0GaPQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: daniel.baluta-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, viorel.suman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jandy Gou <qingsong.gou-iOBi6ErZv8IxpvK4C0GaPQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Jandy Gou <qingsong.gou-iOBi6ErZv8IxpvK4C0GaPQ@public.gmane.org>
---
 drivers/iio/magnetometer/mmc35240.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/iio/magnetometer/mmc35240.c b/drivers/iio/magnetometer/mmc35240.c
index 7a2ea71..9bc542d 100644
--- a/drivers/iio/magnetometer/mmc35240.c
+++ b/drivers/iio/magnetometer/mmc35240.c
@@ -550,6 +550,12 @@ static const struct dev_pm_ops mmc35240_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(mmc35240_suspend, mmc35240_resume)
 };
 
+static const struct of_device_id mmc35240_of_match[] = {
+	{ .compatible = "memsic,mmc35240", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, mmc35240_of_match);
+
 static const struct acpi_device_id mmc35240_acpi_match[] = {
 	{"MMC35240", 0},
 	{ },
@@ -565,6 +571,7 @@ MODULE_DEVICE_TABLE(i2c, mmc35240_id);
 static struct i2c_driver mmc35240_driver = {
 	.driver = {
 		.name = MMC35240_DRV_NAME,
+		.of_match_table = mmc35240_of_match,
 		.pm = &mmc35240_pm_ops,
 		.acpi_match_table = ACPI_PTR(mmc35240_acpi_match),
 	},
-- 
1.9.1


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
