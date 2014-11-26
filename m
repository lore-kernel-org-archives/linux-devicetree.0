From: Naidu Tellapati <naidu.tellapati-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v6 0/2] watchdog: Add support for ImgTec PowerDown Controller Watchdog Timer
Date: Wed, 26 Nov 2014 14:56:32 +0530
Message-ID: <1416993994-8456-1-git-send-email-Naidu.Tellapati@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, ezequiel.garcia-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, james.hartley-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, james.hogan-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, arul.ramasamy-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, jude.abraham-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org, Naidu Tellapati <Naidu.Tellapati-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patchset provides support for the PowerDown Controller (PDC) Watchdog Timer
found on Pistachio SOC from Imagination Technologies (ImgTec).

The series is based on 3.18-rc5.

Changes from v5:

 * Removed unused struct pdc_wdt_dev variables.

 * Removed out_wdt label in probe function.

Changes from v4:

 * Added warning message if initial timeout value exceeds maximum timeout.

Changes from v3:

 * Removed PDC_WD_MAX_DELAY.

 * Removed spinlock.

 * Removed timeout check inside pdc_wdt_set_timeout function.

 * Changed identity to IMG PDC Watchdog.

 * Removed pdc_wdt_set_timeout call from the probe function.

 * Removed pdc_wdt_shutdown function call from pdc_wdt_remove function
   and added pdc_wdt_stop function call instead.

Changes from v2:

 * Removed interrupt.h header file.

 * Removed clock rate-change notifier callback.

Changes from v1:

 * Arranged all include files in alphabetical order.

 * Arranged register field masks/shifts defines next to their
   corresponding register

 * Registered clock rate-change notifier callback.

 * Removed all references to 32 kHz fixed clock rate.
   Now the clock rate is read dynamically using clk_get_rate().

 * Defined a macro PDC_WD_CONFIG_ENABLE.

 * Added code for getting system clock.

 * Moved module_param stuffs next to the corresponding variable defines.

 * Added code in the function pdc_wdt_remove for stopping watchdog.

 * Removed MODULE_ALIAS.

 * Removed few unwanted spaces and unwanted blank lines.

Naidu Tellapati (2):
  watchdog: ImgTec PDC Watchdog Timer Driver
  DT: watchdog: Add ImgTec PDC Watchdog Timer binding documentation

 .../devicetree/bindings/watchdog/imgpdc-wdt.txt    |   18 ++
 drivers/watchdog/Kconfig                           |   11 +
 drivers/watchdog/Makefile                          |    1 +
 drivers/watchdog/imgpdc_wdt.c                      |  298 ++++++++++++++++++++
 4 files changed, 328 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/imgpdc-wdt.txt
 create mode 100644 drivers/watchdog/imgpdc_wdt.c

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
