From: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 2/2] hwmon: NTC: add IIO get channel and read support
Date: Mon, 11 Mar 2013 07:39:47 +0530
Message-ID: <1362967787-22557-2-git-send-email-ch.naveen@samsung.com>
References: <1362967787-22557-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <1362967787-22557-1-git-send-email-ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, dg77.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org, naveenkrishna.ch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds the support to work as a iio device.
iio_get_channel and iio_raw_read works.

During the probe ntc driver gets the respective channels of ADC
and uses iio_raw_read calls to get the ADC converted value.

Signed-off-by: Naveen Krishna Chatradhi <ch.naveen-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---

Still not sure about the read_uV function parameter change and placement.

There were a few CamelCase warnings during checkpatch run.
I can clean them if anyone insists.

 drivers/hwmon/ntc_thermistor.c               |   36 +++++++++++++++++++++++++-
 include/linux/platform_data/ntc_thermistor.h |    7 ++++-
 2 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/ntc_thermistor.c b/drivers/hwmon/ntc_thermistor.c
index cfedbd3..1d31260 100644
--- a/drivers/hwmon/ntc_thermistor.c
+++ b/drivers/hwmon/ntc_thermistor.c
@@ -30,6 +30,11 @@
 
 #include <linux/platform_data/ntc_thermistor.h>
 
+#include <linux/iio/iio.h>
+#include <linux/iio/machine.h>
+#include <linux/iio/driver.h>
+#include <linux/iio/consumer.h>
+
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
 
@@ -162,6 +167,28 @@ struct ntc_data {
 	char name[PLATFORM_NAME_SIZE];
 };
 
+static int ntc_adc_read(struct ntc_thermistor_platform_data *pdata)
+{
+	struct iio_channel *channel = pdata->chan;
+	unsigned int result;
+	int val, ret;
+
+	if (!channel)
+		return -EINVAL;
+
+	ret = iio_read_channel_raw(channel, &val);
+	if (ret < 0) {
+		pr_err("read channel() error: %d\n", ret);
+		return ret;
+	}
+
+	/* unit: mV */
+	result = pdata->pullup_uV * (s64) val;
+	result >>= 12;
+
+	return result;
+}
+
 #ifdef CONFIG_OF
 static void ntc_thermistor_parse_dt(struct ntc_thermistor_platform_data *pdata,
 							struct device_node *np)
@@ -173,6 +200,8 @@ static void ntc_thermistor_parse_dt(struct ntc_thermistor_platform_data *pdata,
 		pdata->connect = NTC_CONNECTED_POSITIVE;
 	else /* status change should be possible if not always on. */
 		pdata->connect = NTC_CONNECTED_GROUND;
+
+	pdata->read_uV = ntc_adc_read;
 }
 #else
 static void
@@ -317,7 +346,7 @@ static int ntc_thermistor_get_ohm(struct ntc_data *data)
 		return data->pdata->read_ohm(data->pdev);
 
 	if (data->pdata->read_uV) {
-		read_uV = data->pdata->read_uV(data->pdev);
+		read_uV = data->pdata->read_uV(data->pdata);
 		if (read_uV < 0)
 			return read_uV;
 		return get_ohm_of_thermistor(data, read_uV);
@@ -417,6 +446,8 @@ static int ntc_thermistor_probe(struct platform_device *pdev)
 	if (!data)
 		return -ENOMEM;
 
+	pdata->chan = iio_channel_get(&pdev->dev, NULL);
+
 	data->dev = &pdev->dev;
 	data->pdev = pdev;
 	data->pdata = pdata;
@@ -457,15 +488,18 @@ static int ntc_thermistor_probe(struct platform_device *pdev)
 	return 0;
 err_after_sysfs:
 	sysfs_remove_group(&data->dev->kobj, &ntc_attr_group);
+	iio_channel_release(pdata->chan);
 	return ret;
 }
 
 static int ntc_thermistor_remove(struct platform_device *pdev)
 {
 	struct ntc_data *data = platform_get_drvdata(pdev);
+	struct ntc_thermistor_platform_data *pdata = data->pdata;
 
 	hwmon_device_unregister(data->hwmon_dev);
 	sysfs_remove_group(&data->dev->kobj, &ntc_attr_group);
+	iio_channel_release(pdata->chan);
 	platform_set_drvdata(pdev, NULL);
 
 	return 0;
diff --git a/include/linux/platform_data/ntc_thermistor.h b/include/linux/platform_data/ntc_thermistor.h
index 18f3c3a..671d056 100644
--- a/include/linux/platform_data/ntc_thermistor.h
+++ b/include/linux/platform_data/ntc_thermistor.h
@@ -34,19 +34,24 @@ struct ntc_thermistor_platform_data {
 	 *
 	 * pullup_uV, pullup_ohm, pulldown_ohm, and connect are required to use
 	 * read_uV()
+	 * takes the platform data structure as the parameter
 	 *
 	 * How to setup pullup_ohm, pulldown_ohm, and connect is
 	 * described at Documentation/hwmon/ntc_thermistor
 	 *
 	 * pullup/down_ohm: 0 for infinite / not-connected
+	 *
+	 * iio_channel to communicate with the ADC which the
+	 * thermistor is using for conversion of the analog values.
 	 */
-	int (*read_uV)(struct platform_device *);
+	int (*read_uV)(struct ntc_thermistor_platform_data *);
 	int (*read_ohm)(struct platform_device *);
 	unsigned int pullup_uV;
 
 	unsigned int pullup_ohm;
 	unsigned int pulldown_ohm;
 	enum { NTC_CONNECTED_POSITIVE, NTC_CONNECTED_GROUND } connect;
+	struct iio_channel *chan;
 };
 
 #endif /* _LINUX_NTC_H */
-- 
1.7.9.5
