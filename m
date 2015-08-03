From: Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/2] iio: proximity: add PulsedLight LIDAR sensor support
Date: Sun,  2 Aug 2015 21:27:54 -0700
Message-ID: <1438576076-7890-1-git-send-email-mranostay@gmail.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: marex-ynQEQJNshbs@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, vladimir.barinov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matt Ranostay <mranostay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

PulsedLight "blue label" v2 LIDAR sensor can be polled over 100HZ with
the sysfs + hrtimer iio trigger, or using single raw measurment.

This patchset adds support for this range finding LIDAR module, and reports
distance back in meters to centimeter resolution with +/- 2.5 CM of accuracy
at ~40 meters.

Changesfrom v1:
* Add check for invalid signal return
* Removed un-nedded IIO_CHAN_INFO_CALIBBIAS software biasing
* Mark i2c buffer cacheline aligned
* Added IIO_CHAN_INFO_SCALE for centimeter scale
* Minor tab alignment changes

Matt Ranostay (2):
  devicetree: add PulsedLight vendor prefix
  iio: proximity: add support for PulsedLight LIDAR

 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 drivers/iio/proximity/Kconfig                      |  12 +
 drivers/iio/proximity/Makefile                     |   1 +
 drivers/iio/proximity/lidar.c                      | 284 +++++++++++++++++++++
 4 files changed, 298 insertions(+)
 create mode 100644 drivers/iio/proximity/lidar.c

-- 
1.9.1
