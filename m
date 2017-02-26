From: Eva Rachel Retuya <eraretuya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v4 0/4] iio: accel: adxl345: Split driver into core and I2C then add SPI support
Date: Sun, 26 Feb 2017 21:45:03 +0800
Message-ID: <cover.1488115521.git.eraretuya@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org, daniel.baluta-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, amsfield22-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, florian.vaussard-EWQkb/GNqlFyDzI6CaY1VQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eva Rachel Retuya <eraretuya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset modifies the adxl345 to use regmap. In doing so, we can
easily introduce SPI support and let regmap handle the rest.

Recap of basic features: read_raw for x, y and z axes, scale. After
applying this series, driver now supports the SPI protocol and enumeration
of device via device tree.

Changes from v3:
[PATCH 1/4] Documentation: dt-bindings: Document ADXL345 accelerometer binding
* None
[PATCH 2/4] iio: accel: adxl345: Use I2C regmap instead of direct I2C access
* Keep intact I2C client structure which was deleted from v3
* Make use of regmap_get_device to retrieve struct device, use these for
  debugging prints instead of &client->dev.
[PATCH 3/4] iio: accel: adxl345: Split driver into core and I2C
 and
[PATCH 4/4] iio: accel: adxl345: Add SPI support
* Revert to explicit and separate I2C and SPI configuration
* Add OF match table, make it enumerable in ACPI environment (Andy's suggestion)

Changes from v2:
* Drop PATCH 4 iio: accel: adxl345: Add ACPI support
* Add OF match table on both I2C and SPI files and document them

Changes from v1:
[PATCH 1/4]
* Move other deletions from patch 2 in here -- make it clear what got deleted
  and/or modified that is hard to see previously
* Introduce the driver header file "adxl345.h" here instead of doing it in the
  next patch
* Completely omit traces of i2c_client and let this file (adxl345.c) mirror the
  core file on the next patch.
* Improve debugging print about invalid device ID in probe.
[PATCH 2/4]
* Update Kconfig to Jonathan's preferred style
* Improve similarity index from 78% to 100% (rename detection)
[PATCH 4/4]
* Correct acpi_device_id: ADX0345 -> ADS0345

Eva Rachel Retuya (4):
  Documentation: dt-bindings: Document ADXL345 accelerometer binding
  iio: accel: adxl345: Use I2C regmap instead of direct I2C access
  iio: accel: adxl345: Split driver into core and I2C
  iio: accel: adxl345: Add SPI support

 .../devicetree/bindings/iio/accel/adxl345.txt      | 38 +++++++++
 drivers/iio/accel/Kconfig                          | 26 ++++++-
 drivers/iio/accel/Makefile                         |  4 +-
 drivers/iio/accel/adxl345.h                        | 18 +++++
 drivers/iio/accel/{adxl345.c => adxl345_core.c}    | 89 +++++++++-------------
 drivers/iio/accel/adxl345_i2c.c                    | 78 +++++++++++++++++++
 drivers/iio/accel/adxl345_spi.c                    | 83 ++++++++++++++++++++
 7 files changed, 281 insertions(+), 55 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/accel/adxl345.txt
 create mode 100644 drivers/iio/accel/adxl345.h
 rename drivers/iio/accel/{adxl345.c => adxl345_core.c} (62%)
 create mode 100644 drivers/iio/accel/adxl345_i2c.c
 create mode 100644 drivers/iio/accel/adxl345_spi.c

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
