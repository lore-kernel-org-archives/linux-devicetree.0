From: <suravee.suthikulpanit-5C7GfCeVMHo@public.gmane.org>
Subject: [PATCH 0/2 V5] irqchip: gic: Introduce ARM GICv2m MSI(-X) support
Date: Wed, 10 Sep 2014 04:14:59 -0500
Message-ID: <1410340501-30752-1-git-send-email-suravee.suthikulpanit@amd.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: marc.zyngier-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org
Cc: pawel.moll-5wv7dgnIgG8@public.gmane.org, Catalin.Marinas-5wv7dgnIgG8@public.gmane.org, Will.Deacon-5wv7dgnIgG8@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, Harish.Kasiviswanathan-5C7GfCeVMHo@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Suravee Suthikulpanit <Suravee.Suthikulpanit-5C7GfCeVMHo@public.gmane.org>

This patch set introduces support for MSI(-X) in GICv2m specification,
which is implemented in some variation of GIC400.

This depends on and has been tested with the following patch set which
implements PCI supports for ARM64:
 
    * https://lkml.org/lkml/2014/8/12/394
    * https://lkml.org/lkml/2014/8/12/361

Changes in V5:
    * Rebase to git://git.infradead.org/users/jcooper/linux.git irqchip/core

  Marc Zyngier suggestions:
    * Only use GICv2m irq_chip for MSI interrupts.
    * Simplify logic to support multi-MSI in arch/arm64/kernel/msi.c.
    * Modify gicv2m_setup_msi_irq() to also handle multi-MSI.

  Mark Rutlan suggestions: 
    * V4 patch set did not support multiple MSI register frame within a GIC.
      Although, the proposed GICv2m device tree binding should be able to
      handle the case.  Mark was questioning on how we can properly handle
      this in the code. Therefore, I try to implement this by iterating through
      the subnodes and look for msi-controller property. Once found, the code
      parses v2m register frame information and store it in the v2m_list of
      each gic_chip_data.

  Jingoo han suggestions:
    * Misc clean up.

Suravee Suthikulpanit (2):
  irqchip: gic: Add supports for ARM GICv2m MSI(-X)
  irqchip: gicv2m: Add support for multiple MSI for ARM64 GICv2m

 Documentation/devicetree/bindings/arm/gic.txt |  39 +++
 arch/arm64/kernel/Makefile                    |   1 +
 arch/arm64/kernel/msi.c                       |  41 ++++
 drivers/irqchip/Kconfig                       |   7 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-gic-v2m.c                 | 326 ++++++++++++++++++++++++++
 drivers/irqchip/irq-gic.c                     |  88 ++++---
 drivers/irqchip/irq-gic.h                     |  51 ++++
 8 files changed, 526 insertions(+), 28 deletions(-)
 create mode 100644 arch/arm64/kernel/msi.c
 create mode 100644 drivers/irqchip/irq-gic-v2m.c
 create mode 100644 drivers/irqchip/irq-gic.h

-- 
1.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
