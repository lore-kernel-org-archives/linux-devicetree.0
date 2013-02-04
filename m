From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: [PATCH 1/2] iio: Update iio_channel_get API to use consumer device pointer as argument
Date: Mon,  4 Feb 2013 12:26:05 -0800
Message-ID: <1360009566-26347-2-git-send-email-linux@roeck-us.net>
References: <1360009566-26347-1-git-send-email-linux@roeck-us.net>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1360009566-26347-1-git-send-email-linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Anton Vorontsov <cbou-JGs/UdohzUI@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

For iio_channel_get to work with OF based configurations, it needs the
consumer device pointer instead of the consumer device name as argument.

Signed-off-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
---
 drivers/extcon/extcon-adc-jack.c    |    3 +--
 drivers/iio/inkern.c                |   11 ++++++++++-
 drivers/power/generic-adc-battery.c |    4 ++--
 drivers/power/lp8788-charger.c      |    8 ++++----
 include/linux/iio/consumer.h        |    5 +++--
 5 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/extcon/extcon-adc-jack.c b/drivers/extcon/extcon-adc-jack.c
index eda2a1a..d0233cd 100644
--- a/drivers/extcon/extcon-adc-jack.c
+++ b/drivers/extcon/extcon-adc-jack.c
@@ -135,8 +135,7 @@ static int adc_jack_probe(struct platform_device *pdev)
 		;
 	data->num_conditions = i;
 
-	data->chan = iio_channel_get(dev_name(&pdev->dev),
-			pdata->consumer_channel);
+	data->chan = iio_channel_get(&pdev->dev, pdata->consumer_channel);
 	if (IS_ERR(data->chan)) {
 		err = PTR_ERR(data->chan);
 		goto out;
diff --git a/drivers/iio/inkern.c b/drivers/iio/inkern.c
index c42aba6..b289915 100644
--- a/drivers/iio/inkern.c
+++ b/drivers/iio/inkern.c
@@ -93,7 +93,8 @@ static const struct iio_chan_spec
 }
 
 
-struct iio_channel *iio_channel_get(const char *name, const char *channel_name)
+static struct iio_channel *iio_channel_get_sys(const char *name,
+					       const char *channel_name)
 {
 	struct iio_map_internal *c_i = NULL, *c = NULL;
 	struct iio_channel *channel;
@@ -144,6 +145,14 @@ error_no_mem:
 	iio_device_put(c->indio_dev);
 	return ERR_PTR(err);
 }
+
+struct iio_channel *iio_channel_get(struct device *dev,
+				    const char *channel_name)
+{
+	const char *name = dev ? dev_name(dev) : NULL;
+
+	return iio_channel_get_sys(name, channel_name);
+}
 EXPORT_SYMBOL_GPL(iio_channel_get);
 
 void iio_channel_release(struct iio_channel *channel)
diff --git a/drivers/power/generic-adc-battery.c b/drivers/power/generic-adc-battery.c
index 32ce17e..42733c4 100644
--- a/drivers/power/generic-adc-battery.c
+++ b/drivers/power/generic-adc-battery.c
@@ -287,8 +287,8 @@ static int gab_probe(struct platform_device *pdev)
 	 * based on the channel supported by consumer device.
 	 */
 	for (chan = 0; chan < ARRAY_SIZE(gab_chan_name); chan++) {
-		adc_bat->channel[chan] = iio_channel_get(dev_name(&pdev->dev),
-						gab_chan_name[chan]);
+		adc_bat->channel[chan] = iio_channel_get(&pdev->dev,
+							 gab_chan_name[chan]);
 		if (IS_ERR(adc_bat->channel[chan])) {
 			ret = PTR_ERR(adc_bat->channel[chan]);
 		} else {
diff --git a/drivers/power/lp8788-charger.c b/drivers/power/lp8788-charger.c
index 22b6407c..2788908 100644
--- a/drivers/power/lp8788-charger.c
+++ b/drivers/power/lp8788-charger.c
@@ -580,7 +580,7 @@ static void lp8788_irq_unregister(struct platform_device *pdev,
 	}
 }
 
-static void lp8788_setup_adc_channel(const char *consumer_name,
+static void lp8788_setup_adc_channel(struct device *dev,
 				struct lp8788_charger *pchg)
 {
 	struct lp8788_charger_platform_data *pdata = pchg->pdata;
@@ -590,11 +590,11 @@ static void lp8788_setup_adc_channel(const char *consumer_name,
 		return;
 
 	/* ADC channel for battery voltage */
-	chan = iio_channel_get(consumer_name, pdata->adc_vbatt);
+	chan = iio_channel_get(dev, pdata->adc_vbatt);
 	pchg->chan[LP8788_VBATT] = IS_ERR(chan) ? NULL : chan;
 
 	/* ADC channel for battery temperature */
-	chan = iio_channel_get(consumer_name, pdata->adc_batt_temp);
+	chan = iio_channel_get(dev, pdata->adc_batt_temp);
 	pchg->chan[LP8788_BATT_TEMP] = IS_ERR(chan) ? NULL : chan;
 }
 
@@ -704,7 +704,7 @@ static int lp8788_charger_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	lp8788_setup_adc_channel(pdev->name, pchg);
+	lp8788_setup_adc_channel(&pdev->dev, pchg);
 
 	ret = lp8788_psy_register(pdev, pchg);
 	if (ret)
diff --git a/include/linux/iio/consumer.h b/include/linux/iio/consumer.h
index a85787a..833926c 100644
--- a/include/linux/iio/consumer.h
+++ b/include/linux/iio/consumer.h
@@ -31,14 +31,15 @@ struct iio_channel {
 
 /**
  * iio_channel_get() - get description of all that is needed to access channel.
- * @name:		Unique name of the device as provided in the iio_map
+ * @dev:		Pointer to consumer device. Device name must match
+ *			the name of the device as provided in the iio_map
  *			with which the desired provider to consumer mapping
  *			was registered.
  * @consumer_channel:	Unique name to identify the channel on the consumer
  *			side. This typically describes the channels use within
  *			the consumer. E.g. 'battery_voltage'
  */
-struct iio_channel *iio_channel_get(const char *name,
+struct iio_channel *iio_channel_get(struct device *dev,
 				    const char *consumer_channel);
 
 /**
-- 
1.7.9.7
