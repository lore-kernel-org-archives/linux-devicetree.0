From: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 00/10] irqchip: lpc32xx: add LPC32xx irqchip driver
Date: Fri, 20 Nov 2015 03:28:35 +0200
Message-ID: <1447982925-30138-1-git-send-email-vz@mleia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

The change adds wakeup controller platform driver and irqchip driver
for NXP LPC32xx boards.

The changeset has dependencies on the recent updates to LPC32xx DTS:
 * http://permalink.gmane.org/gmane.linux.ports.arm.kernel/456304
 * Recent LPC32xx CCF series (no link at the moment)

Vladimir Zapolskiy (10):
  dt-bindings: create arm/nxp folder and move LPC32xx SoC description to it
  dt-bindings: nxp: add description of wakeup controller on LPC32xx
  dt-bindings: interrupt-controllers: add description of SIC1 and SIC2
  arm: lpc32xx: add wakeup platform driver
  arm: dts: lpc32xx: assign interrupt types
  arm: dts: lpc32xx: add description of IC wakeup controllers
  arm: dts: lpc32xx: reparent SIC1 and SIC2 interrupts from MIC
  irqchip: add LPC32xx interrupt controller driver
  irqchip: lpc32xx: add option to wakeup from an interrupt
  arm: dts: lpc32xx: enable SIC1 and SIC2 by default

 Documentation/devicetree/bindings/arm/lpc32xx.txt  |   8 -
 .../devicetree/bindings/arm/nxp/lpc32xx.txt        |   8 +
 .../bindings/arm/nxp/nxp,lpc3220-wakeup.txt        |  41 +++
 .../interrupt-controller/nxp,lpc3220-mic.txt       |  99 +++++--
 arch/arm/Kconfig                                   |   2 +
 arch/arm/boot/dts/lpc32xx.dtsi                     | 139 ++++++---
 arch/arm/mach-lpc32xx/Makefile                     |   4 +-
 arch/arm/mach-lpc32xx/include/mach/wakeup.h        |  21 ++
 arch/arm/mach-lpc32xx/phy3250.c                    |   1 -
 arch/arm/mach-lpc32xx/wakeup.c                     | 144 +++++++++
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-lpc32xx.c                      | 326 +++++++++++++++++++++
 12 files changed, 723 insertions(+), 71 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/lpc32xx.txt
 create mode 100644 Documentation/devicetree/bindings/arm/nxp/lpc32xx.txt
 create mode 100644 Documentation/devicetree/bindings/arm/nxp/nxp,lpc3220-wakeup.txt
 create mode 100644 arch/arm/mach-lpc32xx/include/mach/wakeup.h
 create mode 100644 arch/arm/mach-lpc32xx/wakeup.c
 create mode 100644 drivers/irqchip/irq-lpc32xx.c

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
