From: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [RFCv3 5/7] mfd: twl4030-madc: Use twl_i2c_read/write_u16 for 16 bit registers
Date: Wed, 26 Feb 2014 01:24:28 +0100
Message-ID: <1393374270-20079-6-git-send-email-sre@debian.org>
References: <1393193271-16717-1-git-send-email-sre@debian.org>
 <1393374270-20079-1-git-send-email-sre@debian.org>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393374270-20079-1-git-send-email-sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-GFxCN5SEZAc@public.gmane.org>, Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Simplify reading and writing of 16 bit TWL registers in the
driver by using twl_i2c_read_u16 and twl_i2c_write_u16.

Signed-off-by: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
---
 drivers/mfd/twl4030-madc.c | 39 ++++++++-------------------------------
 1 file changed, 8 insertions(+), 31 deletions(-)

diff --git a/drivers/mfd/twl4030-madc.c b/drivers/mfd/twl4030-madc.c
index c23025b..d19aa3e 100644
--- a/drivers/mfd/twl4030-madc.c
+++ b/drivers/mfd/twl4030-madc.c
@@ -207,25 +207,19 @@ const struct twl4030_madc_conversion_method twl4030_conversion_methods[] = {
  */
 static int twl4030_madc_channel_raw_read(struct twl4030_madc_data *madc, u8 reg)
 {
-	u8 msb, lsb;
+	u16 val;
 	int ret;
 	/*
 	 * For each ADC channel, we have MSB and LSB register pair. MSB address
 	 * is always LSB address+1. reg parameter is the address of LSB register
 	 */
-	ret = twl_i2c_read_u8(TWL4030_MODULE_MADC, &msb, reg + 1);
+	ret = twl_i2c_read_u16(TWL4030_MODULE_MADC, &val, reg);
 	if (ret) {
-		dev_err(madc->dev, "unable to read MSB register 0x%X\n",
-			reg + 1);
-		return ret;
-	}
-	ret = twl_i2c_read_u8(TWL4030_MODULE_MADC, &lsb, reg);
-	if (ret) {
-		dev_err(madc->dev, "unable to read LSB register 0x%X\n", reg);
+		dev_err(madc->dev, "unable to read register 0x%X\n", reg);
 		return ret;
 	}
 
-	return (int)(((msb << 8) | lsb) >> 6);
+	return (int)(val >> 6);
 }
 
 /*
@@ -571,7 +565,6 @@ static int twl4030_madc_wait_conversion_ready(struct twl4030_madc_data *madc,
 int twl4030_madc_conversion(struct twl4030_madc_request *req)
 {
 	const struct twl4030_madc_conversion_method *method;
-	u8 ch_msb, ch_lsb;
 	int ret;
 
 	if (!req || !twl4030_madc)
@@ -587,37 +580,21 @@ int twl4030_madc_conversion(struct twl4030_madc_request *req)
 		ret = -EBUSY;
 		goto out;
 	}
-	ch_msb = (req->channels >> 8) & 0xff;
-	ch_lsb = req->channels & 0xff;
 	method = &twl4030_conversion_methods[req->method];
 	/* Select channels to be converted */
-	ret = twl_i2c_write_u8(TWL4030_MODULE_MADC, ch_msb, method->sel + 1);
+	ret = twl_i2c_write_u16(TWL4030_MODULE_MADC, req->channels, method->sel);
 	if (ret) {
 		dev_err(twl4030_madc->dev,
-			"unable to write sel register 0x%X\n", method->sel + 1);
-		goto out;
-	}
-	ret = twl_i2c_write_u8(TWL4030_MODULE_MADC, ch_lsb, method->sel);
-	if (ret) {
-		dev_err(twl4030_madc->dev,
-			"unable to write sel register 0x%X\n", method->sel + 1);
+			"unable to write sel register 0x%X\n", method->sel);
 		goto out;
 	}
 	/* Select averaging for all channels if do_avg is set */
 	if (req->do_avg) {
-		ret = twl_i2c_write_u8(TWL4030_MODULE_MADC,
-				       ch_msb, method->avg + 1);
+		ret = twl_i2c_write_u16(TWL4030_MODULE_MADC, req->channels,
+				       method->avg);
 		if (ret) {
 			dev_err(twl4030_madc->dev,
 				"unable to write avg register 0x%X\n",
-				method->avg + 1);
-			goto out;
-		}
-		ret = twl_i2c_write_u8(TWL4030_MODULE_MADC,
-				       ch_lsb, method->avg);
-		if (ret) {
-			dev_err(twl4030_madc->dev,
-				"unable to write avg reg 0x%X\n",
 				method->avg);
 			goto out;
 		}
-- 
1.8.5.3
