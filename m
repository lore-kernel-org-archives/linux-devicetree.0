From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 00/12] mfd: Add support for Clocksource to LPC set
Date: Tue, 12 May 2015 13:58:08 +0100
Message-ID: <1431435500-22899-1-git-send-email-lee.jones@linaro.org>
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org
Cc: kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

ST's Low Power Controller (LPC) controls three devices; watchdog, RTC
and a Clocksource Timer.  Only one of the devices can be used at any
one time, which is enforced by the Device Driver model.
 
This patchset provides support for the Clocksource driver.  Watchdog
and RTC are already in -next.

Lee Jones (12):
  mfd: dt-bindings: Provide human readable define for Clocksource mode
  clocksource: sti: Provide support for the ST LPC Clocksource IP
  clocksource: sti: Provide 'use timer as sched clock' capability
  clocksource: bindings: Provide bindings for ST's LPC Clocksource
    device
  watchdog: st_wdt: Update IP layout information to include Clocksource
  watchdog: bindings: Supply knowledge of a third supported device -
    clocksource
  rtc: st: Update IP layout information to include Clocksource
  rtc: bindings: Supply knowledge of a third supported device -
    clocksource
  MAINTAINERS: Add the LPC Clocksource to STi maintained driver list
  ARM: STi: DT: STih407: Switch LPC mode from RTC to Clocksource
  ARM: STi: Enable LPC Clocksource
  ARM: STi: Update platform level menuconfig 'help'

 .../devicetree/bindings/rtc/rtc-st-lpc.txt         |  15 ++-
 .../devicetree/bindings/timer/st,stih407-lpc       |  28 +++++
 .../devicetree/bindings/watchdog/st_lpc_wdt.txt    |  12 +-
 MAINTAINERS                                        |   1 +
 arch/arm/boot/dts/stih407-family.dtsi              |   2 +-
 arch/arm/mach-sti/Kconfig                          |  10 +-
 drivers/clocksource/Kconfig                        |   9 ++
 drivers/clocksource/Makefile                       |   1 +
 drivers/clocksource/clksrc_st_lpc.c                | 129 +++++++++++++++++++++
 drivers/rtc/rtc-st-lpc.c                           |   2 +-
 drivers/watchdog/st_lpc_wdt.c                      |   2 +-
 include/dt-bindings/mfd/st-lpc.h                   |   1 +
 12 files changed, 194 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/timer/st,stih407-lpc
 create mode 100644 drivers/clocksource/clksrc_st_lpc.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
