From: Adam Thomson <Adam.Thomson.Opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 0/8] Add initial support for DA9150 Charger & Fuel-Gauge IC
Date: Wed, 11 Jun 2014 12:11:04 +0100
Message-ID: <cover.1402484954.git.Adam.Thomson.Opensource@diasemi.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, support.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch set adds initial support for the Dialog DA9150 Integrated Charger &
Fuel-Gauge IC. The device also provides GPIO and GPADC functionality.

In this patch set the following is provided:
 - MFD Core support and DT bindings documentation.
 - Fix to IIO framework (inkern.c, of_iio_channel_get_by_name()) to correctly
   return NULL for failure cases.
 - IIO GPADC support and DT bindings documentation.
 - Power Supply Charger support and DT bindings documentation.
 - Add Dialog vendor prefix for DT.

 To keep patch submission from being too large, support for GPIO and Fuel-Gauge
 will come after initial support patches are accepted.

 This patch set is baselined against the v3.15 kernel version.

Adam Thomson (8):
  mfd: Add support for DA9150 combined charger & fuel-gauge device
  mfd: da9150: Add DT binding documentation for core
  iio: of_iio_channel_get_by_name() returns non-null pointers for error
    legs
  iio: Add support for DA9150 GPADC
  iio: da9150: Add DT binding documentation for GPADC
  power: Add support for DA9150 Charger
  power: da9150: Add DT binding documentation for charger
  DT: Add vendor prefix for Dialog Semiconductor Ltd.

 .../devicetree/bindings/iio/da9150-gpadc.txt       |   16 +
 Documentation/devicetree/bindings/mfd/da9150.txt   |   53 +
 .../devicetree/bindings/power/da9150-charger.txt   |   29 +
 .../devicetree/bindings/vendor-prefixes.txt        |    1 +
 drivers/iio/adc/Kconfig                            |    9 +
 drivers/iio/adc/Makefile                           |    1 +
 drivers/iio/adc/da9150-gpadc.c                     |  396 +++++++
 drivers/iio/inkern.c                               |    6 +-
 drivers/mfd/Kconfig                                |   12 +
 drivers/mfd/Makefile                               |    2 +
 drivers/mfd/da9150-core.c                          |  398 +++++++
 drivers/mfd/da9150-i2c.c                           |  268 +++++
 drivers/power/Kconfig                              |   23 +
 drivers/power/Makefile                             |    1 +
 drivers/power/da9150-charger.c                     |  790 +++++++++++++
 include/linux/mfd/da9150/charger.h                 |   58 +
 include/linux/mfd/da9150/core.h                    |  125 +++
 include/linux/mfd/da9150/gpadc.h                   |   71 ++
 include/linux/mfd/da9150/pdata.h                   |  148 +++
 include/linux/mfd/da9150/registers.h               | 1160 ++++++++++++++++++++
 20 files changed, 3565 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/da9150-gpadc.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/da9150.txt
 create mode 100644 Documentation/devicetree/bindings/power/da9150-charger.txt
 create mode 100644 drivers/iio/adc/da9150-gpadc.c
 create mode 100644 drivers/mfd/da9150-core.c
 create mode 100644 drivers/mfd/da9150-i2c.c
 create mode 100644 drivers/power/da9150-charger.c
 create mode 100644 include/linux/mfd/da9150/charger.h
 create mode 100644 include/linux/mfd/da9150/core.h
 create mode 100644 include/linux/mfd/da9150/gpadc.h
 create mode 100644 include/linux/mfd/da9150/pdata.h
 create mode 100644 include/linux/mfd/da9150/registers.h

--
1.9.3
