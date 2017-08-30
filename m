From: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 0/5] Add support to LIS2DW12 accel sensor
Date: Wed, 30 Aug 2017 13:50:38 +0200
Message-ID: <20170830115043.3738-1-lorenzo.bianconi@st.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lorenzo.bianconi-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Modify management of drdy line and status register in order to support
LIS2DW12 device

Changes since v2:
- swap status register patch (3rd in v2) with irq{1,2} definition one
  (1st in v2)
- patchset rebased onto 'fix drdy line configuration for LIS3MDL' patch
Changes since v1:
- remove drdy_irq parameter from LPS001WP settings since the sensor
does not support data-ready interrupts

Lorenzo Bianconi (5):
  iio: st_sensors: add register mask for status register
  iio: st_sensors: decouple irq1 configuration parameters from the irq2
    ones
  iio: st_sensors: do not always write enable_axis register
  iio: accel: add support to LIS2DW12
  dt-bindings: iio: accel: add LIS2DW12 sensor device binding

 .../devicetree/bindings/iio/st-sensors.txt         |   1 +
 drivers/iio/accel/st_accel.h                       |   2 +
 drivers/iio/accel/st_accel_core.c                  | 180 +++++++++++++++++----
 drivers/iio/accel/st_accel_i2c.c                   |   5 +
 drivers/iio/accel/st_accel_spi.c                   |   5 +
 drivers/iio/common/st_sensors/st_sensors_core.c    |  35 ++--
 drivers/iio/common/st_sensors/st_sensors_trigger.c |  16 +-
 drivers/iio/gyro/st_gyro_core.c                    |  33 ++--
 drivers/iio/magnetometer/st_magn_core.c            |  16 +-
 drivers/iio/pressure/st_pressure_core.c            |  46 ++++--
 include/linux/iio/common/st_sensors.h              |  23 ++-
 11 files changed, 270 insertions(+), 92 deletions(-)

-- 
2.14.1
