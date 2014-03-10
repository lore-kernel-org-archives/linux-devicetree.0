From: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCHv3 1/9] mfd: twl4030-madc: Use managed resources
Date: Mon, 10 Mar 2014 18:25:21 +0100
Message-ID: <1394472329-15485-2-git-send-email-sre@debian.org>
References: <1394472329-15485-1-git-send-email-sre@debian.org>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1394472329-15485-1-git-send-email-sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-GFxCN5SEZAc@public.gmane.org>, Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Update twl4030-madc driver to use managed resources.

Signed-off-by: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Acked-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Tested-by: Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>
---
 drivers/mfd/twl4030-madc.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/mfd/twl4030-madc.c b/drivers/mfd/twl4030-madc.c
index 4c583e4..5458561 100644
--- a/drivers/mfd/twl4030-madc.c
+++ b/drivers/mfd/twl4030-madc.c
@@ -702,14 +702,14 @@ static int twl4030_madc_probe(struct platform_device *pdev)
 {
 	struct twl4030_madc_data *madc;
 	struct twl4030_madc_platform_data *pdata = dev_get_platdata(&pdev->dev);
-	int ret;
+	int irq, ret;
 	u8 regval;
 
 	if (!pdata) {
 		dev_err(&pdev->dev, "platform_data not available\n");
 		return -EINVAL;
 	}
-	madc = kzalloc(sizeof(*madc), GFP_KERNEL);
+	madc = devm_kzalloc(&pdev->dev, sizeof(*madc), GFP_KERNEL);
 	if (!madc)
 		return -ENOMEM;
 
@@ -726,7 +726,7 @@ static int twl4030_madc_probe(struct platform_device *pdev)
 	    TWL4030_MADC_ISR1 : TWL4030_MADC_ISR2;
 	ret = twl4030_madc_set_power(madc, 1);
 	if (ret < 0)
-		goto err_power;
+		return ret;
 	ret = twl4030_madc_set_current_generator(madc, 0, 1);
 	if (ret < 0)
 		goto err_current_generator;
@@ -770,7 +770,9 @@ static int twl4030_madc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, madc);
 	mutex_init(&madc->lock);
-	ret = request_threaded_irq(platform_get_irq(pdev, 0), NULL,
+
+	irq = platform_get_irq(pdev, 0);
+	ret = devm_request_threaded_irq(&pdev->dev, irq, NULL,
 				   twl4030_madc_threaded_irq_handler,
 				   IRQF_TRIGGER_RISING, "twl4030_madc", madc);
 	if (ret) {
@@ -783,9 +785,6 @@ err_i2c:
 	twl4030_madc_set_current_generator(madc, 0, 0);
 err_current_generator:
 	twl4030_madc_set_power(madc, 0);
-err_power:
-	kfree(madc);
-
 	return ret;
 }
 
@@ -793,10 +792,8 @@ static int twl4030_madc_remove(struct platform_device *pdev)
 {
 	struct twl4030_madc_data *madc = platform_get_drvdata(pdev);
 
-	free_irq(platform_get_irq(pdev, 0), madc);
 	twl4030_madc_set_current_generator(madc, 0, 0);
 	twl4030_madc_set_power(madc, 0);
-	kfree(madc);
 
 	return 0;
 }
-- 
1.9.0
