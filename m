From: Andreas Klinger <ak@it-klinger.de>
Subject: [PATCH 1/3] srf04.c: add maxbotix ultrasonic sensors
Date: Tue, 9 Apr 2019 21:10:22 +0200
Message-ID: <20190409191021.w6phf2q4m2pxcrkq@arbad>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, songqiang1304521@gmail.com, robh@kernel.org, m.othacehe@gmail.com, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

add Maxbotix LV ultrasonic sensor types mb1000, mb1010, mb1020, mb1030
and mb1040

add a configuration struct with the different trigger pulse lengths

Signed-off-by: Andreas Klinger <ak@it-klinger.de>
---
 drivers/iio/proximity/srf04.c | 38 +++++++++++++++++++++++++++++---------
 1 file changed, 29 insertions(+), 9 deletions(-)

diff --git a/drivers/iio/proximity/srf04.c b/drivers/iio/proximity/srf04.c
index 09c7b9c095b0..1bad4018d1aa 100644
--- a/drivers/iio/proximity/srf04.c
+++ b/drivers/iio/proximity/srf04.c
@@ -23,7 +23,7 @@
  * trig:  --+   +------------------------------------------------------
  *          ^   ^
  *          |<->|
- *         udelay(10)
+ *         udelay(trigger_pulse_us)
  *
  * ultra           +-+ +-+ +-+
  * sonic           | | | | | |
@@ -48,6 +48,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/sched.h>
@@ -56,6 +57,10 @@
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
 
+struct srf04_cfg {
+	unsigned long trigger_pulse_us;
+};
+
 struct srf04_data {
 	struct device		*dev;
 	struct gpio_desc	*gpiod_trig;
@@ -66,6 +71,15 @@ struct srf04_data {
 	ktime_t			ts_falling;
 	struct completion	rising;
 	struct completion	falling;
+	const struct srf04_cfg	*cfg;
+};
+
+static const struct srf04_cfg srf04_cfg = {
+	.trigger_pulse_us = 10,
+};
+
+static const struct srf04_cfg mb_lv_cfg = {
+	.trigger_pulse_us = 20,
 };
 
 static irqreturn_t srf04_handle_irq(int irq, void *dev_id)
@@ -102,7 +116,7 @@ static int srf04_read(struct srf04_data *data)
 	reinit_completion(&data->falling);
 
 	gpiod_set_value(data->gpiod_trig, 1);
-	udelay(10);
+	udelay(data->cfg->trigger_pulse_us);
 	gpiod_set_value(data->gpiod_trig, 0);
 
 	/* it cannot take more than 20 ms */
@@ -215,6 +229,18 @@ static const struct iio_chan_spec srf04_chan_spec[] = {
 	},
 };
 
+static const struct of_device_id of_srf04_match[] = {
+	{ .compatible = "devantech,srf04", .data = &srf04_cfg},
+	{ .compatible = "maxbotix,mb1000", .data = &mb_lv_cfg},
+	{ .compatible = "maxbotix,mb1010", .data = &mb_lv_cfg},
+	{ .compatible = "maxbotix,mb1020", .data = &mb_lv_cfg},
+	{ .compatible = "maxbotix,mb1030", .data = &mb_lv_cfg},
+	{ .compatible = "maxbotix,mb1040", .data = &mb_lv_cfg},
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, of_srf04_match);
+
 static int srf04_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -230,6 +256,7 @@ static int srf04_probe(struct platform_device *pdev)
 
 	data = iio_priv(indio_dev);
 	data->dev = dev;
+	data->cfg = of_match_device(of_srf04_match, dev)->data;
 
 	mutex_init(&data->lock);
 	init_completion(&data->rising);
@@ -280,13 +307,6 @@ static int srf04_probe(struct platform_device *pdev)
 	return devm_iio_device_register(dev, indio_dev);
 }
 
-static const struct of_device_id of_srf04_match[] = {
-	{ .compatible = "devantech,srf04", },
-	{},
-};
-
-MODULE_DEVICE_TABLE(of, of_srf04_match);
-
 static struct platform_driver srf04_driver = {
 	.probe		= srf04_probe,
 	.driver		= {
-- 
2.11.0
