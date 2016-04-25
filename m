From: Vladimir Zapolskiy <vz-ChpfBGZJDbMAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 0/4] irqchip: lpc32xx: add LPC32xx irqchip driver
Date: Mon, 25 Apr 2016 03:59:50 +0300
Message-ID: <1461545990-25560-1-git-send-email-vz@mleia.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Sylvain Lemieux <slemieux-1xCVI8+nB4ZBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Roland Stigge <stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The change replaces legacy NXP LPC32xx irqchip driver with a new one.

Legacy LPC32xx interrupt controller driver was broken since commit
76ba59f8366f ("genirq: Add irq_domain-aware core IRQ handler"), which
requires a private interrupt handler, otherwise any fired SIC1 generated
interrupt (mapped to MIC hwirq 0) breaks the kernel with the message
"unexpected IRQ trap at vector 00".

Summary of changes from v1 to v2:
* 2 of 10 from v1 changes are found in v4.6 and thus skipped from this
  series,
* removed all changes related to optional property 'wakeup-source',
  which will be needed later on to support interrupts as wakeup sources,
* removed introduced optional property 'interrupt-controller-name',
* moved DTS changes after new driver, new driver alone used with
  old DTS allows to boot LPC32xx boards,
* added a change which actually removes legacy driver,
* improvements in the driver based on a review findings from Marc.
* minor improvements all over the code.

v1 of the changeset can be found here:

   http://www.spinics.net/lists/devicetree/msg103231.html

Vladimir Zapolskiy (4):
  dt-bindings: interrupt-controllers: add description of SIC1 and SIC2
  irqchip: add LPC32xx interrupt controller driver
  arm: dts: lpc32xx: reparent SIC1 and SIC2 interrupts from MIC
  ARM: lpc32xx: remove legacy irq controller driver

 .../interrupt-controller/nxp,lpc3220-mic.txt       |  70 +--
 arch/arm/Kconfig                                   |   2 +
 arch/arm/boot/dts/lpc32xx.dtsi                     |  58 ++-
 arch/arm/mach-lpc32xx/Makefile                     |   2 +-
 arch/arm/mach-lpc32xx/irq.c                        | 477 ---------------------
 arch/arm/mach-lpc32xx/phy3250.c                    |   1 -
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-lpc32xx.c                      | 238 ++++++++++
 8 files changed, 329 insertions(+), 520 deletions(-)
 delete mode 100644 arch/arm/mach-lpc32xx/irq.c
 create mode 100644 drivers/irqchip/irq-lpc32xx.c

-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
