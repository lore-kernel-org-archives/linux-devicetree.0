From: Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: [RFCv2 0/5] Convert twl4030-madc to IIO API
Date: Sun, 23 Feb 2014 23:07:46 +0100
Message-ID: <1393193271-16717-1-git-send-email-sre@debian.org>
References: <20140223220140.GA1258@earth.universe>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140223220140.GA1258-SfvFxonMDyemK9LvCR3Hrw@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sebastian Reichel <sre-GFxCN5SEZAc@public.gmane.org>, Marek Belisko <marek-xXXSsgcRVICgSpxsJD1C4w@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sebastian Reichel <sre-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

This is RFCv2 for converting twl4030-madc to the IIO API and
adding DT support. The patchset compiles, but has not yet been
tested on real hardware. I plan to convert rx51-battery to the
IIO framework in the near future and test this patchset on my
Nokia N900.

Changes since RFCv1:
 * Add ti,system-uses-second-madc-irq DT property needed by Belisko Marek
 * Fix issues reported by Jonathan Cameron

TODO:
 * Test patchset on real hardware
 * Convert consumer drivers to IIO API
  - rx51-battery
  - twl4030-madc-battery
  - twl4030-madc-hwmon (=> deprecate in favour of iio-hwmon)
 * remove old kernel API from twl4030-madc

-- Sebastian

Sebastian Reichel (5):
  mfd: twl4030-madc: Use managed resources
  mfd: twl4030-madc: Add DT support and convert to IIO framework
  mfd: twl4030-madc: Cleanup driver
  Documentation: DT: Document twl4030-madc binding
  mfd: twl4030-madc: Move driver to drivers/iio/adc

 .../devicetree/bindings/iio/adc/twl4030-madc.txt   |  24 +
 drivers/iio/adc/Kconfig                            |  10 +
 drivers/iio/adc/Makefile                           |   1 +
 drivers/iio/adc/twl4030-madc.c                     | 914 +++++++++++++++++++++
 drivers/mfd/Kconfig                                |  10 -
 drivers/mfd/Makefile                               |   1 -
 drivers/mfd/twl4030-madc.c                         | 818 ------------------
 7 files changed, 949 insertions(+), 829 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/adc/twl4030-madc.txt
 create mode 100644 drivers/iio/adc/twl4030-madc.c
 delete mode 100644 drivers/mfd/twl4030-madc.c

-- 
1.8.5.3
