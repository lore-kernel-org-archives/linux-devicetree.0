From: Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH 0/7] irqchip/irq-bcm283x update for BCM7211
Date: Tue,  1 Oct 2019 15:48:35 -0700
Message-ID: <20191001224842.9382-1-f.fainelli@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, "maintainer:BROADCOM
        BCM281XX/BCM11XXX/BCM216XX ARM ARCHITE..." <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:BROADCOM BCM2835
        ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, "moderated list:BROADCOM BCM2835
        ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hi Marc, Jason, Thomas,

This patch series updates the BCM2835 and BCM2836 interrupt controller
drivers to support BCM7211 which can make use of those drivers in some
configurations where the ARM GIC is muxed out and the legacy ARM
interrupt controller is used instead.

Thank you!

Florian Fainelli (7):
  irqchip: Introduce Kconfig symbol to build irq-bcm283x.c
  dt-bindings: interrupt-controller: Add brcm,bcm7211-armctrl-ic binding
  irqchip/irq-bcm2835: Add support for 7211 interrupt controller
  dt-bindings: interrupt-controller: Add brcm,bcm7211-l1-intc binding
  irqchip/irq-bcm2836: Add support for the 7211 interrupt controller
  irqchip: Build BCM283X_IRQ for ARCH_BRCMSTB
  irqchip/irq-bcm283x: Add registration prints

 .../brcm,bcm2835-armctrl-ic.txt               |  6 +-
 .../brcm,bcm2836-l1-intc.txt                  |  4 +-
 drivers/irqchip/Kconfig                       |  5 +
 drivers/irqchip/Makefile                      |  4 +-
 drivers/irqchip/irq-bcm2835.c                 | 95 ++++++++++++++++---
 drivers/irqchip/irq-bcm2836.c                 | 27 +++++-
 6 files changed, 119 insertions(+), 22 deletions(-)

-- 
2.17.1
