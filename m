From: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [PATCHv1 0/9] Convert twl4030-madc to IIO API and add DT support
Date: Sat,  1 Mar 2014 20:32:36 +0100
Message-ID: <1393702365-26429-1-git-send-email-sre@debian.org>
References: <1393444990-28140-1-git-send-email-sre@debian.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393444990-28140-1-git-send-email-sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-GFxCN5SEZAc@public.gmane.org>, Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

This is PATCHv1 for converting twl4030-madc to the IIO API and
adding DT support. The plan is to remove the private twl4030-madc
API once all users have been removed or converted to the IIO API.
The patchset compiles and has been tested on my Nokia N900.

Changes since RFCv4 [0]:
 * Fixup all stuff found by Lee Jones and Jonathan Cameron
   in RFCv4.
   - Fixup kerneldoc comments
   - Move ARRAY_SIZE() into correct patch. I accidently rebased
     it into the wrong one.
   - Use sizeof(*madc) instead of sizeof(struct twl4030_madc_data)
   - Only call of_property_read_bool() if there is no pdata
   - I left the brackets in "reg_base + (2 * i)". They have
     been requested by Lee Jones and I think they make it easier
     to understand what is going on.
 * Add a bunch of Acked-By statements from those two
 * Add new patch, which adds *_mean_raw sysfs ABI documentation
   as requested by Jonathan Cameron
 * Add another patch, which provides iio_read_channel_average_raw(),
   so that drivers using the old API can be converted to the
   IIO API.
 * I switched from RFC to PATCH prefix.

TODO:
 * Wait for feedback from DT binding maintainers
 * Wait for feedback from Marek Belisko, who is testing the
   change with twl4030-madc-battery driver on GTA04

[0] https://lkml.org/lkml/2014/2/26/482

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
 drivers/{mfd => iio/adc}/twl4030-madc.c            | 301 +++++++++++++--------
 drivers/iio/inkern.c                               |  18 ++
 drivers/mfd/Kconfig                                |  10 -
 drivers/mfd/Makefile                               |   1 -
 include/linux/i2c/twl.h                            |  12 +
 include/linux/i2c/twl4030-madc.h                   |   2 +-
 include/linux/iio/consumer.h                       |  13 +
 11 files changed, 276 insertions(+), 124 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/twl4030-madc.txt
 rename drivers/{mfd => iio/adc}/twl4030-madc.c (75%)

-- 
1.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
