From: Kurt Kanzenbach <kurt@linutronix.de>
Subject: [PATCH v6 0/2] Add support for Layerscape external interrupt lines
Date: Mon, 23 Sep 2019 12:15:11 +0200
Message-ID: <20190923101513.32719-1-kurt@linutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org, Rasmus Villemoes <rasmus.villemoes@prevas.dk>, devicetree@vger.kernel.org, Kurt Kanzenbach <kurt@linutronix.de>
List-Id: devicetree@vger.kernel.org

Hi,

this is a respin of getting the support for the Layerscape's external interrupt
lines. The last version from Rasmus Villemoes can be found here:

 https://lkml.kernel.org/r/20180223210901.23480-1-rasmus.villemoes@prevas.dk/

Rasmus Villemoes ran out of time, so I prepared v6.

Changes since v5:

 - Rebase to v5.3.0
 - Integrated Thomas Gleixner comments:
   - Adjust order of local variables
   - Use irq_chip_set_type_parent()
   - Cleanup of irq headers
 - Integrated Rob Herring comments:
   - Add #address-cells and #size-cells to parent
 - Use ARCH_LAYERSCAPE, as this feature is not LS1021A specific

It is tested on a Layerscape LS2088A.

Thanks,
Kurt

Rasmus Villemoes (2):
  irqchip: Add support for Layerscape external interrupt lines
  dt/bindings: Add bindings for Layerscape external irqs

 .../interrupt-controller/fsl,ls-extirq.txt    |  47 +++++
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-ls-extirq.c               | 174 ++++++++++++++++++
 3 files changed, 222 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,ls-extirq.txt
 create mode 100644 drivers/irqchip/irq-ls-extirq.c

-- 
2.20.1
