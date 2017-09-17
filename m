From: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/4] Add support to LIS3DHH accel sensor
Date: Sun, 17 Sep 2017 18:17:08 +0200
Message-ID: <20170917161712.14645-1-lorenzo.bianconi@st.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lorenzo.bianconi-qxv4g6HH51o@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Separate data-ready open-drain configuration parameters for
INT1 and INT2

This patchset depends on 'Add support to LIS2DW12 accel sensor' patchset
not yet applied on testing branch

Lorenzo Bianconi (4):
  iio: st_sensors: split open-drain parameters for irq1 and irq2
  iio: common: st_sensors: check odr address value in
    st_sensors_set_odr()
  iio: accel: add support to LIS3DHH
  dt-bindings: iio: accel: add LIS3DHH device bindings

 .../devicetree/bindings/iio/st-sensors.txt         |  1 +
 drivers/iio/accel/st_accel.h                       |  2 +
 drivers/iio/accel/st_accel_core.c                  | 70 ++++++++++++++++++++--
 drivers/iio/accel/st_accel_spi.c                   |  5 ++
 drivers/iio/common/st_sensors/st_sensors_core.c    | 24 ++++++--
 drivers/iio/pressure/st_pressure_core.c            | 14 +++--
 include/linux/iio/common/st_sensors.h              | 28 +++++----
 7 files changed, 115 insertions(+), 29 deletions(-)

-- 
2.14.1
