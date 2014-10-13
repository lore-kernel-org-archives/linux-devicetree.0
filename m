From: Gyungoh Yoo <gyungoh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RESUBMIT PATCH v4 0/8] Add Skyworks SKY81452 device drivers
Date: Mon, 13 Oct 2014 14:47:34 +0900
Message-ID: <1413179262-27636-1-git-send-email-jack.yoo@skyworksinc.com>
References: <1412657745-7812-1-git-send-email-jack.yoo@skyworksinc.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1412657745-7812-1-git-send-email-jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, florian.vaussard-p8DiymsW2f8@public.gmane.org, trivial-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch set includes regulator and backlight driver for SKY81452.
Also it includes documents for device tree and module.
The initial version of sky81452-regulator was applied. Fo this, incremental
patches are included.

v4:
Removed MODULE_VERSION()
Modified license to GPLv2
Removed calling to backlight_device_unregister() in sky81452-backlight

v3:
Cleaned-up DBG messages
Cleaned-up DT
Fixed the backlight name from 'sky81452-bl' to 'sky81452-backlight'
Assigned mfd_cell.of_compatible for binding device node
Modified error messages
Modified sky81452-regulator to return ENODATA when of_node is NULL

v2:
Split the patches for each sub-system
Added 'reg' attribute for I2C address in device tree documents
Added 'compatible' attribute in child drivers
Renamed CONFIG_SKY81452 to CONFIG_MFD_SKY81452
Changed the dependency from I2C=y to I2C, for CONFIG_MFD_SKY81452
Added message for exception or errors.
Added vendor prefix for Skyworks Solutions, Inc.
Add SKY81452 to the Trivial Devices list

Gyungoh Yoo (8):
  mfd: Add support for Skyworks SKY81452 driver
  backlight: Add support Skyworks SKY81452 backlight driver
  devicetree: mfd: Add new SKY81452 mfd binding
  devicetree: backlight: Add new SKY81452 backlight binding
  devicetree: Add vendor prefix for Skyworks Solutions, Inc.
  devicetree: i2c: Add SKY81452 to the Trivial Devices list
  regulator: sky81452: Add compatible string for device binding
  devicetree: regulator: sky81452: Add compatible string for device
    binding

 .../devicetree/bindings/i2c/trivial-devices.txt    |   1 +
 Documentation/devicetree/bindings/mfd/sky81452.txt |  32 ++
 .../bindings/regulator/sky81452-regulator.txt      |   8 +
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 .../video/backlight/sky81452-backlight.txt         |  24 ++
 drivers/mfd/Kconfig                                |  12 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/sky81452.c                             | 110 +++++++
 drivers/regulator/Kconfig                          |   2 +-
 drivers/regulator/sky81452-regulator.c             |  23 +-
 drivers/video/backlight/Kconfig                    |  10 +
 drivers/video/backlight/Makefile                   |   1 +
 drivers/video/backlight/sky81452-backlight.c       | 344 +++++++++++++++++++++
 include/linux/mfd/sky81452.h                       |  32 ++
 include/linux/sky81452-backlight.h                 |  47 +++
 15 files changed, 640 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/sky81452.txt
 create mode 100644 Documentation/devicetree/bindings/video/backlight/sky81452-backlight.txt
 create mode 100644 drivers/mfd/sky81452.c
 create mode 100644 drivers/video/backlight/sky81452-backlight.c
 create mode 100644 include/linux/mfd/sky81452.h
 create mode 100644 include/linux/sky81452-backlight.h

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
