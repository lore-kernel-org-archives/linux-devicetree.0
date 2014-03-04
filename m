From: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCHv2 0/9] Convert twl4030-madc to IIO API and add DT support
Date: Tue,  4 Mar 2014 23:05:42 +0100
Message-ID: <1393970751-18157-1-git-send-email-sre@debian.org>
References: <1393702365-26429-1-git-send-email-sre@debian.org>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393702365-26429-1-git-send-email-sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-GFxCN5SEZAc@public.gmane.org>, Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

This is PATCHv2 for converting twl4030-madc to the IIO API and
adding DT support. The plan is to remove the private twl4030-madc
API once all users have been removed or converted to the IIO API.
The patchset compiles and has been tested on my Nokia N900.

Changes since PATCHv1 [0]:
 * Fix warning about unused variable
 * Add IIO_CHAN_INFO_PROCESSED to all channels, since voltage
   channels also need some postprocessing

TODO:
 * Wait for feedback from DT binding maintainers
 * Wait for feedback from Marek Belisko, who is testing the
   changes with twl4030-madc-battery driver on GTA04

[0] https://lkml.org/lkml/2014/3/1/105

-- Sebastian

Sebastian Reichel (9):
  mfd: twl4030-madc: Use managed resources
  mfd: twl4030-madc: Add DT support and convert to IIO framework
  mfd: twl4030-madc: Cleanup driver
  mfd: twl-core: Add twl_i2c_read/write_u16
  mfd: twl4030-madc: Use twl_i2c_read/write_u16 for 16 bit registers
  Documentation: DT: Document twl4030-madc binding
  mfd: twl4030-madc: Move driver to drivers/iio/adc
  iio: documentation: Add ABI documentation for *_mean_raw
  iio: inkern: add iio_read_channel_average_raw

 Documentation/ABI/testing/sysfs-bus-iio            |   8 +
 .../devicetree/bindings/iio/adc/twl4030-madc.txt   |  24 ++
 drivers/iio/adc/Kconfig                            |  10 +
 drivers/iio/adc/Makefile                           |   1 +
 drivers/{mfd => iio/adc}/twl4030-madc.c            | 299 +++++++++++++--------
 drivers/iio/inkern.c                               |  18 ++
 drivers/mfd/Kconfig                                |  10 -
 drivers/mfd/Makefile                               |   1 -
 include/linux/i2c/twl.h                            |  12 +
 include/linux/i2c/twl4030-madc.h                   |   2 +-
 include/linux/iio/consumer.h                       |  13 +
 11 files changed, 274 insertions(+), 124 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/twl4030-madc.txt
 rename drivers/{mfd => iio/adc}/twl4030-madc.c (75%)

-- 
1.9.0
