From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH v2 0/5] ARM: at91: fix irq_pm_install_action WARNING
Date: Tue, 13 Jan 2015 19:46:16 +0100
Message-ID: <1421174781-4340-1-git-send-email-boris.brezillon@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Commit cab303be91dc47942bc25de33dc1140123540800 [1] introduced a WARN_ON
test which triggers a WARNING backtrace on at91 platforms.
While this WARN_ON is absolutely necessary to warn users that they should
not mix request with and without IRQF_NO_SUSPEND flags on shared IRQs,
there is no easy way to solve this issue on at91 platforms.

The main reason is that the init timer is often using a shared irq line
and thus request this irq with IRQF_NO_SUSPEND flag set, while other
peripherals request the same irq line without this flag.

As suggested by Thomas, the first 2 patches of this series add a dumb
demultiplexer irqchip implementation.
This demuxer takes register to a source interrupt and then forwards
all received interrupts to its children (it they are enabled).

Patches 3 to 5 are here for testing purpose, and should be generalized
to all impacted SoCs if the approach is accepted.

Best Regards,

Boris

Boris Brezillon (5):
  irqchip: add dumb demultiplexer implementation
  irqchip: Add DT binding doc for dumb demuxer chips
  ARM: at91/dt: select DUMB_IRQ_DEMUX for all at91 SoCs
  ARM: at91/dt: add AIC irq1 muxed peripheral id definitions
  ARM: at91/dt: define a dumb irq demultiplexer chip connected on irq1

 .../bindings/interrupt-controller/dumb-demux.txt   |  34 +++++
 arch/arm/boot/dts/at91sam9260.dtsi                 |  26 +++-
 arch/arm/mach-at91/Kconfig                         |   2 +
 drivers/irqchip/Kconfig                            |   4 +
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-dumb-demux.c                   |  70 +++++++++++
 .../dt-bindings/interrupt-controller/atmel-aic.h   |  22 ++++
 include/linux/irq.h                                |  49 ++++++++
 include/linux/irqdomain.h                          |   1 +
 kernel/irq/Kconfig                                 |   5 +
 kernel/irq/Makefile                                |   1 +
 kernel/irq/chip.c                                  |  41 ++++++
 kernel/irq/dumb-demux-chip.c                       | 140 +++++++++++++++++++++
 kernel/irq/handle.c                                |  31 ++++-
 kernel/irq/internals.h                             |   3 +
 15 files changed, 422 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/dumb-demux.txt
 create mode 100644 drivers/irqchip/irq-dumb-demux.c
 create mode 100644 include/dt-bindings/interrupt-controller/atmel-aic.h
 create mode 100644 kernel/irq/dumb-demux-chip.c

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
