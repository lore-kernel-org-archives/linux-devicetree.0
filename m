From: Gyungoh Yoo <gyungoh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/7] Adding Skyworks SKY81452 device drivers
Date: Thu, 28 Aug 2014 19:38:27 +0900
Message-ID: <1409222307-23225-1-git-send-email-jack.yoo@skyworksinc.com>
References: <1407488899-31065-1-git-send-email-jack.yoo@skyworksinc.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1407488899-31065-1-git-send-email-jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gyungoh Yoo <jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch set includes regulator and backlight driver for SKY81452.
Also it includes documents for device tree and module.

v2:
Split the patches for each sub-system.
Added 'reg' attribute for I2C address in device tree documents
Added 'compatible' attribute in child drivers
Renamed CONFIG_SKY81452 to CONFIG_MFD_SKY81452
Changed the dependency from I2C=y to I2C, for CONFIG_MFD_SKY81452
Added message for exception or errors.

Gyungoh Yoo (7):
  Adding Skyworks SKY81452 MFD driver
  Adding Skyworks SKY81452 regulator driver
  Adding Skyworks SKY81452 backlight driver
  Adding SKY81452 MFD device tree bindings document
  Adding SKY81452 regulator device tree bindings document
  Adding SKY81452 backlight device tree bindings document
  Adding SKY81452 backlight document

 Documentation/backlight/sky81452-backlight.txt     |  26 ++
 .../devicetree/bindings/i2c/trivial-devices.txt    |   1 +
 Documentation/devicetree/bindings/mfd/sky81452.txt |  32 ++
 .../bindings/regulator/sky81452-regulator.txt      |  18 ++
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 .../video/backlight/sky81452-backlight.txt         |  24 ++
 drivers/mfd/Kconfig                                |  12 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/sky81452.c                             | 108 +++++++
 drivers/regulator/Kconfig                          |  11 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/sky81452-regulator.c             | 140 +++++++++
 drivers/video/backlight/Kconfig                    |  10 +
 drivers/video/backlight/Makefile                   |   1 +
 drivers/video/backlight/sky81452-backlight.c       | 347 +++++++++++++++++++++
 include/linux/mfd/sky81452.h                       |  32 ++
 include/linux/sky81452-backlight.h                 |  47 +++
 17 files changed, 812 insertions(+)
 create mode 100644 Documentation/backlight/sky81452-backlight.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/sky81452.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/sky81452-regulator.txt
 create mode 100644 Documentation/devicetree/bindings/video/backlight/sky81452-backlight.txt
 create mode 100644 drivers/mfd/sky81452.c
 create mode 100644 drivers/regulator/sky81452-regulator.c
 create mode 100644 drivers/video/backlight/sky81452-backlight.c
 create mode 100644 include/linux/mfd/sky81452.h
 create mode 100644 include/linux/sky81452-backlight.h

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
