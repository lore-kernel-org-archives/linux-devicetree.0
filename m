From: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/5] Add support to LIS2DW12 accel sensor
Date: Thu, 17 Aug 2017 19:37:24 +0200
Message-ID: <20170817173729.10899-1-lorenzo.bianconi@st.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lorenzo.bianconi-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Modify management of drdy line and status register in order to support
LIS2DW12 device

Changes since v1:
- remove drdy_irq parameter from LPS001WP settings since the sensor
does not support data-ready interrupts

Lorenzo Bianconi (5):
  iio: st_sensors: decouple irq1 configuration parameters from the irq2
    ones
  iio: st_sensors: do not always write enable_axis register
  iio: st_sensors: add register mask for status register
  iio: accel: add support to LIS2DW12
  dt-bindings: iio: accel: add LIS2DW12 sensor device binding

 .../devicetree/bindings/iio/st-sensors.txt         |   1 +
 drivers/iio/accel/st_accel.h                       |   2 +
 drivers/iio/accel/st_accel_core.c                  | 180 +++++++++++++++++----
 drivers/iio/accel/st_accel_i2c.c                   |   5 +
 drivers/iio/accel/st_accel_spi.c                   |   5 +
 drivers/iio/common/st_sensors/st_sensors_core.c    |  33 ++--
 drivers/iio/common/st_sensors/st_sensors_trigger.c |  16 +-
 drivers/iio/gyro/st_gyro_core.c                    |  33 ++--
 drivers/iio/magnetometer/st_magn_core.c            |  11 +-
 drivers/iio/pressure/st_pressure_core.c            |  46 ++++--
 include/linux/iio/common/st_sensors.h              |  23 ++-
 11 files changed, 265 insertions(+), 90 deletions(-)

-- 
2.14.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
