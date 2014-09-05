From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v2 00/16] MIPS: GIC device-tree support
Date: Fri,  5 Sep 2014 10:30:02 -0700
Message-ID: <1409938218-9026-1-git-send-email-abrestic@chromium.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jeffrey Deans <jeffrey.deans-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Markos Chandras <markos.chandras-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Paul Burton <paul.burton-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, David Daney <ddaney.cavm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This series add support for mapping and routing GIC interrupts through
the device-tree, which will be used on the upcoming interAptiv-based
Danube SoC.

- Patches 1 and 2 provide improvements to the CPU interrupt controller
  when used with DT.
- Patch 3 exports the MIPS CPU IRQ domain so that the GIC driver can
  use it.
- Patch 4 is a fix for secondary CPU bringup with CPS.
- Patches 5 through 9 are misc. GIC cleanups, including moving the GIC
  driver to drivers/irqchip/.
- Patches 10 through 13 add device-tree support for the GIC.
- Patches 14 through 16 cleanup/fix GIC local interrupt support.

Based on 3.17-rc3 and boot tested on Danube (+ out of tree patches) and
Malta.  Build tested for SEAD-3.  Paul Burton has also tested v1 of this
series with his WIP Malta DT support [0].

Changes from v1:
 - updated bindings to drop third interrupt cell and remove CPU interrupt
   controller as the parent of the GIC
 - moved GIC to drivers/irqchip/
 - other minor fixes/cleanups

[0] https://github.com/paulburton/linux/commits/wip-malta-dt

Andrew Bresticker (16):
  MIPS: Provide a generic plat_irq_dispatch
  MIPS: Set vint handler when mapping CPU interrupts
  MIPS: Export CPU IRQ domain
  MIPS: smp-cps: Enable all hardware interrupts on secondary CPUs
  MIPS: Move GIC to drivers/irqchip/
  MIPS: Move MIPS_GIC_IRQ_BASE into platform irq.h
  irqchip: mips-gic: Implement irq_set_type callback
  irqchip: mips-gic: Implement generic irq_ack/irq_eoi callbacks
  irqchip: mips-gic: Fix gic_set_affinity() return value
  of: Add vendor prefix for MIPS Technologies, Inc.
  of: Add binding document for MIPS GIC
  irqchip: mips-gic: Add device-tree support
  irqchip: mips-gic: Add generic IPI support when using DT
  irqchip: mips-gic: Support local interrupts
  MIPS: GIC: Use local interrupts for timer
  MIPS: Malta: Map GIC local interrupts

 .../bindings/interrupt-controller/mips-gic.txt     |  39 ++
 .../devicetree/bindings/vendor-prefixes.txt        |   1 +
 arch/mips/Kconfig                                  |  10 +-
 arch/mips/include/asm/gic.h                        |  36 ++
 arch/mips/include/asm/irq_cpu.h                    |   2 +
 arch/mips/include/asm/mach-generic/irq.h           |   7 +
 arch/mips/include/asm/mach-sead3/irq.h             |   1 +
 arch/mips/include/asm/mips-boards/maltaint.h       |   2 -
 arch/mips/include/asm/mips-boards/sead3int.h       |   2 -
 arch/mips/kernel/Makefile                          |   1 -
 arch/mips/kernel/cevt-gic.c                        |  16 +-
 arch/mips/kernel/cevt-r4k.c                        |   2 +-
 arch/mips/kernel/irq_cpu.c                         |  32 +-
 arch/mips/kernel/smp-cps.c                         |   4 +-
 arch/mips/kernel/smp-mt.c                          |   4 +-
 arch/mips/mti-malta/malta-int.c                    |  44 ++-
 arch/mips/mti-malta/malta-time.c                   |  10 +-
 drivers/irqchip/Kconfig                            |   4 +
 drivers/irqchip/Makefile                           |   1 +
 .../irq-gic.c => drivers/irqchip/irq-mips-gic.c    | 406 ++++++++++++++++++++-
 20 files changed, 567 insertions(+), 57 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/mips-gic.txt
 rename arch/mips/kernel/irq-gic.c => drivers/irqchip/irq-mips-gic.c (50%)

-- 
2.1.0.rc2.206.gedb03e5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
