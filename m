From: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 2/5] iio: st_sensors: do not always write enable_axis register
Date: Wed, 16 Aug 2017 21:13:13 +0200
Message-ID: <20170816191316.11469-3-lorenzo.bianconi@st.com>
References: <20170816191316.11469-1-lorenzo.bianconi@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170816191316.11469-1-lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lorenzo.bianconi-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

New devices (e.g. LIS2DW12) enable all axis by default and do not export
that capability in register map. Check if the enable_axis register
address has been declared in st_sensor_settings map in order to verify if
the driver needs to enable all sensor axis

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
---
 drivers/iio/common/st_sensors/st_sensors_core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/common/st_sensors/st_sensors_core.c b/drivers/iio/common/st_sensors/st_sensors_core.c
index a26217b0604f..6331cc91e02d 100644
--- a/drivers/iio/common/st_sensors/st_sensors_core.c
+++ b/drivers/iio/common/st_sensors/st_sensors_core.c
@@ -221,11 +221,14 @@ EXPORT_SYMBOL(st_sensors_set_enable);
 int st_sensors_set_axis_enable(struct iio_dev *indio_dev, u8 axis_enable)
 {
 	struct st_sensor_data *sdata = iio_priv(indio_dev);
+	int err = 0;
 
-	return st_sensors_write_data_with_mask(indio_dev,
+	if (sdata->sensor_settings->enable_axis.addr)
+		err = st_sensors_write_data_with_mask(indio_dev,
 				sdata->sensor_settings->enable_axis.addr,
 				sdata->sensor_settings->enable_axis.mask,
 				axis_enable);
+	return err;
 }
 EXPORT_SYMBOL(st_sensors_set_axis_enable);
 
-- 
2.14.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
