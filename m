From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 0/5] Add AMS AS3722 mfd, GPIO, regulator and RTC driver
Date: Fri, 20 Sep 2013 18:00:09 +0530
Message-ID: <1379680214-9143-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series add the driver support for AMS AS3722 PMIC. The driver includes
MFD, GPIO, regulator and RTC.

Changes from V1:
- Remove compatible string from DT for subnode.
- Add macro in regmap.h for definign range.
- Nit cleanups in driver and use module_i2c_driver/module_platform_driver.
- Use linear_range and added regulator_map_* on regulators.
- Move OC configuration to regulator_current limit setting.
- Get rid of clk32k out configuration from RTC. Will add clock driver.


Laxman Dewangan (5):
  regmap: add helper macro to set min/max range of register
  mfd: add support for AMS AS3722 PMIC
  gpio: add support for AMS AS3722 gpio driver
  regulator: as3722: add regulator driver for AMS AS3722
  drivers/rtc/rtc-as3722: add RTC driver

 .../devicetree/bindings/gpio/gpio-as3722.txt       |   62 ++
 Documentation/devicetree/bindings/mfd/as3722.txt   |   47 +
 .../bindings/regulator/as3722-regulator.txt        |   91 ++
 drivers/gpio/Kconfig                               |    6 +
 drivers/gpio/Makefile                              |    1 +
 drivers/gpio/gpio-as3722.c                         |  435 ++++++++++
 drivers/mfd/Kconfig                                |   12 +
 drivers/mfd/Makefile                               |    1 +
 drivers/mfd/as3722.c                               |  448 ++++++++++
 drivers/regulator/Kconfig                          |    8 +
 drivers/regulator/Makefile                         |    1 +
 drivers/regulator/as3722-regulator.c               |  917 ++++++++++++++++++++
 drivers/rtc/Kconfig                                |   10 +
 drivers/rtc/Makefile                               |    1 +
 drivers/rtc/rtc-as3722.c                           |  296 +++++++
 include/linux/mfd/as3722.h                         |  423 +++++++++
 include/linux/regmap.h                             |    2 +
 17 files changed, 2761 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-as3722.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/as3722.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/as3722-regulator.txt
 create mode 100644 drivers/gpio/gpio-as3722.c
 create mode 100644 drivers/mfd/as3722.c
 create mode 100644 drivers/regulator/as3722-regulator.c
 create mode 100644 drivers/rtc/rtc-as3722.c
 create mode 100644 include/linux/mfd/as3722.h

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
