From: Manivannan Sadhasivam <manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 3/4] iio: pressure: ms5637: Add OF match table
Date: Tue, 13 Jun 2017 22:51:13 +0530
Message-ID: <1497374473-20987-1-git-send-email-manivannan.sadhasivam@linaro.org>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, william.markezana-ya7vCgA9bt58UrSeD/g0lQ@public.gmane.org, ludovic.tancerel-sbt5i+FMW2pmsedzY7GhzwC/G2K4zDHf@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nicolas.dechesne-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, amit.kucheria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Manivannan Sadhasivam <manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add of_match_table for Measurement-Specialties MS5637, MS5805, MS5837 and MS8607 pressure & temperature sensor

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/iio/pressure/ms5637.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/pressure/ms5637.c b/drivers/iio/pressure/ms5637.c
index 953ffbc..c413f8a 100644
--- a/drivers/iio/pressure/ms5637.c
+++ b/drivers/iio/pressure/ms5637.c
@@ -181,11 +181,21 @@ static const struct i2c_device_id ms5637_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, ms5637_id);
 
+static const struct of_device_id ms5637_of_match[] = {
+	{ .compatible = "meas,ms5637", },
+	{ .compatible = "meas,ms5805", },
+	{ .compatible = "meas,ms5837", },
+	{ .compatible = "meas,ms8607-temppressure", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, ms5637_of_match);
+
 static struct i2c_driver ms5637_driver = {
 	.probe = ms5637_probe,
 	.id_table = ms5637_id,
 	.driver = {
-		   .name = "ms5637"
+		   .name = "ms5637",
+		   .of_match_table = of_match_ptr(ms5637_of_match),
 		   },
 };
 
-- 
2.7.4
