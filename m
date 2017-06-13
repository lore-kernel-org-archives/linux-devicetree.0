From: Manivannan Sadhasivam <manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/4] iio: humidity: htu21: Add OF match table
Date: Tue, 13 Jun 2017 22:50:05 +0530
Message-ID: <1497374405-20871-1-git-send-email-manivannan.sadhasivam@linaro.org>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, william.markezana-ya7vCgA9bt58UrSeD/g0lQ@public.gmane.org, ludovic.tancerel-sbt5i+FMW2pmsedzY7GhzwC/G2K4zDHf@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nicolas.dechesne-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Manivannan Sadhasivam <manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add of_match_table for Measurement-Specialties htu21 temperature & humidity sensor and humidity part of MS8607 sensor

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/iio/humidity/htu21.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/iio/humidity/htu21.c b/drivers/iio/humidity/htu21.c
index 0fbbd8c..2c4b9be 100644
--- a/drivers/iio/humidity/htu21.c
+++ b/drivers/iio/humidity/htu21.c
@@ -238,11 +238,19 @@ static const struct i2c_device_id htu21_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, htu21_id);
 
+static const struct of_device_id htu21_of_match[] = {
+	{ .compatible = "meas,htu21", },
+	{ .compatible = "meas,ms8607-humidity", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, htu21_of_match);
+
 static struct i2c_driver htu21_driver = {
 	.probe = htu21_probe,
 	.id_table = htu21_id,
 	.driver = {
 		   .name = "htu21",
+		   .of_match_table = of_match_ptr(htu21_of_match),
 		   },
 };
 
-- 
2.7.4
