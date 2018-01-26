From: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 10/16] iio: adc: sun4i-gpadc-iio: add support
 for A83T thermal sensor
Date: Fri, 26 Jan 2018 16:19:35 +0100
Message-ID: <20180126151941.12183-11-embed3d@gmail.com>
References: <20180126151941.12183-1-embed3d@gmail.com>
Reply-To: embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD257DPK24NRBJEOVXJQKGQEIZAORLQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180126151941.12183-1-embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org, hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, rask-SivP7zSAdNDZaaYASwVUlg@public.gmane.org, clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sean-hENCXIMQXOg@public.gmane.org, krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, icenowy-h8G6r0blFSE@public.gmane.org, edu.molinas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, singhalsimran0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds support for the A83T ths sensor.

The A83T does not support interrupts. This seems to be broken.
The calibration data is writen at the begin of the init process.

Signed-off-by: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/iio/adc/sun4i-gpadc-iio.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gpadc-iio.c
index f2e0ec65c53e..b8693afcdbea 100644
--- a/drivers/iio/adc/sun4i-gpadc-iio.c
+++ b/drivers/iio/adc/sun4i-gpadc-iio.c
@@ -170,6 +170,40 @@ static const struct gpadc_data sun8i_h3_ths_data = {
 		SUNXI_THS_TEMP_PERIOD(0x7),
 };
 
+static const struct gpadc_data sun8i_a83t_ths_data = {
+	.temp_offset = -2724,
+	.temp_scale = -70,
+	.temp_data = {SUNXI_THS_TDATA0,
+		SUNXI_THS_TDATA1,
+		SUNXI_THS_TDATA2,
+		0},
+	.sample_start = sunxi_ths_sample_start,
+	.sample_end = sunxi_ths_sample_end,
+	.sensor_count = 3,
+	.supports_nvmem = false,
+	.support_irq = true,
+	.ctrl0_map = SUNXI_THS_ACQ0(0x1f3),
+	.ctrl2_map = SUNXI_THS_ACQ1(0x1f3),
+	.sensor_en_map = SUNXI_THS_TEMP_SENSE_EN0 |
+		SUNXI_THS_TEMP_SENSE_EN1 |
+		SUNXI_THS_TEMP_SENSE_EN2,
+	.filter_map = SUNXI_THS_FILTER_EN |
+		SUNXI_THS_FILTER_TYPE(0x2),
+	.irq_clear_map = SUNXI_THS_INTS_ALARM_INT_0 |
+		SUNXI_THS_INTS_ALARM_INT_1 |
+		SUNXI_THS_INTS_ALARM_INT_2 |
+		SUNXI_THS_INTS_SHUT_INT_0  |
+		SUNXI_THS_INTS_SHUT_INT_1  |
+		SUNXI_THS_INTS_SHUT_INT_2  |
+		SUNXI_THS_INTS_TDATA_IRQ_0 |
+		SUNXI_THS_INTS_TDATA_IRQ_1 |
+		SUNXI_THS_INTS_TDATA_IRQ_2,
+	.irq_control_map = SUNXI_THS_INTC_TDATA_IRQ_EN0 |
+		SUNXI_THS_INTC_TDATA_IRQ_EN1 |
+		SUNXI_THS_INTC_TDATA_IRQ_EN2 |
+		SUNXI_THS_TEMP_PERIOD(0x257),
+};
+
 struct sun4i_gpadc_iio {
 	struct iio_dev			*indio_dev;
 	struct completion		completion;
@@ -672,6 +706,10 @@ static const struct of_device_id sun4i_gpadc_of_id[] = {
 		.compatible = "allwinner,sun8i-h3-ths",
 		.data = &sun8i_h3_ths_data,
 	},
+	{
+		.compatible = "allwinner,sun8i-a83t-ths",
+		.data = &sun8i_a83t_ths_data,
+	},
 	{ /* sentinel */ }
 };
 
-- 
2.11.0
