From: Lucas Stach <l.stach@pengutronix.de>
Subject: [PATCH v2 0/2] imx-irqsteer for real
Date: Fri, 14 Dec 2018 11:22:42 +0100
Message-ID: <20181214102244.21509-1-l.stach@pengutronix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, patchwork-lst@pengutronix.de
List-Id: devicetree@vger.kernel.org

Hi all,

this is a completely reworked submission of the imx-irqsteer driver. The
first version was bugged due to wrong/misleading documentation and buggy
implementation of the downstream driver that only worked correctly with
a very specific DT configuration.

The key information here is that a given SoC can have multiple instances
of the irqsteer controller, which can be connected to mutiple output IRQ
lines, but all the input IRQs to one instance are exclusively steered to
one of the output IRQs (which is called a channel). So it's a flexible
hardware design, were each irqsteer instance needs to be told which
upstream IRQ it should use, instead of this being fixed at SoC design
time.

Also the controller is configurable in the number of input IRQs supported,
but only in groups of 64 IRQs, which has an influence on the register
layout, as status, mask and force registers are packed together. Currently
existing implementations of the irqsteer block have between 1 and 8 IRQ
groups, which the documentation confusingly also calls a channel.

Also there is no per-groups status indication, but only a global status
bit, so the IRQ handling can not be optimized, but all status registers
must be checked.

After figuring out all those bits, the driver turned out to be pretty
simple.

Regards,
Lucas

Lucas Stach (2):
  dt-bindings: irq: add binding for Freescale IRQSTEER multiplexer
  irqchip: add driver for imx-irqsteer controller

 .../interrupt-controller/fsl,irqsteer.txt     |  34 +++
 drivers/irqchip/Kconfig                       |   8 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-imx-irqsteer.c            | 269 ++++++++++++++++++
 4 files changed, 312 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.txt
 create mode 100644 drivers/irqchip/irq-imx-irqsteer.c

-- 
2.19.1
