Return-Path: <SRS1=KQ5J=mail.kernel.org==b5ZO=5S=manivannan.sadhasivam@kernel.org>
Message-ID: <593ff0a5.a9449d0a.53d6d.7c31SMTPIN_ADDED_BROKEN@mx.google.com>
Date: Tue, 13 Jun 2017 19:24:55 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 1/2] iio: temperature: tsys01: Add OF match table
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: jic23@kernel.org, pmeerw@pmeerw.net, robh+dt@kernel.org, ludovic.tancerel@maplehightech.com, william.markezana@meas-spec.com
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, amit.kucheria@linaro.org, nicolas.dechesne@linaro.org
List-ID: <devicetree@vger.kernel.org>

Add of_match_table for Measurement Specialties TSYS01 temperature sensor

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
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
