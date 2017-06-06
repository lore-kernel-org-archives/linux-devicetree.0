From: Keiji Hayashibara <hayashibara.keiji-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH V2 0/3] add UniPhier watchdog support
Date: Tue,  6 Jun 2017 18:11:31 +0900
Message-ID: <1496740294-12653-1-git-send-email-hayashibara.keiji@socionext.com>
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org
Cc: linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, masami.hiramatsu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jaswinder.singh-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, hayashi.kunihiko-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, owada.kiyoshi-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, Keiji Hayashibara <hayashibara.keiji-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series adds support for watchdog timer implemented on UniPhier LD11 and
LD20 SoCs. This driver supports watchdog and system reset for SoCs.

patch V1
http://www.spinics.net/lists/linux-watchdog/msg11782.html

Changes between V2 and V1
=========================
1. Add barrier code in uniphier_watchdog_ping() and __uniphier_watchdog_start().

 When writing WDTCTRL_CLEAR to WDTCTRL register, WDTCTRL_STATUS is updated
 about 62.5usec(2cycle of 32kHz) later. However, if WDTCTRL_CLEAR is written
 before WDTCTRL_STATUS is updated, it can't reboot as SoC specification.
 Therefore, I added barrier code, it waits until WDTCTRL_STATUS is updated.
   
2. Fix issues according to review comments.

 * Use WDOG_STOP_ON_REBOOT instead of shutdown method of struct platform_driver.
 * Separate uniphier-wdt bindings documentation as a patch.
 * Remove delay.h and add bitops.h header file.
 * Use devm_watchdog_register_device().
 * Remove unnecessary code.

Keiji Hayashibara (3):
  devicetree: add UniPhier WDT devicetree bindings documentation
  watchdog: uniphier: add UniPhier watchdog driver
  arm64: dts: uniphier: add watchdog node for LD11 and LD20

 .../devicetree/bindings/watchdog/uniphier-wdt.txt  |  20 ++
 Documentation/watchdog/watchdog-parameters.txt     |   6 +
 arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi   |   4 +
 arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi   |   4 +
 drivers/watchdog/Kconfig                           |  11 +
 drivers/watchdog/Makefile                          |   1 +
 drivers/watchdog/uniphier_wdt.c                    | 275 +++++++++++++++++++++
 7 files changed, 321 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/uniphier-wdt.txt
 create mode 100644 drivers/watchdog/uniphier_wdt.c

-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
