From: Sebastien Bourdelin <sebastien.bourdelin-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
Subject: [PATCH 0/6] Add board support for TS-4600
Date: Wed, 14 Dec 2016 18:12:30 -0500
Message-ID: <20161214231237.17496-1-sebastien.bourdelin@savoirfairelinux.com>
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org
Cc: mark-L1vi/lXTdtvnC/t2CciAbw@public.gmane.org, kris-L1vi/lXTdtvnC/t2CciAbw@public.gmane.org, horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, damien.riegel-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org, lucile.quirion-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, suzuki.poulose-5wv7dgnIgG8@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, Sebastien Bourdelin <sebastien.bourdelin-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch serie adds support for the TS-4600 boards rev A and B. These
boards, manufactured by Technologic Systems, are based on an i.MX28.

This serie include the support for the watchdog which could be enable
at Linux boot time depending on the bootloader.

The watchdog and few peripherals are implemented in a FPGA, and can
only be access using a custom GPIOs bit-banged bus which is called the
NBUS by Technologic Systems.
A driver for this bus is also included and used by the watchdog.

Sebastien Bourdelin (6):
  of: documentation: add bindings documentation for TS-4600
  ARM: dts: TS-4600: add basic device tree
  dt-bindings: bus: Add documentation for the Technologic Systems NBUS
  bus: add driver for the Technologic Systems NBUS
  ARM: dts: TS-4600: add NBUS support
  watchdog: ts4600: add driver for TS-4600 watchdog

 .../devicetree/bindings/arm/technologic.txt        |   5 +
 Documentation/devicetree/bindings/bus/ts-nbus.txt  |  50 +++
 .../devicetree/bindings/watchdog/ts4600-wdt.txt    |  16 +
 arch/arm/boot/dts/Makefile                         |   2 +
 arch/arm/boot/dts/imx28-ts4600-common.dtsi         | 126 ++++++
 arch/arm/boot/dts/imx28-ts4600-rev-a.dts           |  22 +
 arch/arm/boot/dts/imx28-ts4600-rev-b.dts           |  22 +
 drivers/bus/Kconfig                                |   9 +
 drivers/bus/Makefile                               |   1 +
 drivers/bus/ts-nbus.c                              | 451 +++++++++++++++++++++
 drivers/watchdog/Kconfig                           |  10 +
 drivers/watchdog/Makefile                          |   1 +
 drivers/watchdog/ts4600_wdt.c                      | 213 ++++++++++
 include/linux/ts-nbus.h                            |  17 +
 14 files changed, 945 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bus/ts-nbus.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/ts4600-wdt.txt
 create mode 100644 arch/arm/boot/dts/imx28-ts4600-common.dtsi
 create mode 100644 arch/arm/boot/dts/imx28-ts4600-rev-a.dts
 create mode 100644 arch/arm/boot/dts/imx28-ts4600-rev-b.dts
 create mode 100644 drivers/bus/ts-nbus.c
 create mode 100644 drivers/watchdog/ts4600_wdt.c
 create mode 100644 include/linux/ts-nbus.h

-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
