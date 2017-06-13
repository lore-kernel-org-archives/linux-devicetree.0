From: Manivannan Sadhasivam <manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/2] iio: temperature: tsys01: Add OF match table
Date: Tue, 13 Jun 2017 21:22:22 +0530
Message-ID: <1497369142-32473-1-git-send-email-manivannan.sadhasivam@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, william.markezana-ya7vCgA9bt58UrSeD/g0lQ@public.gmane.org, ludovic.tancerel-sbt5i+FMW2pmsedzY7GhzwC/G2K4zDHf@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Manivannan Sadhasivam <manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add of_match_table for Measurement Specialties TSYS01 temperature sensor

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/iio/temperature/tsys01.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/iio/temperature/tsys01.c b/drivers/iio/temperature/tsys01.c
index 3e60c61..d8aa211 100644
--- a/drivers/iio/temperature/tsys01.c
+++ b/drivers/iio/temperature/tsys01.c
@@ -214,11 +214,18 @@ static const struct i2c_device_id tsys01_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, tsys01_id);
 
+static const struct of_device_id tsys01_of_match[] = {
+	{ .compatible = "meas,tsys01", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, tsys01_of_match);
+
 static struct i2c_driver tsys01_driver = {
 	.probe = tsys01_i2c_probe,
 	.id_table = tsys01_id,
 	.driver = {
 		   .name = "tsys01",
+		   .of_match_table = of_match_ptr(tsys01_of_match),
 		   },
 };
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
