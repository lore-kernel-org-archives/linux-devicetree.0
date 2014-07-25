From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH 0/6] ARM RealView DeviceTree support v4
Date: Fri, 25 Jul 2014 15:23:42 +0200
Message-ID: <1406294628-16079-1-git-send-email-linus.walleij@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

As it says, now that v3.16 has settled and my infrastructure is
in place, I've updated the RealView DeviceTree patch. Starting
to look good: we can now push almost everything down into
different driver subsystems, have a look.

Linus Walleij (6):
  leds: add a driver for syscon-based LEDs
  leds: add device tree bindings for syscon LEDs
  power: reset: driver for the Versatile syscon reboot
  power: reset: DT bindings for the Versatile reset driver
  soc: add driver for the ARM RealView
  ARM: realview: basic device tree implementation

 Documentation/devicetree/bindings/arm/arm-boards   |  66 ++++++
 Documentation/devicetree/bindings/arm/gic.txt      |   1 +
 .../devicetree/bindings/leds/leds-syscon.txt       |  83 +++++++
 .../bindings/reset/arm-versatile-reboot.txt        |  18 ++
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/arm-realview-pb1176.dts          | 240 +++++++++++++++++++++
 arch/arm/mach-realview/Kconfig                     |  13 ++
 arch/arm/mach-realview/Makefile                    |   1 +
 arch/arm/mach-realview/realview-dt.c               |  72 +++++++
 drivers/irqchip/irq-gic.c                          |   1 +
 drivers/leds/Kconfig                               |  10 +
 drivers/leds/Makefile                              |   1 +
 drivers/leds/leds-syscon.c                         | 152 +++++++++++++
 drivers/power/reset/Kconfig                        |   9 +
 drivers/power/reset/Makefile                       |   1 +
 drivers/power/reset/arm-versatile-reboot.c         | 121 +++++++++++
 drivers/soc/Kconfig                                |   1 +
 drivers/soc/Makefile                               |   1 +
 drivers/soc/versatile/Kconfig                      |  10 +
 drivers/soc/versatile/Makefile                     |   1 +
 drivers/soc/versatile/soc-realview.c               | 144 +++++++++++++
 21 files changed, 947 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-syscon.txt
 create mode 100644 Documentation/devicetree/bindings/reset/arm-versatile-reboot.txt
 create mode 100644 arch/arm/boot/dts/arm-realview-pb1176.dts
 create mode 100644 arch/arm/mach-realview/realview-dt.c
 create mode 100644 drivers/leds/leds-syscon.c
 create mode 100644 drivers/power/reset/arm-versatile-reboot.c
 create mode 100644 drivers/soc/versatile/Kconfig
 create mode 100644 drivers/soc/versatile/Makefile
 create mode 100644 drivers/soc/versatile/soc-realview.c

-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
