From: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 05/16] iio: adc: sun4i-gpadc-iio: rework:
 support clocks and reset
Date: Mon, 29 Jan 2018 00:29:08 +0100
Message-ID: <20180128232919.12639-6-embed3d@gmail.com>
References: <20180128232919.12639-1-embed3d@gmail.com>
Reply-To: embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD257DPK24NRBXFZXHJQKGQENXPXOFY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180128232919.12639-1-embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org, clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sean-hENCXIMQXOg@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, icenowy-h8G6r0blFSE@public.gmane.org, edu.molinas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, singhalsimran0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

For adding newer sensor some basic rework of the code is necessary.

The SoCs after H3 has newer thermal sensor ADCs, which have two clock
inputs (bus clock and sampling clock) and a reset. The registers are
also re-arranged.

This commit reworks the code, adds the process of the clocks and
resets.

Signed-off-by: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
---
 drivers/iio/adc/sun4i-gpadc-iio.c | 71 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gpadc-iio.c
index db57d9fffe48..51ec0104d678 100644
--- a/drivers/iio/adc/sun4i-gpadc-iio.c
+++ b/drivers/iio/adc/sun4i-gpadc-iio.c
@@ -22,6 +22,7 @@
  * shutdown for not being used.
  */
 
+#include <linux/clk.h>
 #include <linux/completion.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
@@ -31,6 +32,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/reset.h>
 #include <linux/thermal.h>
 #include <linux/delay.h>
 
@@ -68,6 +70,9 @@ struct gpadc_data {
 	unsigned int	temp_data;
 	int		(*sample_start)(struct sun4i_gpadc_iio *info);
 	int		(*sample_end)(struct sun4i_gpadc_iio *info);
+	bool		has_bus_clk;
+	bool		has_bus_rst;
+	bool		has_mod_clk;
 };
 
 static const struct gpadc_data sun4i_gpadc_data = {
@@ -127,6 +132,9 @@ struct sun4i_gpadc_iio {
 	atomic_t			ignore_temp_data_irq;
 	const struct gpadc_data		*data;
 	bool				no_irq;
+	struct clk			*bus_clk;
+	struct clk			*mod_clk;
+	struct reset_control		*reset;
 	/* prevents concurrent reads of temperature and ADC */
 	struct mutex			mutex;
 	struct thermal_zone_device	*tzd;
@@ -420,6 +428,10 @@ static int sun4i_gpadc_runtime_suspend(struct device *dev)
 {
 	struct sun4i_gpadc_iio *info = iio_priv(dev_get_drvdata(dev));
 
+	clk_disable(info->mod_clk);
+
+	clk_disable(info->bus_clk);
+
 	return info->data->sample_end(info);
 }
 
@@ -446,6 +458,10 @@ static int sun4i_gpadc_runtime_resume(struct device *dev)
 {
 	struct sun4i_gpadc_iio *info = iio_priv(dev_get_drvdata(dev));
 
+	clk_enable(info->mod_clk);
+
+	clk_enable(info->bus_clk);
+
 	return info->data->sample_start(info);
 }
 
@@ -560,10 +576,59 @@ static int sun4i_gpadc_probe_dt(struct platform_device *pdev,
 		return ret;
 	}
 
+	if (info->data->has_bus_rst) {
+		info->reset = devm_reset_control_get(&pdev->dev, NULL);
+		if (IS_ERR(info->reset)) {
+			ret = PTR_ERR(info->reset);
+			return ret;
+		}
+
+		ret = reset_control_deassert(info->reset);
+		if (ret)
+			return ret;
+	}
+
+	if (info->data->has_bus_clk) {
+		info->bus_clk = devm_clk_get(&pdev->dev, "bus");
+		if (IS_ERR(info->bus_clk)) {
+			ret = PTR_ERR(info->bus_clk);
+			goto assert_reset;
+		}
+
+		ret = clk_prepare_enable(info->bus_clk);
+		if (ret)
+			goto assert_reset;
+	}
+
+	if (info->data->has_mod_clk) {
+		info->mod_clk = devm_clk_get(&pdev->dev, "mod");
+		if (IS_ERR(info->mod_clk)) {
+			ret = PTR_ERR(info->mod_clk);
+			goto disable_bus_clk;
+		}
+
+		/* Running at 6MHz */
+		ret = clk_set_rate(info->mod_clk, 4000000);
+		if (ret)
+			goto disable_bus_clk;
+
+		ret = clk_prepare_enable(info->mod_clk);
+		if (ret)
+			goto disable_bus_clk;
+	}
+
 	if (IS_ENABLED(CONFIG_THERMAL_OF))
 		info->sensor_device = &pdev->dev;
 
 	return 0;
+
+disable_bus_clk:
+	clk_disable_unprepare(info->bus_clk);
+
+assert_reset:
+	reset_control_assert(info->reset);
+
+	return ret;
 }
 
 static int sun4i_gpadc_probe_mfd(struct platform_device *pdev,
@@ -729,6 +794,12 @@ static int sun4i_gpadc_remove(struct platform_device *pdev)
 	if (!info->no_irq)
 		iio_map_array_unregister(indio_dev);
 
+	clk_disable_unprepare(info->mod_clk);
+
+	clk_disable_unprepare(info->bus_clk);
+
+	reset_control_assert(info->reset);
+
 	return 0;
 }
 
-- 
2.11.0
