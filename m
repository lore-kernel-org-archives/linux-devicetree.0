From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/8] mfd: watchdog: rtc: New driver for ST's LPC IP
Date: Mon, 15 Dec 2014 11:25:30 +0000
Message-ID: <1418642738-17407-1-git-send-email-lee.jones@linaro.org>
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

ST's Low Power Controller (LPC) controls two devices; watchdog and RTC.
Only one of the devices can be used at any one time, which is enforced
by the correlating MFD driver.

This driver set provides everything you need to choose one (and only
one) of the LPC devices to run per I/P block, of which there are two
on the enabled STiH407 h/w.

Lee Jones (8):
  ARM: multi_v7_defconfig: Enable support for ST's LPC Watchdog
  ARM: multi_v7_defconfig: Enable support for ST's LPC RTC
  mfd: bindings: Provide ST bindings for ST's LPC device
  mfd: dt-bindings: Provide human readable defines for LPC mode choosing
  mfd: Add ST's Low Power Controller driver
  watchdog: st_wdt: Add new driver for ST's LPC Watchdog
  rtc: st: add new driver for ST's LPC RTC
  ARM: STi: DT: STiH407: Add Device Tree node for the LPC

 Documentation/devicetree/bindings/mfd/st-lpc.txt |  36 +++
 arch/arm/boot/dts/stih407.dtsi                   |  20 ++
 arch/arm/configs/multi_v7_defconfig              |   2 +
 drivers/mfd/Kconfig                              |   8 +
 drivers/mfd/Makefile                             |   1 +
 drivers/mfd/st-lpc.c                             |  88 ++++++
 drivers/rtc/Kconfig                              |  13 +
 drivers/rtc/Makefile                             |   1 +
 drivers/rtc/rtc-st-lpc.c                         | 330 +++++++++++++++++++++++
 drivers/watchdog/Kconfig                         |  13 +
 drivers/watchdog/Makefile                        |   1 +
 drivers/watchdog/st_wdt.c                        | 312 +++++++++++++++++++++
 include/dt-bindings/mfd/st-lpc.h                 |  15 ++
 13 files changed, 840 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/st-lpc.txt
 create mode 100644 drivers/mfd/st-lpc.c
 create mode 100644 drivers/rtc/rtc-st-lpc.c
 create mode 100644 drivers/watchdog/st_wdt.c
 create mode 100644 include/dt-bindings/mfd/st-lpc.h

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
