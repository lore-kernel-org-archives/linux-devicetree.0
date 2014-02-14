From: Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
Subject: [PATCH 1/2] staging: iio: hmc5843: Add all available models to device tree id table.
Date: Fri, 14 Feb 2014 15:25:28 +0100
Message-ID: <1392387929-31491-1-git-send-email-marek@goldelico.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, hns-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org, Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
---
 drivers/staging/iio/magnetometer/hmc5843.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/iio/magnetometer/hmc5843.c b/drivers/staging/iio/magnetometer/hmc5843.c
index d4f4dd9..f595fdc 100644
--- a/drivers/staging/iio/magnetometer/hmc5843.c
+++ b/drivers/staging/iio/magnetometer/hmc5843.c
@@ -630,7 +630,9 @@ static const struct i2c_device_id hmc5843_id[] = {
 MODULE_DEVICE_TABLE(i2c, hmc5843_id);
 
 static const struct of_device_id hmc5843_of_match[] = {
-	{ .compatible = "honeywell,hmc5843" },
+	{ .compatible = "honeywell,hmc5843", .data = (void *)HMC5843_ID },
+	{ .compatible = "honeywell,hmc5883", .data = (void *)HMC5883_ID },
+	{ .compatible = "honeywell,hmc5883l", .data = (void *)HMC5883L_ID },
 	{}
 };
 MODULE_DEVICE_TABLE(of, hmc5843_of_match);
-- 
1.8.3.2
