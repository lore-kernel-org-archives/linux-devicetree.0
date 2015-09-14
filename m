From: Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v5 0/4] iio: new chemical sensor framework and channel types
Date: Sun, 13 Sep 2015 20:26:10 -0700
Message-ID: <1442201174-10975-1-git-send-email-mranostay@gmail.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Changes from v4:
* Add IIO_MOD_CO2 and IIO_MOD_VOC modifiers
* Updated IIO_RESISTANCE and IIO_CONCENTRATION documentation
* Moved the decimal point shifting to the scale value versus the reading

Matt Ranostay (4):
  iio: chemical: Add IIO_CONCENTRATION channel type
  iio: resistance: add IIO_RESISTANCE channel type
  devicetree: add SGX Sensortech vendor id
  iio: chemical: add SGX VZ89x VOC sensor support

 Documentation/ABI/testing/sysfs-bus-iio            |  19 ++
 .../ABI/testing/sysfs-bus-iio-chemical-vz89x       |   7 +
 .../devicetree/bindings/i2c/trivial-devices.txt    |   1 +
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 drivers/iio/Kconfig                                |   1 +
 drivers/iio/Makefile                               |   1 +
 drivers/iio/chemical/Kconfig                       |  15 ++
 drivers/iio/chemical/Makefile                      |   6 +
 drivers/iio/chemical/vz89x.c                       | 237 +++++++++++++++++++++
 drivers/iio/industrialio-core.c                    |   4 +
 include/uapi/linux/iio/types.h                     |   4 +
 11 files changed, 296 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-iio-chemical-vz89x
 create mode 100644 drivers/iio/chemical/Kconfig
 create mode 100644 drivers/iio/chemical/Makefile
 create mode 100644 drivers/iio/chemical/vz89x.c

-- 
1.9.1
