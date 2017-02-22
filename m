From: Eva Rachel Retuya <eraretuya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 0/4] iio: accel: adxl345: Split driver into core and I2C then add SPI support
Date: Wed, 22 Feb 2017 18:22:57 +0800
Message-ID: <cover.1487757223.git.eraretuya@gmail.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org, daniel.baluta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, amsfield22-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eva Rachel Retuya <eraretuya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset modifies the adxl345 to use regmap. In doing so, we can
easily introduce SPI support and let regmap handle the rest.

Recap of basic features: read_raw for x, y and z axes, scale. After
applying this series, driver now supports the SPI protocol and enumeration
of device via device tree.

Changes from v2:
* Drop PATCH 4 iio: accel: adxl345: Add ACPI support
* Add OF match table on both I2C and SPI files and document them

Changes from v1:
iio: accel: adxl345: Use I2C regmap instead of direct I2C access
* Move other deletions from patch 2 in here -- make it clear what got deleted
  and/or modified that is hard to see previously
* Introduce the driver header file "adxl345.h" here instead of doing it in the
  next patch
* Completely omit traces of i2c_client and let this file (adxl345.c) mirror the
  core file on the next patch.
* Improve debugging print about invalid device ID in probe.
iio: accel: adxl345: Split driver into core and I2C
* Update Kconfig to Jonathan's preferred style
* Improve similarity index from 78% to 100% (rename detection)
iio: accel: adxl345: Add ACPI support
* Correct acpi_device_id: ADX0345 -> ADS0345

Eva Rachel Retuya (4):
  Documentation: dt-bindings: Document ADXL345 accelerometer binding
  iio: accel: adxl345: Use I2C regmap instead of direct I2C access
  iio: accel: adxl345: Split driver into core and I2C
  iio: accel: adxl345: Add SPI support

 .../devicetree/bindings/iio/accel/adxl345.txt      |  38 ++++
 drivers/iio/accel/Kconfig                          |  18 +-
 drivers/iio/accel/Makefile                         |   4 +-
 drivers/iio/accel/adxl345.c                        | 194 ---------------------
 drivers/iio/accel/adxl345.h                        |  18 ++
 drivers/iio/accel/adxl345_core.c                   | 182 +++++++++++++++++++
 drivers/iio/accel/adxl345_i2c.c                    |  81 +++++++++
 drivers/iio/accel/adxl345_spi.c                    |  86 +++++++++
 8 files changed, 423 insertions(+), 198 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/accel/adxl345.txt
 delete mode 100644 drivers/iio/accel/adxl345.c
 create mode 100644 drivers/iio/accel/adxl345.h
 create mode 100644 drivers/iio/accel/adxl345_core.c
 create mode 100644 drivers/iio/accel/adxl345_i2c.c
 create mode 100644 drivers/iio/accel/adxl345_spi.c

-- 
2.7.4
