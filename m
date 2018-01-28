From: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 10/16] iio: adc: sun4i-gpadc-iio: add support
 for A83T thermal sensor
Date: Mon, 29 Jan 2018 00:29:13 +0100
Message-ID: <20180128232919.12639-11-embed3d@gmail.com>
References: <20180128232919.12639-1-embed3d@gmail.com>
Reply-To: embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD257DPK24NRBZNZXHJQKGQEJESQA2A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
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

This patch adds support for the A83T ths sensor.

The A83T supports interrupts. The interrupt is configured to update the
the sensor values every second.

Signed-off-by: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/iio/adc/sun4i-gpadc-iio.c | 38 ++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/sun4i-gpadc.h   | 18 ++++++++++++++++++
 2 files changed, 56 insertions(+)

diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gpadc-iio.c
index 8196203d65fe..9f7895ba1966 100644
--- a/drivers/iio/adc/sun4i-gpadc-iio.c
+++ b/drivers/iio/adc/sun4i-gpadc-iio.c
@@ -170,6 +170,40 @@ static const struct gpadc_data sun8i_h3_ths_data = {
 		SUN8I_H3_THS_TEMP_PERIOD(0x7),
 };
 
+static const struct gpadc_data sun8i_a83t_ths_data = {
+	.temp_offset = -2724,
+	.temp_scale = -70,
+	.temp_data = {SUN8I_H3_THS_TDATA0,
+		SUN8I_A83T_THS_TDATA1,
+		SUN8I_A83T_THS_TDATA2,
+		0},
+	.sample_start = sunxi_ths_sample_start,
+	.sample_end = sunxi_ths_sample_end,
+	.sensor_count = 3,
+	.supports_nvmem = false,
+	.support_irq = true,
+	.ctrl0_map = SUN4I_GPADC_CTRL0_T_ACQ(0x1f3),
+	.ctrl2_map = SUN8I_H3_THS_ACQ1(0x1f3),
+	.sensor_en_map = SUN8I_H3_THS_TEMP_SENSE_EN0 |
+		SUN8I_A83T_THS_TEMP_SENSE_EN1 |
+		SUN8I_A83T_THS_TEMP_SENSE_EN2,
+	.filter_map = SUN4I_GPADC_CTRL3_FILTER_EN |
+		SUN4I_GPADC_CTRL3_FILTER_TYPE(0x2),
+	.irq_clear_map = SUN8I_H3_THS_INTS_ALARM_INT_0 |
+		SUN8I_A83T_THS_INTS_ALARM_INT_1 |
+		SUN8I_A83T_THS_INTS_ALARM_INT_2 |
+		SUN8I_H3_THS_INTS_SHUT_INT_0  |
+		SUN8I_A83T_THS_INTS_SHUT_INT_1  |
+		SUN8I_A83T_THS_INTS_SHUT_INT_2  |
+		SUN8I_H3_THS_INTS_TDATA_IRQ_0 |
+		SUN8I_A83T_THS_INTS_TDATA_IRQ_1 |
+		SUN8I_A83T_THS_INTS_TDATA_IRQ_2,
+	.irq_control_map = SUN8I_H3_THS_INTC_TDATA_IRQ_EN0 |
+		SUN8I_A83T_THS_INTC_TDATA_IRQ_EN1 |
+		SUN8I_A83T_THS_INTC_TDATA_IRQ_EN2 |
+		SUN8I_H3_THS_TEMP_PERIOD(0x257),
+};
+
 struct sun4i_gpadc_iio {
 	struct iio_dev			*indio_dev;
 	struct completion		completion;
@@ -668,6 +702,10 @@ static const struct of_device_id sun4i_gpadc_of_id[] = {
 		.compatible = "allwinner,sun8i-h3-ths",
 		.data = &sun8i_h3_ths_data,
 	},
+	{
+		.compatible = "allwinner,sun8i-a83t-ths",
+		.data = &sun8i_a83t_ths_data,
+	},
 	{ /* sentinel */ }
 };
 
diff --git a/include/linux/mfd/sun4i-gpadc.h b/include/linux/mfd/sun4i-gpadc.h
index 80b79c31cea3..32f15cc03363 100644
--- a/include/linux/mfd/sun4i-gpadc.h
+++ b/include/linux/mfd/sun4i-gpadc.h
@@ -99,21 +99,39 @@
 #define SUNXI_THS_CDATA_0_1				0x74
 #define SUNXI_THS_CDATA_2_3				0x78
 #define SUN8I_H3_THS_TDATA0				0x80
+#define SUN8I_A83T_THS_TDATA1				0x84
+#define SUN8I_A83T_THS_TDATA2				0x88
 
 #define SUN8I_H3_THS_ACQ1(x)				(GENMASK(31, 16) & ((x) << 16))
 
 #define SUN8I_H3_THS_TEMP_SENSE_EN0			BIT(0)
+#define SUN8I_A83T_THS_TEMP_SENSE_EN1			BIT(1)
+#define SUN8I_A83T_THS_TEMP_SENSE_EN2			BIT(2)
 
 #define SUN8I_H3_THS_TEMP_PERIOD(x)			(GENMASK(31, 12) & ((x) << 12))
 
 #define SUN8I_H3_THS_INTS_ALARM_INT_0			BIT(0)
+#define SUN8I_A83T_THS_INTS_ALARM_INT_1			BIT(1)
+#define SUN8I_A83T_THS_INTS_ALARM_INT_2			BIT(2)
 #define SUN8I_H3_THS_INTS_SHUT_INT_0			BIT(4)
+#define SUN8I_A83T_THS_INTS_SHUT_INT_1			BIT(5)
+#define SUN8I_A83T_THS_INTS_SHUT_INT_2			BIT(6)
 #define SUN8I_H3_THS_INTS_TDATA_IRQ_0			BIT(8)
+#define SUN8I_A83T_THS_INTS_TDATA_IRQ_1			BIT(9)
+#define SUN8I_A83T_THS_INTS_TDATA_IRQ_2			BIT(10)
 #define SUN8I_H3_THS_INTS_ALARM_OFF_0			BIT(12)
+#define SUN8I_A83T_THS_INTS_ALARM_OFF_1			BIT(13)
+#define SUN8I_A83T_THS_INTS_ALARM_OFF_2			BIT(14)
 
 #define SUN8I_H3_THS_INTC_ALARM_INT_EN0			BIT(0)
+#define SUN8I_A83T_THS_INTC_ALARM_INT_EN1		BIT(1)
+#define SUN8I_A83T_THS_INTC_ALARM_INT_EN2		BIT(2)
 #define SUN8I_H3_THS_INTC_SHUT_INT_EN0			BIT(4)
+#define SUN8I_A83T_THS_INTC_SHUT_INT_EN1		BIT(5)
+#define SUN8I_A83T_THS_INTC_SHUT_INT_EN2		BIT(6)
 #define SUN8I_H3_THS_INTC_TDATA_IRQ_EN0			BIT(8)
+#define SUN8I_A83T_THS_INTC_TDATA_IRQ_EN1		BIT(9)
+#define SUN8I_A83T_THS_INTC_TDATA_IRQ_EN2		BIT(10)
 
 #define MAX_SENSOR_COUNT				4
 
-- 
2.11.0
