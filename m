From: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 4/4] iio: pressure: st_pressure_spi: add OF capability to st_pressure_spi
Date: Tue, 27 Jun 2017 00:53:46 +0200
Message-ID: <20170626225346.12019-5-lorenzo.bianconi@st.com>
References: <20170626225346.12019-1-lorenzo.bianconi@st.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170626225346.12019-1-lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lorenzo.bianconi-qxv4g6HH51o@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add device tree support for LPS22HB, LPS25H, LPS331AP, LPS001WP
pressure sensors

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
---
 drivers/iio/pressure/st_pressure_spi.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/iio/pressure/st_pressure_spi.c b/drivers/iio/pressure/st_pressure_spi.c
index 550508025af1..f5ebd36bb4bf 100644
--- a/drivers/iio/pressure/st_pressure_spi.c
+++ b/drivers/iio/pressure/st_pressure_spi.c
@@ -18,6 +18,36 @@
 #include <linux/iio/common/st_sensors_spi.h>
 #include "st_pressure.h"
 
+#ifdef CONFIG_OF
+/*
+ * For new single-chip sensors use <device_name> as compatible string.
+ * For old single-chip devices keep <device_name>-press to maintain
+ * compatibility
+ */
+static const struct of_device_id st_press_of_match[] = {
+	{
+		.compatible = "st,lps001wp-press",
+		.data = LPS001WP_PRESS_DEV_NAME,
+	},
+	{
+		.compatible = "st,lps25h-press",
+		.data = LPS25H_PRESS_DEV_NAME,
+	},
+	{
+		.compatible = "st,lps331ap-press",
+		.data = LPS331AP_PRESS_DEV_NAME,
+	},
+	{
+		.compatible = "st,lps22hb-press",
+		.data = LPS22HB_PRESS_DEV_NAME,
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, st_press_of_match);
+#else
+#define st_press_of_match	NULL
+#endif
+
 static int st_press_spi_probe(struct spi_device *spi)
 {
 	struct iio_dev *indio_dev;
@@ -30,6 +60,8 @@ static int st_press_spi_probe(struct spi_device *spi)
 
 	press_data = iio_priv(indio_dev);
 
+	st_sensors_of_name_probe(&spi->dev, st_press_of_match,
+				 spi->modalias, sizeof(spi->modalias));
 	st_sensors_spi_configure(indio_dev, spi, press_data);
 
 	err = st_press_common_probe(indio_dev);
@@ -58,6 +90,7 @@ MODULE_DEVICE_TABLE(spi, st_press_id_table);
 static struct spi_driver st_press_driver = {
 	.driver = {
 		.name = "st-press-spi",
+		.of_match_table = of_match_ptr(st_press_of_match),
 	},
 	.probe = st_press_spi_probe,
 	.remove = st_press_spi_remove,
-- 
2.13.1
