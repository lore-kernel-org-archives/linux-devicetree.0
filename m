From: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] iio: imu: st_lsm6dsx: support open drain mode
Date: Wed, 21 Jun 2017 21:21:28 +0200
Message-ID: <20170621192129.10226-2-lorenzo.bianconi@st.com>
References: <20170621192129.10226-1-lorenzo.bianconi@st.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170621192129.10226-1-lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lorenzo.bianconi-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add open drain support in order to share requested IRQ line between
st_lsm6dsx device and other peripherals

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-qxv4g6HH51o@public.gmane.org>
---
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c
index 2a72acc6e049..e2737dc71b67 100644
--- a/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c
+++ b/drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c
@@ -31,6 +31,8 @@
 #include <linux/iio/iio.h>
 #include <linux/iio/buffer.h>
 
+#include <linux/platform_data/st_sensors_pdata.h>
+
 #include "st_lsm6dsx.h"
 
 #define ST_LSM6DSX_REG_FIFO_THL_ADDR		0x06
@@ -39,6 +41,8 @@
 #define ST_LSM6DSX_REG_FIFO_DEC_GXL_ADDR	0x08
 #define ST_LSM6DSX_REG_HLACTIVE_ADDR		0x12
 #define ST_LSM6DSX_REG_HLACTIVE_MASK		BIT(5)
+#define ST_LSM6DSX_REG_PP_OD_ADDR		0x12
+#define ST_LSM6DSX_REG_PP_OD_MASK		BIT(4)
 #define ST_LSM6DSX_REG_FIFO_MODE_ADDR		0x0a
 #define ST_LSM6DSX_FIFO_MODE_MASK		GENMASK(2, 0)
 #define ST_LSM6DSX_FIFO_ODR_MASK		GENMASK(6, 3)
@@ -417,6 +421,8 @@ static const struct iio_buffer_setup_ops st_lsm6dsx_buffer_ops = {
 
 int st_lsm6dsx_fifo_setup(struct st_lsm6dsx_hw *hw)
 {
+	struct device_node *np = hw->dev->of_node;
+	struct st_sensors_platform_data *pdata;
 	struct iio_buffer *buffer;
 	unsigned long irq_type;
 	bool irq_active_low;
@@ -444,6 +450,17 @@ int st_lsm6dsx_fifo_setup(struct st_lsm6dsx_hw *hw)
 	if (err < 0)
 		return err;
 
+	pdata = (struct st_sensors_platform_data *)hw->dev->platform_data;
+	if ((np && of_property_read_bool(np, "drive-open-drain")) ||
+	    (pdata && pdata->open_drain)) {
+		err = st_lsm6dsx_write_with_mask(hw, ST_LSM6DSX_REG_PP_OD_ADDR,
+						 ST_LSM6DSX_REG_PP_OD_MASK, 1);
+		if (err < 0)
+			return err;
+
+		irq_type |= IRQF_SHARED;
+	}
+
 	err = devm_request_threaded_irq(hw->dev, hw->irq,
 					st_lsm6dsx_handler_irq,
 					st_lsm6dsx_handler_thread,
-- 
2.13.1
