From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: [PATCH v5 0/3] irqchip: vf610-mscm: add support for MSCM interrupt router
Date: Fri,  6 Feb 2015 20:51:23 +0100
Message-ID: <1423252286-17814-1-git-send-email-stefan@agner.ch>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: marc.zyngier-5wv7dgnIgG8@public.gmane.org, u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org
List-Id: devicetree@vger.kernel.org

So far the MSCM interrupt router was initialized by the boot loader
and configured all interrupts for the Cortex-A5 CPU. There are two
use cases where a proper driver is necessary:
- To run Linux on the Cortex-M4. When the kernel is running on the
  non-preconfigured CPU, the interrupt router need to be configured
  properly.
- To support deeper sleep modes: LPSTOP clears the interrupt router
  configuration, hence a driver needs to restore the configuration
  on resume.

Due to the concernes of using "syscon" for the interrupt router
this 4th version uses device tree bindings which split the MSCM
module into sub-modules.

In detail, the registers inside the MSCM module are grouped:
- 0x40001000-0x4000105C: Processor information e.g. CPU ID
- 0x40001800-0x40001820: CPU2CPU directed interrupt registers
- 0x40001880-0x4000195E: The interrupt router registers
- 0x40001C00-0x40001DDC: ACTZS TrustZone registers

This version of the patchset defines bindings for the first submodule
and combines the second and third submodule into one block. However,
the driver currently does not support the CPU2CPU interrupts. The
fourth submodule is completely left out for now.

Due to this and the better documentation the patchset grew by ~40
lines. I think this bindings honer the quite individual functionality
inside the MSCM better.

Still looking for an ack by device tree folks...

Changes since v4
- Fix config selection in SOC_VF610 (VF610_MSCM => VF610_MSCM_IR)

Changes since v3
- Splitted MSCM bindings: MSCM CPU configuration and interrupt router
- Use syscon to access the CPU configuration registers
- Renamed the driver (irq-vf610-mscm => irq-vf610-mscm-ir)
- Extended general and property description of the bindings
- Rebased on v3.19-rc6

Changes since v2
- Use two cell layout for MSCM interrupt router
- Move peripheral interrupt properties to base device tree vfxxx.dtsi
- Use generic two cell xlate (irq_domain_xlate_twocell)
- Add syscon to compatible string
- Remove some line breaks for better readability

Changes since v1 (part of Vybrid Cortex-M4 support)
- Rewrite with irqdomain hierarchy
- Implemented as proper irqchip and move to driver/irqchip/
- Doesn't work on Cortex-M4 anymore (NVIC as parent is not yet
  implemented)

Stefan Agner (3):
  irqchip: vf610-mscm-ir: add support for MSCM interrupt router
  irqchip: vf610-mscm: dt-bindings: add MSCM bindings
  ARM: dts: vf610: add Miscellaneous System Control Module (MSCM)

 .../arm/freescale/fsl,vf610-mscm-cpucfg.txt        |  14 ++
 .../bindings/arm/freescale/fsl,vf610-mscm-ir.txt   |  33 ++++
 arch/arm/boot/dts/vf500.dtsi                       | 128 +------------
 arch/arm/boot/dts/vfxxx.dtsi                       |  48 +++++
 arch/arm/mach-imx/Kconfig                          |   1 +
 drivers/irqchip/Kconfig                            |  11 ++
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-vf610-mscm-ir.c                | 206 +++++++++++++++++++++
 8 files changed, 318 insertions(+), 124 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/freescale/fsl,vf610-mscm-cpucfg.txt
 create mode 100644 Documentation/devicetree/bindings/arm/freescale/fsl,vf610-mscm-ir.txt
 create mode 100644 drivers/irqchip/irq-vf610-mscm-ir.c

-- 
2.3.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
