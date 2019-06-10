From: Talel Shenhar <talel@amazon.com>
Subject: [PATCH v4 0/2] Amazon's Annapurna Labs Fabric Interrupt Controller
Date: Mon, 10 Jun 2019 11:34:41 +0300
Message-ID: <1560155683-29584-1-git-send-email-talel@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: nicolas.ferre@microchip.com, jason@lakedaemon.net, marc.zyngier@arm.com, mark.rutland@arm.com, mchehab+samsung@kernel.org, robh+dt@kernel.org, davem@davemloft.net, shawn.lin@rock-chips.com, tglx@linutronix.de, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
Cc: dwmw@amazon.co.uk, benh@kernel.crashing.org, jonnyc@amazon.com, hhhawa@amazon.com, ronenk@amazon.com, hanochu@amazon.com, barakw@amazon.com, Talel Shenhar <talel@amazon.com>
List-Id: devicetree@vger.kernel.org

This series introduces support for Amazon's Annapurna Labs Fabric Interrupt
Controller.

The Amazon's Annapurna Labs FIC (Fabric Interrupt Controller) has 32
inputs/sources. This FIC may be cascaded into another FIC or connected
directly to the main CPU Interrupt Controller (e.g. GIC).

Changes since v3:
=================
- tightened the verification for supported trigger types
- updated dt-binding's example to meet the binding description
  (interrupt-cells to 2)
- added description to interrupt-cells to explain each field
- changed pr_err to pr_debug inside al_fic_irq_set_type in order to allow
  the user to enable printouts for verbose information in case of errors

Changes since v2:
=================
- updated dt-bindings to use proper format for entry name
- removed kernel-doc format style from Copyright
- removed unneeded/misplaced selects from Kconfig
- changed used mmio operation to relaxed flavor
- changed error return value from EPERM to EINVAL int case of attempting to
  reconfigure the FIC after it has been configured
- fixed commenting format
- used drivers define instead of subsystem internals
- moved al_fic_hw_init function to caller
- removed al_fic_wire_get_domain from documentation
- removed argument validation from al_fic_wire_init

Changes since v1:
=================
- removing unused exported APIs
- updating cover letter and commit message accordingly



Talel Shenhar (2):
  dt-bindings: interrupt-controller: Amazon's Annapurna Labs FIC
  irqchip: al-fic: Introduce Amazon's Annapurna Labs Fabric Interrupt
    Controller Driver

 .../interrupt-controller/amazon,al-fic.txt         |  29 +++
 MAINTAINERS                                        |   6 +
 drivers/irqchip/Kconfig                            |   8 +
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-al-fic.c                       | 278 +++++++++++++++++++++
 5 files changed, 322 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.txt
 create mode 100644 drivers/irqchip/irq-al-fic.c

-- 
2.7.4
