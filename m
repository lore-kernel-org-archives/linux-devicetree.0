From: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 4/4] iio: adc: ti-adc128s052: Add devicetree support
Date: Wed, 22 Jul 2015 18:04:24 +0200
Message-ID: <1437581064-9733-4-git-send-email-denis@eukrea.com>
References: <1437581064-9733-1-git-send-email-denis@eukrea.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437581064-9733-1-git-send-email-denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Denis Carikli <denis-fO0SIAKYzcbQT0dZR+AlfA@public.gmane.org>
---
 drivers/iio/adc/ti-adc128s052.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/adc/ti-adc128s052.c b/drivers/iio/adc/ti-adc128s052.c
index 8aca0ff..2558508 100644
--- a/drivers/iio/adc/ti-adc128s052.c
+++ b/drivers/iio/adc/ti-adc128s052.c
@@ -13,10 +13,11 @@
  */
 
 #include <linux/err.h>
-#include <linux/spi/spi.h>
 #include <linux/module.h>
 #include <linux/iio/iio.h>
+#include <linux/of.h>
 #include <linux/regulator/consumer.h>
+#include <linux/spi/spi.h>
 
 struct adc128_configuration {
 	const struct iio_chan_spec	*channels;
@@ -183,10 +184,21 @@ static const struct spi_device_id adc128_id[] = {
 };
 MODULE_DEVICE_TABLE(spi, adc128_id);
 
+#ifdef CONFIG_OF
+static const struct of_device_id adc128_of_match[] = {
+	{ .compatible = "ti,adc128s052" },
+	{ .compatible = "ti,adc122s021" },
+	{ .compatible = "ti,adc108s022" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, adc128_of_match);
+#endif
+
 static struct spi_driver adc128_driver = {
 	.driver = {
 		.name = "adc128s052",
 		.owner = THIS_MODULE,
+		.of_match_table = of_match_ptr(adc128_of_match),
 	},
 	.probe = adc128_probe,
 	.remove = adc128_remove,
-- 
2.4.5
