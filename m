From: Lorenzo Bianconi <lorenzo.bianconi83-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/5] add support to LSM6DS3H and LSM6DSL
Date: Sun, 29 Jan 2017 11:49:23 +0100
Message-ID: <20170129104928.15533-1-lorenzo.bianconi@st.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lorenzo.bianconi-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

Lorenzo Bianconi (5):
  iio: imu: st_lsm6dsx: add support to multiple devices with the same
    settings
  iio: imu: st_lsm6dsx: add support to lsm6dsl
  Documentation: dt: iio: imu: st_lsm6dsx: add lsm6dsl sensor device
    binding
  iio: imu: st_lsm6dsx: add support to lsm6ds3h
  Documentation: dt: iio: imu: st_lsm6dsx: add lsm6ds3h sensor device
    binding

 .../devicetree/bindings/iio/imu/st_lsm6dsx.txt     |  2 ++
 drivers/iio/imu/st_lsm6dsx/Kconfig                 |  2 +-
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx.h            |  7 +++-
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_buffer.c     |  9 ++---
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_core.c       | 40 ++++++++++++++--------
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_i2c.c        | 10 ++++++
 drivers/iio/imu/st_lsm6dsx/st_lsm6dsx_spi.c        | 10 ++++++
 7 files changed, 59 insertions(+), 21 deletions(-)

-- 
2.9.3
