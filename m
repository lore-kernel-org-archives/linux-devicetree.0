From: Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/2] iio:imu:mpu6050 update bindings and add mpu9250 support.
Date: Sun, 26 Mar 2017 12:10:58 +0100
Message-ID: <20170326111100.2571-1-jic23@kernel.org>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Mark.Rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The bindings for this driver are somewhat lagging the current situation.
I have update the existing binding for i2c parts, but not added the spi
binding as yet.  That can follow later.

The main purpose of this series was to add explicit support for the mpu9250,
mostly to avoid the log message that the whoami value does match.
It's also more inituitive to support the part explicitly than to rely on
people reading the datasheet to see they actually have an mpu6500 and ak8975 in
a SIP.

If no one else does the SPI binding doc in the near future I'll get to it
eventually.

Jonathan

Jonathan Cameron (2):
  iio:imu:mpu6050 update i2c bindings to reflect i2c-gate and supported
    parts
  iio:imu:mpu6050 add explicit mpu9250 support

 .../devicetree/bindings/iio/imu/inv_mpu6050.txt    | 23 ++++++++++++++++++++--
 drivers/iio/imu/inv_mpu6050/inv_mpu_core.c         |  6 ++++++
 drivers/iio/imu/inv_mpu6050/inv_mpu_i2c.c          |  5 +++++
 drivers/iio/imu/inv_mpu6050/inv_mpu_iio.h          |  2 ++
 drivers/iio/imu/inv_mpu6050/inv_mpu_spi.c          |  1 +
 5 files changed, 35 insertions(+), 2 deletions(-)

-- 
2.12.0
