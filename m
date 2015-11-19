From: Mans Rullgard <mans@mansr.com>
Subject: [PATCH 0/2] Support for Sigma Designs SMP86xx interrupt controller
Date: Thu, 19 Nov 2015 18:33:44 +0000
Message-ID: <1447958026-3015-1-git-send-email-mans@mansr.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The Sigma Designs SMP86xx and SMP87xx chips use a secondary interrupt
controller with 64 inputs.  The inputs go to an edge/level detector,
the outputs of which are replicated to three mask blocks, each with a
separate primary IRQ.

These patches add a device tree binding and an irqchip driver for this
controller.

Mans Rullgard (2):
  devicetree: add binding for Sigma Designs SMP86xx interrupt controller
  irqchip: add support for Sigma Designs SMP86xx interrupt controller

 .../interrupt-controller/sigma,smp8642-intc.txt    |  47 +++++
 drivers/irqchip/Kconfig                            |   5 +
 drivers/irqchip/Makefile                           |   1 +
 drivers/irqchip/irq-tangox.c                       | 232 +++++++++++++++++++++
 4 files changed, 285 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/sigma,smp8642-intc.txt
 create mode 100644 drivers/irqchip/irq-tangox.c

-- 
2.6.3
